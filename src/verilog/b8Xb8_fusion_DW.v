module b8Xb8_fusion_DW(
  input clk,
  input rst_n,
  input [7:0] in1,
  input [7:0] in2,
  input [19:0] sft0,
  input [19:0] sft1,
  output [19:0] out
);

// p0
wire [13:0] p0,p0_0,p0_1,p0_2,p0_3;
wire [19:0] p0_sft;
bb_2X2_sft U0_0( .sx(in1[7]), .x1(in1[1]), .x0(in1[0]), .sy(in2[7]), .y1(in2[1]), .y0(in2[0]), .sft({sft1[0],sft0[0]}), .out(p0_0) );
bb_2X2_sft U0_1( .sx(in1[7]), .x1(in1[3]), .x0(in1[2]), .sy(in2[7]), .y1(in2[1]), .y0(in2[0]), .sft({sft1[1],sft0[1]}), .out(p0_1) );
bb_2X2_sft U0_2( .sx(in1[7]), .x1(in1[1]), .x0(in1[0]), .sy(in2[7]), .y1(in2[3]), .y0(in2[2]), .sft({sft1[2],sft0[2]}), .out(p0_2) );
bb_2X2_sft U0_3( .sx(in1[7]), .x1(in1[3]), .x0(in1[2]), .sy(in2[7]), .y1(in2[3]), .y0(in2[2]), .sft({sft1[3],sft0[3]}), .out(p0_3) );
//assign p0 = p0_0 + p0_1 + p0_2 + p0_3;
DW02_sum #(4,14) U_p0 (.INPUT({p0_0,p0_1,p0_2,p0_3}), .SUM(p0));
assign p0_sft = 
                ({sft1[16],sft0[16]}==2'b01) ? p0<<2 :
                ({sft1[16],sft0[16]}==2'b10) ? p0<<4 :
                ({sft1[16],sft0[16]}==2'b11) ? p0<<8 :
                p0;

// p1
wire [13:0] p1,p1_0,p1_1,p1_2,p1_3;
wire [19:0] p1_sft;
bb_2X2_sft U1_0( .sx(in1[7]), .x1(in1[5]), .x0(in1[4]), .sy(in2[7]), .y1(in2[1]), .y0(in2[0]), .sft({sft1[4],sft0[4]}), .out(p1_0) );
bb_2X2_sft U1_1( .sx(in1[7]), .x1(in1[7]), .x0(in1[6]), .sy(in2[7]), .y1(in2[1]), .y0(in2[0]), .sft({sft1[5],sft0[5]}), .out(p1_1) );
bb_2X2_sft U1_2( .sx(in1[7]), .x1(in1[5]), .x0(in1[4]), .sy(in2[7]), .y1(in2[3]), .y0(in2[2]), .sft({sft1[6],sft0[6]}), .out(p1_2) );
bb_2X2_sft U1_3( .sx(in1[7]), .x1(in1[7]), .x0(in1[6]), .sy(in2[7]), .y1(in2[3]), .y0(in2[2]), .sft({sft1[7],sft0[7]}), .out(p1_3) );
//assign p1 = p1_0 + p1_1 + p1_2 + p1_3;
DW02_sum #(4,14) U_p1 (.INPUT({p1_0,p1_1,p1_2,p1_3}), .SUM(p1));
assign p1_sft = 
                ({sft1[17],sft0[17]}==2'b01) ? p1<<2 :
                ({sft1[17],sft0[17]}==2'b10) ? p1<<4 :
                ({sft1[17],sft0[17]}==2'b11) ? p1<<8 :
                p1;

// p2
wire [13:0] p2,p2_0,p2_1,p2_2,p2_3;
wire [19:0] p2_sft;
bb_2X2_sft U2_0( .sx(in1[7]), .x1(in1[1]), .x0(in1[0]), .sy(in2[7]), .y1(in2[5]), .y0(in2[4]), .sft({sft1[8],sft0[8]}),   .out(p2_0) );
bb_2X2_sft U2_1( .sx(in1[7]), .x1(in1[3]), .x0(in1[2]), .sy(in2[7]), .y1(in2[5]), .y0(in2[4]), .sft({sft1[9],sft0[9]}),   .out(p2_1) );
bb_2X2_sft U2_2( .sx(in1[7]), .x1(in1[1]), .x0(in1[0]), .sy(in2[7]), .y1(in2[7]), .y0(in2[6]), .sft({sft1[10],sft0[10]}), .out(p2_2) );
bb_2X2_sft U2_3( .sx(in1[7]), .x1(in1[3]), .x0(in1[2]), .sy(in2[7]), .y1(in2[7]), .y0(in2[6]), .sft({sft1[11],sft0[11]}), .out(p2_3) );
//assign p2 = p2_0 + p2_1 + p2_2 + p2_3;
DW02_sum #(4,14) U_p2 (.INPUT({p2_0,p2_1,p2_2,p2_3}), .SUM(p2));
assign p2_sft = 
                ({sft1[18],sft0[18]}==2'b01) ? p2<<2 :
                ({sft1[18],sft0[18]}==2'b10) ? p2<<4 :
                ({sft1[18],sft0[18]}==2'b11) ? p2<<8 :
                p2;

// p3
wire [13:0] p3,p3_0,p3_1,p3_2,p3_3;
wire [19:0] p3_sft;
bb_2X2_sft U3_0( .sx(in1[7]), .x1(in1[5]), .x0(in1[4]), .sy(in2[7]), .y1(in2[5]), .y0(in2[4]), .sft({sft1[12],sft0[12]}), .out(p3_0) );
bb_2X2_sft U3_1( .sx(in1[7]), .x1(in1[7]), .x0(in1[6]), .sy(in2[7]), .y1(in2[5]), .y0(in2[4]), .sft({sft1[13],sft0[13]}), .out(p3_1) );
bb_2X2_sft U3_2( .sx(in1[7]), .x1(in1[5]), .x0(in1[4]), .sy(in2[7]), .y1(in2[7]), .y0(in2[6]), .sft({sft1[14],sft0[14]}), .out(p3_2) );
bb_2X2_sft U3_3( .sx(in1[7]), .x1(in1[7]), .x0(in1[6]), .sy(in2[7]), .y1(in2[7]), .y0(in2[6]), .sft({sft1[15],sft0[15]}), .out(p3_3) );
//assign p3 = p3_0 + p3_1 + p3_2 + p3_3;
DW02_sum #(4,14) U_p3 (.INPUT({p3_0,p3_1,p3_2,p3_3}), .SUM(p3));
assign p3_sft = 
                ({sft1[19],sft0[19]}==2'b01) ? p3<<2 :
                ({sft1[19],sft0[19]}==2'b10) ? p3<<4 :
                ({sft1[19],sft0[19]}==2'b11) ? p3<<8 :
                p3;

reg [19:0] sum;
//assign sum = p0_sft + p1_sft + p2_sft + p3_sft;
DW02_sum #(5,20) U_sum (.INPUT({p0_sft,p1_sft,p2_sft,p3_sft,out}),.SUM(sum));

// psum accumulatioin
reg [19:0] out;
always @ (posedge clk or negedge rst_n) begin
  if (rst_n == 1'b0) begin
    out <= 20'b0;
  end else begin
    out <= sum;
  end
end

endmodule

// 2X2 bit-block + sft with sign-extension
module bb_2X2_sft(
  sx,x1,x0,sy,y1,y0,sft,
  out
);

input sx,x1,x0,sy,y1,y0;
input [1:0] sft;
output [13:0] out;

wire [5:0] prod;
bb_2X2 U0 (.sx(sx), .x1(x1), .x0(x0), .sy(sy), .y1(y1), .y0(y0), .prod(prod));

assign out = 
             (sft==2'b01) ? prod<<2 :
             (sft==2'b10) ? prod<<4 :
             (sft==2'b11) ? prod<<8 :
             prod;

endmodule

// 2X2 bit-block with sign-extension
module bb_2X2 (
  sx,x1,x0,sy,y1,y0,
  prod
);

input sx,x1,x0,sy,y1,y0;
output [5:0] prod;

wire [2:0] x3b;
wire [2:0] y3b;
assign x3b = {x1&sx,x1,x0};
assign y3b = {y1&sy,y1,y0};
assign prod = x3b*y3b;

endmodule
