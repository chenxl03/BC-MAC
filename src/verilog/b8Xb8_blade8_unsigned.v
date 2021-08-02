// 8X8 bit-blade PE
module b8Xb8_blade8_unsigned (
  input clk,
  input rst_n,
  input [31:0] in1,
  input [31:0] in2,
  output [7:0] out
);

// p0
wire [5:0] p0;
wire [3:0] p0_0,p0_1,p0_2,p0_3;
bb_2X2_un U0_0( .x1(in1[1]), .x0(in1[0]), .y1(in2[1]), .y0(in2[0]), .out(p0_0) );
bb_2X2_un U0_1( .x1(in1[3]), .x0(in1[2]), .y1(in2[3]), .y0(in2[2]), .out(p0_1) );
bb_2X2_un U0_2( .x1(in1[5]), .x0(in1[4]), .y1(in2[5]), .y0(in2[4]), .out(p0_2) );
bb_2X2_un U0_3( .x1(in1[7]), .x0(in1[6]), .y1(in2[7]), .y0(in2[6]), .out(p0_3) );
assign p0 = p0_0 + p0_1 + p0_2 + p0_3;

// p1
wire [5:0] p1;
wire [3:0] p1_0,p1_1,p1_2,p1_3;
bb_2X2_un U1_0( .x1(in1[9]),  .x0(in1[8]),  .y1(in2[9]),  .y0(in2[8]),  .out(p1_0) );
bb_2X2_un U1_1( .x1(in1[11]), .x0(in1[10]), .y1(in2[11]), .y0(in2[10]), .out(p1_1) );
bb_2X2_un U1_2( .x1(in1[13]), .x0(in1[12]), .y1(in2[13]), .y0(in2[12]), .out(p1_2) );
bb_2X2_un U1_3( .x1(in1[15]), .x0(in1[14]), .y1(in2[15]), .y0(in2[14]), .out(p1_3) );
assign p1 = p1_0 + p1_1 + p1_2 + p1_3;

// p2
wire [5:0] p2;
wire [3:0] p2_0,p2_1,p2_2,p2_3;
bb_2X2_un U2_0(  .x1(in1[17]), .x0(in1[16]),  .y1(in2[17]), .y0(in2[16]), .out(p2_0) );
bb_2X2_un U2_1(  .x1(in1[19]), .x0(in1[18]),  .y1(in2[19]), .y0(in2[18]), .out(p2_1) );
bb_2X2_un U2_2( .x1(in1[21]), .x0(in1[20]), .y1(in2[21]), .y0(in2[20]), .out(p2_2) );
bb_2X2_un U2_3( .x1(in1[23]), .x0(in1[22]), .y1(in2[23]), .y0(in2[22]), .out(p2_3) );
assign p2 = p2_0 + p2_1 + p2_2 + p2_3;

// p3
wire [5:0] p3;
wire [3:0] p3_0,p3_1,p3_2,p3_3;
bb_2X2_un U3_0( .x1(in1[25]), .x0(in1[24]), .y1(in2[25]), .y0(in2[24]), .out(p3_0) );
bb_2X2_un U3_1( .x1(in1[27]), .x0(in1[26]), .y1(in2[27]), .y0(in2[26]), .out(p3_1) );
bb_2X2_un U3_2( .x1(in1[29]), .x0(in1[28]), .y1(in2[29]), .y0(in2[28]), .out(p3_2) );
bb_2X2_un U3_3( .x1(in1[31]), .x0(in1[30]), .y1(in2[31]), .y0(in2[30]), .out(p3_3) );
assign p3 = p3_0 + p3_1 + p3_2 + p3_3;

// sum of four BB4
wire [7:0] sum;
assign sum = p0 + p1 + p2 + p3;

reg [7:0] out;
always @ (posedge clk or negedge rst_n) begin
  if (rst_n == 1'b0) begin
    out <= 8'b0;
  end else begin
    out <= sum;
  end
end

endmodule

module bb_2X2_un (
  x1,x0,y1,y0,out
);

input x1,x0,y1,y0;
output [3:0] out;

wire [2:0] x3b;
wire [2:0] y3b;
assign x3b = {x1,x0};
assign y3b = {y1,y0};

assign out = x3b*y3b;

endmodule
