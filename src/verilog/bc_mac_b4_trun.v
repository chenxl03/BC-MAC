`timescale 1ns/1ps

module bc_mac_b4_trun (
  input clk,
  input rst_n,
  input [3:0] act0,
  input [3:0] act1,
  input [3:0] act2,
  input [3:0] act3,
  input [3:0] act4,
  input [3:0] act5,
  input [3:0] act6,
  input [3:0] act7,
  input [7:0] weight,
  input [5:0] yi,
  input sft_en,
  input sft_in,
  input trun_in,
  input [3:0] gin,
  output [5:0] yo,
  output [3:0] gout,
  output reg [3:0] sumout,
  output reg [3:0] trunout
);

// PPG, AND gate

wire [7:0] ppg0,ppg1,ppg2,ppg3;

assign ppg0 = {
			weight[0]&act0[0], weight[1]&act1[0], weight[2]&act2[0], weight[3]&act3[0],
			weight[4]&act4[0], weight[5]&act5[0], weight[6]&act6[0], weight[7]&act7[0]
			};
assign ppg1 = {
			weight[0]&act0[1], weight[1]&act1[1], weight[2]&act2[1], weight[3]&act3[1],
			weight[4]&act4[1], weight[5]&act5[1], weight[6]&act6[1], weight[7]&act7[1]
			};
assign ppg2 = {
			weight[0]&act0[2], weight[1]&act1[2], weight[2]&act2[2], weight[3]&act3[2],
			weight[4]&act4[2], weight[5]&act5[2], weight[6]&act6[2], weight[7]&act7[2]
			};
assign ppg3 = {
			weight[0]&act0[3], weight[1]&act1[3], weight[2]&act2[3], weight[3]&act3[3],
			weight[4]&act4[3], weight[5]&act5[3], weight[6]&act6[3], weight[7]&act7[3]
			};

// PPA, bit4 8-2 compressor

wire [1:0] I0_out,I1_out,I2_out,I3_out;
wire [4:0] I0_yo,I1_yo,I2_yo;

cprs_8_2 I0 (.in(ppg0), .yi(yi[4:0]), .out(I0_out), .yo(I0_yo));
cprs_8_2 I1 (.in(ppg1), .yi(I0_yo),   .out(I1_out), .yo(I1_yo));
cprs_8_2 I2 (.in(ppg2), .yi(I1_yo),   .out(I2_out), .yo(I2_yo));
cprs_8_2 I3 (.in(ppg3), .yi(I2_yo),   .out(I3_out), .yo(yo[4:0]));

// save compressed data, 8-2 results
reg [1:0] I0_out_r1,I1_out_r1,I2_out_r1,I3_out_r1;
always @(posedge clk or negedge rst_n) begin
  if (rst_n == 1'b0) begin
    I0_out_r1	<=	2'b00;
    I1_out_r1	<=	2'b00;
    I2_out_r1	<=	2'b00;
    I3_out_r1	<=	2'b00;
  end else begin
    I0_out_r1	<=	I0_out;
    I1_out_r1	<=	I1_out;
    I2_out_r1	<=	I2_out;
    I3_out_r1	<=	I3_out;
  end
end


// segmented final addition with G,G4,G8,G12
// three inputs: cin,I0_out_r1[0],sum_sft


// output reg
wire [3:0] sft_out;
assign sft_out = (sft_en == 1'b1) ? {sft_in,sumout[3:1]} : sumout[3:0];

wire [1:0] I4_out,I5_out,I6_out,I7_out;
cprs_3_2 I4 (.in({yi[5],       I0_out_r1[0],sft_out[0]}), .out(I4_out));
cprs_3_2 I5 (.in({I0_out_r1[1],I1_out_r1[0],sft_out[1]}), .out(I5_out));
cprs_3_2 I6 (.in({I1_out_r1[1],I2_out_r1[0],sft_out[2]}), .out(I6_out));
cprs_3_2 I7 (.in({I2_out_r1[1],I3_out_r1[0],sft_out[3]}), .out(I7_out));
assign yo[5] = I3_out_r1[1];
assign yo[6] = I7_out[1];

wire [3:0] sum,in1,in2;
assign in1 = {I7_out[0],I6_out[0],I5_out[0],I4_out[0]};
assign in2 = {I6_out[1],I5_out[1],I4_out[1],yi[6]};

// group carry-out
group_pg I8 (.in1(in1), .in2(in2), .gin(gin), .gout(gout));

assign cin = gin[0]; // cin should can be any bit from gin
//assign {cout,sum} = in1 + in2 + cin;
//DW01_add #(4) I9 (.A(in1), .B(in2), .CI(cin), .SUM(sum), .CO(cout));
adder4 I9 (.in1(in1), .in2(in2), .cin(cin), .sum(sum), .cout(cout));

// sum register
always @(posedge clk or negedge rst_n) begin
  if (rst_n == 1'b0) begin
    sumout	<= 4'b0;
  end else begin
    sumout	<= sum;
  end
end

// truncted register
always @ (posedge clk or negedge rst_n) begin
  if (rst_n == 1'b0) begin
    trunout	<= 4'b0;
  end else if(sft_en == 1'b1) begin
    trunout	<= {trun_in,trunout[3:1]};
  end
end

endmodule

module adder4(
  input [3:0] in1,
  input [3:0] in2,
  input cin,
  output [3:0] sum,
  output cout
);

DW01_add #(4) I0 (.A(in1), .B(in2), .CI(cin), .SUM(sum), .CO(cout));

endmodule

module cprs_8_2 (
  input [7:0] in,
  input [4:0] yi,
  output [1:0] out,
  output [4:0] yo
);

wire I0_out,I1_out,I2_out,I3_out,I4_out;
wire I0_err,I1_err,I2_err,I3_err,I4_err;

cprs_4_2 I0 (.in(in[7:4]), .out({yo[0],I0_out}), .err(I0_err));
cprs_4_2 I1 (.in(in[3:0]), .out({yo[1],I1_out}), .err(I1_err));

cprs_3_2 I2 (.in({{I0_out,I0_err,yi[0]}}), .out({yo[2],I2_out}));
cprs_3_2 I3 (.in({{I1_out,I1_err,yi[1]}}), .out({yo[3],I3_out}));

cprs_4_2 I4 (.in({I2_out,I3_out,yi[3:2]}), .out({yo[4],I4_out}), .err(I4_err));

cprs_3_2 I5 (.in({I4_out,I4_err,yi[4]}), .out(out[1:0]));

endmodule

module cprs_3_2 (
in,
out
);
input [2:0] in;
output [1:0] out;

wire in0_xor_in1,in0_and_in1;

assign in0_xor_in1	= in[0] ^ in[1];
assign in0_and_in1	= in[0] & in[1];
assign out[1] = in0_xor_in1 & in[2] | in0_and_in1;
assign out[0] = in0_xor_in1 ^ in[2];

endmodule

module cprs_4_2 (
in,
out,
err
);
input [3:0] in;
output [1:0] out;
output err;

wire in0_and_in1,in0_or_in1,in0_xor_in1;

assign in0_and_in1	= in[0] & in[1];
assign in0_or_in1	= in[0] | in[1];
assign in0_xor_in1	= in[0] ^ in[1];

wire in2_or_in3,in2_xor_in3;

assign in2_or_in3	= in[2] | in[3];
assign in2_xor_in3	= in[2] ^ in[3];

assign out[0] = in0_xor_in1 ^ in2_or_in3;
assign out[1] = (in0_or_in1 & in2_or_in3) | in0_and_in1;
assign err = in[2] & in[3];

endmodule

module group_pg (
  input [3:0] in1,
  input [3:0] in2,
  input [3:0] gin,
  output [3:0] gout
);

wire [3:0] carry_g,carry_p,carry;
assign carry_g = {in1[3]&in2[3],in1[2]&in2[2],in1[1]&in2[1],in1[0]&in2[0]};
assign carry_p = {in1[3]|in2[3],in1[2]|in2[2],in1[1]|in2[1],in1[0]|in2[0]};
assign carry[0] = carry_g[0];
assign carry[1] = carry_g[1] + carry_p[1]*carry[0];
assign carry[2] = carry_g[2] + carry_p[2]*carry[1];
assign carry[3] = carry_g[3] + carry_p[3]*carry[2];

wire prop;
assign prop = carry_p[0]&carry_p[1]&carry_p[2]&carry_p[3];

assign gout[0] = carry[3];
assign gout[1] = gout[0] + prop*gin[0];
assign gout[2] = gout[0] + prop*gin[1];
assign gout[3] = gout[0] + prop*gin[2];

endmodule
