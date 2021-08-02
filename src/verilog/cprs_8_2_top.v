`timescale 1ns/1ps

module cprs_8_2_top (
  input clk,
  input rst_n,
  input  [7:0] in0,
  input  [7:0] in1,
  input  [7:0] in2,
  input  [7:0] in3,
  input  [4:0] yi,
  output reg [1:0] out0,
  output reg [1:0] out1,
  output reg [1:0] out2,
  output reg [1:0] out3,
  output [4:0] yo
);

reg [7:0] in0_r1,in1_r1,in2_r1,in3_r1;
reg [4:0] yi_r1;
always @ (posedge clk or negedge rst_n) begin
  if (rst_n == 1'b0) begin
    in0_r1 <= 8'b0;
    in1_r1 <= 8'b0;
    in2_r1 <= 8'b0;
    in3_r1 <= 8'b0;
	yi_r1  <= 5'b0;
  end else begin
    in0_r1 <= in0;
    in1_r1 <= in1;
    in2_r1 <= in2;
    in3_r1 <= in3;
	yi_r1  <= yi;
  end
end

wire [1:0] out0_r0,out1_r0,out2_r0,out3_r0;
wire [4:0] yo_U0,yo_U1,yo_U2;

cprs_8_2 U0 (.in(in0_r1), .yi(yi_r1), .out(out0_r0), .yo(yo_U0));
cprs_8_2 U1 (.in(in1_r1), .yi(yo_U0), .out(out1_r0), .yo(yo_U1));
cprs_8_2 U2 (.in(in2_r1), .yi(yo_U1), .out(out2_r0), .yo(yo_U2));
cprs_8_2 U3 (.in(in3_r1), .yi(yo_U2), .out(out3_r0), .yo(yo));

always @ (posedge clk or negedge rst_n) begin
  if (rst_n == 1'b0) begin
    out0   <= 2'b0;
    out1   <= 2'b0;
    out2   <= 2'b0;
    out3   <= 2'b0;
  end else begin
    out0   <= out0_r0;
    out1   <= out1_r0;
    out2   <= out2_r0;
    out3   <= out3_r0;
  end
end

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
