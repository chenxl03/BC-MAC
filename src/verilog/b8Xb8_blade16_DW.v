// sum of 16*(8X8 bit-blade PE)
module b8Xb8_blade16_DW (
  input clk,
  input rst_n, 
//in1, in2, 
  input [7:0] in1_0  ,
  input [7:0] in1_1  ,
  input [7:0] in1_2  ,
  input [7:0] in1_3  ,
  input [7:0] in1_4  ,
  input [7:0] in1_5  ,
  input [7:0] in1_6  ,
  input [7:0] in1_7  ,
  input [7:0] in1_8  ,
  input [7:0] in1_9  ,
  input [7:0] in1_10 ,
  input [7:0] in1_11 ,
  input [7:0] in1_12 ,
  input [7:0] in1_13 ,
  input [7:0] in1_14 ,
  input [7:0] in1_15 ,
//in1, in2, 
  input [7:0] in2_0  ,
  input [7:0] in2_1  ,
  input [7:0] in2_2  ,
  input [7:0] in2_3  ,
  input [7:0] in2_4  ,
  input [7:0] in2_5  ,
  input [7:0] in2_6  ,
  input [7:0] in2_7  ,
  input [7:0] in2_8  ,
  input [7:0] in2_9  ,
  input [7:0] in2_10 ,
  input [7:0] in2_11 ,
  input [7:0] in2_12 ,
  input [7:0] in2_13 ,
  input [7:0] in2_14 ,
  input [7:0] in2_15 ,
// sign
  input [15:0] sn1,
  input [15:0] sn2,
// sft
  input [15:0] sft0,
  input [15:0] sft1,
  input [15:0] sft2,
// output 
  output [21:0] out
);

// blade_0
reg [9:0] U0_out;
wire [31:0] U0_in1, U0_in2;
assign U0_in1 = { in1_0[1:0],in1_1[1:0],in1_2[1:0],in1_3[1:0],in1_4[1:0],in1_5[1:0],in1_6[1:0],in1_7[1:0],
				  in1_8[1:0],in1_9[1:0],in1_10[1:0],in1_11[1:0],in1_12[1:0],in1_13[1:0],in1_14[1:0],in1_15[1:0] };
assign U0_in2 = { in2_0[1:0],in2_1[1:0],in2_2[1:0],in2_3[1:0],in2_4[1:0],in2_5[1:0],in2_6[1:0],in2_7[1:0],
				  in2_8[1:0],in2_9[1:0],in2_10[1:0],in2_11[1:0],in2_12[1:0],in2_13[1:0],in2_14[1:0],in2_15[1:0] };
b8Xb8_blade U0 (.clk(clk), .rst_n(rst_n), .in1(U0_in1), .in2(U0_in2), .sn1(sn1), .sn2(sn2), .out(U0_out));

// blade_1
reg [9:0]   U1_out;
wire [31:0] U1_in1, U1_in2;
assign U1_in1 = { in1_0[1:0],in1_1[1:0],in1_2[1:0],in1_3[1:0],in1_4[1:0],in1_5[1:0],in1_6[1:0],in1_7[1:0],
				  in1_8[1:0],in1_9[1:0],in1_10[1:0],in1_11[1:0],in1_12[1:0],in1_13[1:0],in1_14[1:0],in1_15[1:0] };
assign U1_in2 = { in2_0[3:2],in2_1[3:2],in2_2[3:2],in2_3[3:2],in2_4[3:2],in2_5[3:2],in2_6[3:2],in2_7[3:2],
				  in2_8[3:2],in2_9[3:2],in2_10[3:2],in2_11[3:2],in2_12[3:2],in2_13[3:2],in2_14[3:2],in2_15[3:2] };
b8Xb8_blade U1 (.clk(clk), .rst_n(rst_n), .in1(U1_in1), .in2(U1_in2), .sn1(sn1), .sn2(sn2), .out(U1_out));

// blade_2
reg [9:0] U2_out;
wire [31:0] U2_in1, U2_in2;
assign U2_in1 = { in1_0[1:0],in1_1[1:0],in1_2[1:0],in1_3[1:0],in1_4[1:0],in1_5[1:0],in1_6[1:0],in1_7[1:0],
				  in1_8[1:0],in1_9[1:0],in1_10[1:0],in1_11[1:0],in1_12[1:0],in1_13[1:0],in1_14[1:0],in1_15[1:0] };
assign U2_in2 = { in2_0[5:4],in2_1[5:4],in2_2[5:4],in2_3[5:4],in2_4[5:4],in2_5[5:4],in2_6[5:4],in2_7[5:4],
				  in2_8[5:4],in2_9[5:4],in2_10[5:4],in2_11[5:4],in2_12[5:4],in2_13[5:4],in2_14[5:4],in2_15[5:4] };
b8Xb8_blade U2 (.clk(clk), .rst_n(rst_n), .in1(U2_in1), .in2(U2_in2), .sn1(sn1), .sn2(sn2), .out(U2_out));

// blade_3
reg [9:0] U3_out;
wire [31:0] U3_in1, U3_in2;
assign U3_in1 = { in1_0[1:0],in1_1[1:0],in1_2[1:0],in1_3[1:0],in1_4[1:0],in1_5[1:0],in1_6[1:0],in1_7[1:0],
				  in1_8[1:0],in1_9[1:0],in1_10[1:0],in1_11[1:0],in1_12[1:0],in1_13[1:0],in1_14[1:0],in1_15[1:0] };
assign U3_in2 = { in2_0[7:6],in2_1[7:6],in2_2[7:6],in2_3[7:6],in2_4[7:6],in2_5[7:6],in2_6[7:6],in2_7[7:6],
				  in2_8[7:6],in2_9[7:6],in2_10[7:6],in2_11[7:6],in2_12[7:6],in2_13[7:6],in2_14[7:6],in2_15[7:6] };
b8Xb8_blade U3 (.clk(clk), .rst_n(rst_n), .in1(U3_in1), .in2(U3_in2), .sn1(sn1), .sn2(sn2), .out(U3_out));

// blade_4
reg [9:0] U4_out;
wire [31:0] U4_in1, U4_in2;
assign U4_in1 = { in1_0[3:2],in1_1[3:2],in1_2[3:2],in1_3[3:2],in1_4[3:2],in1_5[3:2],in1_6[3:2],in1_7[3:2],
				  in1_8[3:2],in1_9[3:2],in1_10[3:2],in1_11[3:2],in1_12[3:2],in1_13[3:2],in1_14[3:2],in1_15[3:2] };
assign U4_in2 = { in2_0[1:0],in2_1[1:0],in2_2[1:0],in2_3[1:0],in2_4[1:0],in2_5[1:0],in2_6[1:0],in2_7[1:0],
				  in2_8[1:0],in2_9[1:0],in2_10[1:0],in2_11[1:0],in2_12[1:0],in2_13[1:0],in2_14[1:0],in2_15[1:0] };
b8Xb8_blade U4 (.clk(clk), .rst_n(rst_n), .in1(U4_in1), .in2(U4_in2), .sn1(sn1), .sn2(sn2), .out(U4_out));

// blade_5
reg [9:0] U5_out;
wire [31:0] U5_in1, U5_in2;
assign U5_in1 = { in1_0[3:2],in1_1[3:2],in1_2[3:2],in1_3[3:2],in1_4[3:2],in1_5[3:2],in1_6[3:2],in1_7[3:2],
				  in1_8[3:2],in1_9[3:2],in1_10[3:2],in1_11[3:2],in1_12[3:2],in1_13[3:2],in1_14[3:2],in1_15[3:2] };
assign U5_in2 = { in2_0[3:2],in2_1[3:2],in2_2[3:2],in2_3[3:2],in2_4[3:2],in2_5[3:2],in2_6[3:2],in2_7[3:2],
				  in2_8[3:2],in2_9[3:2],in2_10[3:2],in2_11[3:2],in2_12[3:2],in2_13[3:2],in2_14[3:2],in2_15[3:2] };
b8Xb8_blade U5 (.clk(clk), .rst_n(rst_n), .in1(U5_in1), .in2(U5_in2), .sn1(sn1), .sn2(sn2), .out(U5_out));

// blade_6
reg [9:0] U6_out;
wire [31:0] U6_in1, U6_in2;
assign U6_in1 = { in1_0[3:2],in1_1[3:2],in1_2[3:2],in1_3[3:2],in1_4[3:2],in1_5[3:2],in1_6[3:2],in1_7[3:2],
				  in1_8[3:2],in1_9[3:2],in1_10[3:2],in1_11[3:2],in1_12[3:2],in1_13[3:2],in1_14[3:2],in1_15[3:2] };
assign U6_in2 = { in2_0[5:4],in2_1[5:4],in2_2[5:4],in2_3[5:4],in2_4[5:4],in2_5[5:4],in2_6[5:4],in2_7[5:4],
				  in2_8[5:4],in2_9[5:4],in2_10[5:4],in2_11[5:4],in2_12[5:4],in2_13[5:4],in2_14[5:4],in2_15[5:4] };
b8Xb8_blade U6 (.clk(clk), .rst_n(rst_n), .in1(U6_in1), .in2(U6_in2), .sn1(sn1), .sn2(sn2), .out(U6_out));

// blade_7
reg [9:0] U7_out;
wire [31:0] U7_in1, U7_in2;
assign U7_in1 = { in1_0[3:2],in1_1[3:2],in1_2[3:2],in1_3[3:2],in1_4[3:2],in1_5[3:2],in1_6[3:2],in1_7[3:2],
				  in1_8[3:2],in1_9[3:2],in1_10[3:2],in1_11[3:2],in1_12[3:2],in1_13[3:2],in1_14[3:2],in1_15[3:2] };
assign U7_in2 = { in2_0[7:6],in2_1[7:6],in2_2[7:6],in2_3[7:6],in2_4[7:6],in2_5[7:6],in2_6[7:6],in2_7[7:6],
				  in2_8[7:6],in2_9[7:6],in2_10[7:6],in2_11[7:6],in2_12[7:6],in2_13[7:6],in2_14[7:6],in2_15[7:6] };
b8Xb8_blade U7 (.clk(clk), .rst_n(rst_n), .in1(U7_in1), .in2(U7_in2), .sn1(sn1), .sn2(sn2), .out(U7_out));

// blade_8
reg [9:0] U8_out;
wire [31:0] U8_in1, U8_in2;
assign U8_in1 = { in1_0[5:4],in1_1[5:4],in1_2[5:4],in1_3[5:4],in1_4[5:4],in1_5[5:4],in1_6[5:4],in1_7[5:4],
				  in1_8[5:4],in1_9[5:4],in1_10[5:4],in1_11[5:4],in1_12[5:4],in1_13[5:4],in1_14[5:4],in1_15[5:4] };
assign U8_in2 = { in2_0[1:0],in2_1[1:0],in2_2[1:0],in2_3[1:0],in2_4[1:0],in2_5[1:0],in2_6[1:0],in2_7[1:0],
				  in2_8[1:0],in2_9[1:0],in2_10[1:0],in2_11[1:0],in2_12[1:0],in2_13[1:0],in2_14[1:0],in2_15[1:0] };
b8Xb8_blade U8 (.clk(clk), .rst_n(rst_n), .in1(U8_in1), .in2(U8_in2), .sn1(sn1), .sn2(sn2), .out(U8_out));

// blade_9
reg [9:0] U9_out;
wire [31:0] U9_in1, U9_in2;
assign U9_in1 = { in1_0[5:4],in1_1[5:4],in1_2[5:4],in1_3[5:4],in1_4[5:4],in1_5[5:4],in1_6[5:4],in1_7[5:4],
				  in1_8[5:4],in1_9[5:4],in1_10[5:4],in1_11[5:4],in1_12[5:4],in1_13[5:4],in1_14[5:4],in1_15[5:4] };
assign U9_in2 = { in2_0[3:2],in2_1[3:2],in2_2[3:2],in2_3[3:2],in2_4[3:2],in2_5[3:2],in2_6[3:2],in2_7[3:2],
				  in2_8[3:2],in2_9[3:2],in2_10[3:2],in2_11[3:2],in2_12[3:2],in2_13[3:2],in2_14[3:2],in2_15[3:2] };
b8Xb8_blade U9 (.clk(clk), .rst_n(rst_n), .in1(U9_in1), .in2(U9_in2), .sn1(sn1), .sn2(sn2), .out(U9_out));

// blade_10
reg [9:0] U10_out;
wire [31:0] U10_in1, U10_in2;
assign U10_in1 = { in1_0[5:4],in1_1[5:4],in1_2[5:4],in1_3[5:4],in1_4[5:4],in1_5[5:4],in1_6[5:4],in1_7[5:4],
				  in1_8[5:4],in1_9[5:4],in1_10[5:4],in1_11[5:4],in1_12[5:4],in1_13[5:4],in1_14[5:4],in1_15[5:4] };
assign U10_in2 = { in2_0[5:4],in2_1[5:4],in2_2[5:4],in2_3[5:4],in2_4[5:4],in2_5[5:4],in2_6[5:4],in2_7[5:4],
				  in2_8[5:4],in2_9[5:4],in2_10[5:4],in2_11[5:4],in2_12[5:4],in2_13[5:4],in2_14[5:4],in2_15[5:4] };
b8Xb8_blade U10 (.clk(clk), .rst_n(rst_n), .in1(U10_in1), .in2(U10_in2), .sn1(sn1), .sn2(sn2), .out(U10_out));

// blade_11
reg [9:0] U11_out;
wire [31:0] U11_in1, U11_in2;
assign U11_in1 = { in1_0[5:4],in1_1[5:4],in1_2[5:4],in1_3[5:4],in1_4[5:4],in1_5[5:4],in1_6[5:4],in1_7[5:4],
				  in1_8[5:4],in1_9[5:4],in1_10[5:4],in1_11[5:4],in1_12[5:4],in1_13[5:4],in1_14[5:4],in1_15[5:4] };
assign U11_in2 = { in2_0[7:6],in2_1[7:6],in2_2[7:6],in2_3[7:6],in2_4[7:6],in2_5[7:6],in2_6[7:6],in2_7[7:6],
				  in2_8[7:6],in2_9[7:6],in2_10[7:6],in2_11[7:6],in2_12[7:6],in2_13[7:6],in2_14[7:6],in2_15[7:6] };
b8Xb8_blade U11 (.clk(clk), .rst_n(rst_n), .in1(U11_in1), .in2(U11_in2), .sn1(sn1), .sn2(sn2), .out(U11_out));

// blade_12
reg [9:0] U12_out;
wire [31:0] U12_in1, U12_in2;
assign U12_in1 = { in1_0[7:6],in1_1[7:6],in1_2[7:6],in1_3[7:6],in1_4[7:6],in1_5[7:6],in1_6[7:6],in1_7[7:6],
				  in1_8[7:6],in1_9[7:6],in1_10[7:6],in1_11[7:6],in1_12[7:6],in1_13[7:6],in1_14[7:6],in1_15[7:6] };
assign U12_in2 = { in2_0[1:0],in2_1[1:0],in2_2[1:0],in2_3[1:0],in2_4[1:0],in2_5[1:0],in2_6[1:0],in2_7[1:0],
				  in2_8[1:0],in2_9[1:0],in2_10[1:0],in2_11[1:0],in2_12[1:0],in2_13[1:0],in2_14[1:0],in2_15[1:0] };
b8Xb8_blade U12 (.clk(clk), .rst_n(rst_n), .in1(U12_in1), .in2(U12_in2), .sn1(sn1), .sn2(sn2), .out(U12_out));

// blade_13
reg [9:0] U13_out;
wire [31:0] U13_in1, U13_in2;
assign U13_in1 = { in1_0[7:6],in1_1[7:6],in1_2[7:6],in1_3[7:6],in1_4[7:6],in1_5[7:6],in1_6[7:6],in1_7[7:6],
				  in1_8[7:6],in1_9[7:6],in1_10[7:6],in1_11[7:6],in1_12[7:6],in1_13[7:6],in1_14[7:6],in1_15[7:6] };
assign U13_in2 = { in2_0[3:2],in2_1[3:2],in2_2[3:2],in2_3[3:2],in2_4[3:2],in2_5[3:2],in2_6[3:2],in2_7[3:2],
				  in2_8[3:2],in2_9[3:2],in2_10[3:2],in2_11[3:2],in2_12[3:2],in2_13[3:2],in2_14[3:2],in2_15[3:2] };
b8Xb8_blade U13 (.clk(clk), .rst_n(rst_n), .in1(U13_in1), .in2(U13_in2), .sn1(sn1), .sn2(sn2), .out(U13_out));

// blade_14
reg [9:0] U14_out;
wire [31:0] U14_in1, U14_in2;
assign U14_in1 = { in1_0[7:6],in1_1[7:6],in1_2[7:6],in1_3[7:6],in1_4[7:6],in1_5[7:6],in1_6[7:6],in1_7[7:6],
				  in1_8[7:6],in1_9[7:6],in1_10[7:6],in1_11[7:6],in1_12[7:6],in1_13[7:6],in1_14[7:6],in1_15[7:6] };
assign U14_in2 = { in2_0[5:4],in2_1[5:4],in2_2[5:4],in2_3[5:4],in2_4[5:4],in2_5[5:4],in2_6[5:4],in2_7[5:4],
				  in2_8[5:4],in2_9[5:4],in2_10[5:4],in2_11[5:4],in2_12[5:4],in2_13[5:4],in2_14[5:4],in2_15[5:4] };
b8Xb8_blade U14 (.clk(clk), .rst_n(rst_n), .in1(U14_in1), .in2(U14_in2), .sn1(sn1), .sn2(sn2),  .out(U14_out));

// blade_15
reg [9:0] U15_out;
wire [31:0] U15_in1, U15_in2;
assign U15_in1 = { in1_0[7:6],in1_1[7:6],in1_2[7:6],in1_3[7:6],in1_4[7:6],in1_5[7:6],in1_6[7:6],in1_7[7:6],
				  in1_8[7:6],in1_9[7:6],in1_10[7:6],in1_11[7:6],in1_12[7:6],in1_13[7:6],in1_14[7:6],in1_15[7:6] };
assign U15_in2 = { in2_0[1:0],in2_1[1:0],in2_2[1:0],in2_3[1:0],in2_4[1:0],in2_5[1:0],in2_6[1:0],in2_7[1:0],
				  in2_8[1:0],in2_9[1:0],in2_10[1:0],in2_11[1:0],in2_12[1:0],in2_13[1:0],in2_14[1:0],in2_15[1:0] };
b8Xb8_blade U15 (.clk(clk), .rst_n(rst_n), .in1(U15_in1), .in2(U15_in2), .sn1(sn1), .sn2(sn2), .out(U15_out));

// shfit-add
wire [2:0] U0_sft, U1_sft, U2_sft, U3_sft;
wire [2:0] U4_sft, U5_sft, U6_sft, U7_sft;
wire [2:0] U8_sft, U9_sft, U10_sft,U11_sft;
wire [2:0] U12_sft,U13_sft,U14_sft,U15_sft;
assign U0_sft =  {sft2[0],sft1[0],sft0[0]};
assign U1_sft =  {sft2[1],sft1[1],sft0[1]};
assign U2_sft =  {sft2[2],sft1[2],sft0[2]};
assign U3_sft =  {sft2[3],sft1[3],sft0[3]};
assign U4_sft =  {sft2[4],sft1[4],sft0[4]};
assign U5_sft =  {sft2[5],sft1[5],sft0[5]};
assign U6_sft =  {sft2[6],sft1[6],sft0[6]};
assign U7_sft =  {sft2[7],sft1[7],sft0[7]};
assign U8_sft =  {sft2[8],sft1[8],sft0[8]};
assign U9_sft =  {sft2[9],sft1[9],sft0[9]};
assign U10_sft = {sft2[10],sft1[10],sft0[10]};
assign U11_sft = {sft2[11],sft1[11],sft0[11]};
assign U12_sft = {sft2[12],sft1[12],sft0[12]};
assign U13_sft = {sft2[13],sft1[13],sft0[13]};
assign U14_sft = {sft2[14],sft1[14],sft0[14]};
assign U15_sft = {sft2[15],sft1[15],sft0[15]};

wire [21:0] U0_out_sft, U1_out_sft, U2_out_sft, U3_out_sft;
wire [21:0] U4_out_sft, U5_out_sft, U6_out_sft, U7_out_sft;
wire [21:0] U8_out_sft, U9_out_sft, U10_out_sft,U11_out_sft;
wire [21:0] U12_out_sft,U13_out_sft,U14_out_sft,U15_out_sft;
assign U0_out_sft = 
                (U0_sft == 3'b001) ? U0_out<<2 :
                (U0_sft == 3'b010) ? U0_out<<4 :
                (U0_sft == 3'b011) ? U0_out<<6 :
                (U0_sft == 3'b100) ? U0_out<<8 :
                (U0_sft == 3'b101) ? U0_out<<10 :
                (U0_sft == 3'b110) ? U0_out<<12 :
                U0_out;
assign U1_out_sft = 
                (U1_sft == 3'b001) ? U1_out<<2 :
                (U1_sft == 3'b010) ? U1_out<<4 :
                (U1_sft == 3'b011) ? U1_out<<6 :
                (U1_sft == 3'b100) ? U1_out<<8 :
                (U1_sft == 3'b101) ? U1_out<<10 :
                (U1_sft == 3'b110) ? U1_out<<12 :
                U1_out;
assign U2_out_sft = 
                (U2_sft == 3'b001) ? U2_out<<2 :
                (U2_sft == 3'b010) ? U2_out<<4 :
                (U2_sft == 3'b011) ? U2_out<<6 :
                (U2_sft == 3'b100) ? U2_out<<8 :
                (U2_sft == 3'b101) ? U2_out<<10 :
                (U2_sft == 3'b110) ? U2_out<<12 :
                U2_out;
assign U3_out_sft = 
                (U3_sft == 3'b001) ? U3_out<<2 :
                (U3_sft == 3'b010) ? U3_out<<4 :
                (U3_sft == 3'b011) ? U3_out<<6 :
                (U3_sft == 3'b100) ? U3_out<<8 :
                (U3_sft == 3'b101) ? U3_out<<10 :
                (U3_sft == 3'b110) ? U3_out<<12 :
                U3_out;
assign U4_out_sft = 
                (U4_sft == 3'b001) ? U4_out<<2 :
                (U4_sft == 3'b010) ? U4_out<<4 :
                (U4_sft == 3'b011) ? U4_out<<6 :
                (U4_sft == 3'b100) ? U4_out<<8 :
                (U4_sft == 3'b101) ? U4_out<<10 :
                (U4_sft == 3'b110) ? U4_out<<12 :
                U4_out;
assign U5_out_sft = 
                (U5_sft == 3'b001) ? U5_out<<2 :
                (U5_sft == 3'b010) ? U5_out<<4 :
                (U5_sft == 3'b011) ? U5_out<<6 :
                (U5_sft == 3'b100) ? U5_out<<8 :
                (U5_sft == 3'b101) ? U5_out<<10 :
                (U5_sft == 3'b110) ? U5_out<<12 :
                U5_out;
assign U6_out_sft = 
                (U6_sft == 3'b001) ? U6_out<<2 :
                (U6_sft == 3'b010) ? U6_out<<4 :
                (U6_sft == 3'b011) ? U6_out<<6 :
                (U6_sft == 3'b100) ? U6_out<<8 :
                (U6_sft == 3'b101) ? U6_out<<10 :
                (U6_sft == 3'b110) ? U6_out<<12 :
                U6_out;
assign U7_out_sft = 
                (U7_sft == 3'b001) ? U7_out<<2 :
                (U7_sft == 3'b010) ? U7_out<<4 :
                (U7_sft == 3'b011) ? U7_out<<6 :
                (U7_sft == 3'b100) ? U7_out<<8 :
                (U7_sft == 3'b101) ? U7_out<<10 :
                (U7_sft == 3'b110) ? U7_out<<12 :
                U7_out;
assign U8_out_sft = 
                (U8_sft == 3'b001) ? U8_out<<2 :
                (U8_sft == 3'b010) ? U8_out<<4 :
                (U8_sft == 3'b011) ? U8_out<<6 :
                (U8_sft == 3'b100) ? U8_out<<8 :
                (U8_sft == 3'b101) ? U8_out<<10 :
                (U8_sft == 3'b110) ? U8_out<<12 :
                U8_out;
assign U9_out_sft = 
                (U9_sft == 3'b001) ? U9_out<<2 :
                (U9_sft == 3'b010) ? U9_out<<4 :
                (U9_sft == 3'b011) ? U9_out<<6 :
                (U9_sft == 3'b100) ? U9_out<<8 :
                (U9_sft == 3'b101) ? U9_out<<10 :
                (U9_sft == 3'b110) ? U9_out<<12 :
                U9_out;
assign U10_out_sft = 
                (U10_sft == 3'b001) ? U10_out<<2 :
                (U10_sft == 3'b010) ? U10_out<<4 :
                (U10_sft == 3'b011) ? U10_out<<6 :
                (U10_sft == 3'b100) ? U10_out<<8 :
                (U10_sft == 3'b101) ? U10_out<<10 :
                (U10_sft == 3'b110) ? U10_out<<12 :
                U10_out;
assign U11_out_sft = 
                (U11_sft == 3'b001) ? U11_out<<2 :
                (U11_sft == 3'b010) ? U11_out<<4 :
                (U11_sft == 3'b011) ? U11_out<<6 :
                (U11_sft == 3'b100) ? U11_out<<8 :
                (U11_sft == 3'b101) ? U11_out<<10 :
                (U11_sft == 3'b110) ? U11_out<<12 :
                U11_out;
assign U12_out_sft = 
                (U12_sft == 3'b001) ? U12_out<<2 :
                (U12_sft == 3'b010) ? U12_out<<4 :
                (U12_sft == 3'b011) ? U12_out<<6 :
                (U12_sft == 3'b100) ? U12_out<<8 :
                (U12_sft == 3'b101) ? U12_out<<10 :
                (U12_sft == 3'b110) ? U12_out<<12 :
                U12_out;
assign U13_out_sft = 
                (U13_sft == 3'b001) ? U13_out<<2 :
                (U13_sft == 3'b010) ? U13_out<<4 :
                (U13_sft == 3'b011) ? U13_out<<6 :
                (U13_sft == 3'b100) ? U13_out<<8 :
                (U13_sft == 3'b101) ? U13_out<<10 :
                (U13_sft == 3'b110) ? U13_out<<12 :
                U13_out;
assign U14_out_sft = 
                (U14_sft == 3'b001) ? U14_out<<2 :
                (U14_sft == 3'b010) ? U14_out<<4 :
                (U14_sft == 3'b011) ? U14_out<<6 :
                (U14_sft == 3'b100) ? U14_out<<8 :
                (U14_sft == 3'b101) ? U14_out<<10 :
                (U14_sft == 3'b110) ? U14_out<<12 :
                U14_out;
assign U15_out_sft = 
                (U15_sft == 3'b001) ? U15_out<<2 :
                (U15_sft == 3'b010) ? U15_out<<4 :
                (U15_sft == 3'b011) ? U15_out<<6 :
                (U15_sft == 3'b100) ? U15_out<<8 :
                (U15_sft == 3'b101) ? U15_out<<10 :
                (U15_sft == 3'b110) ? U15_out<<12 :
                U15_out;

wire [21:0] sum_top;
// assign sum_top = U0_out_sft  + U1_out_sft  + U2_out_sft  + U3_out_sft
//                + U4_out_sft  + U5_out_sft  + U6_out_sft  + U7_out_sft
//                + U8_out_sft  + U9_out_sft  + U10_out_sft + U11_out_sft
//                + U12_out_sft + U13_out_sft + U14_out_sft + U15_out_sft;
DW02_sum #(16,22) U_sum (
  .INPUT({
    U0_out_sft  , U1_out_sft  , U2_out_sft  , U3_out_sft ,
    U4_out_sft  , U5_out_sft  , U6_out_sft  , U7_out_sft ,
    U8_out_sft  , U9_out_sft  , U10_out_sft , U11_out_sft ,
    U12_out_sft , U13_out_sft , U14_out_sft , U15_out_sft 
    }), 
  .SUM(sum_top));

reg [21:0] out;
always @(posedge clk or negedge rst_n) begin
  if (rst_n == 1'b0) begin
    out <= 22'b0;
  end else begin
    out <= sum_top;
  end
end

endmodule

// 8X8 bit-blade PE
module b8Xb8_blade (
  input clk,
  input rst_n,
  input [31:0] in1,
  input [15:0] sn1,
  input [31:0] in2,
  input [15:0] sn2,
  output [9:0] out
);

// p0
wire [7:0] p0;
wire [5:0] p0_0,p0_1,p0_2,p0_3;
bb_2X2 U0_0( .sx(sn1[0]), .x1(in1[1]), .x0(in1[0]), .sy(sn2[0]), .y1(in2[1]), .y0(in2[0]), .out(p0_0) );
bb_2X2 U0_1( .sx(sn1[1]), .x1(in1[3]), .x0(in1[2]), .sy(sn2[1]), .y1(in2[3]), .y0(in2[2]), .out(p0_1) );
bb_2X2 U0_2( .sx(sn1[2]), .x1(in1[5]), .x0(in1[4]), .sy(sn2[2]), .y1(in2[5]), .y0(in2[4]), .out(p0_2) );
bb_2X2 U0_3( .sx(sn1[3]), .x1(in1[7]), .x0(in1[6]), .sy(sn2[3]), .y1(in2[7]), .y0(in2[6]), .out(p0_3) );
assign p0 = p0_0 + p0_1 + p0_2 + p0_3;

// p1
wire [7:0] p1;
wire [5:0] p1_0,p1_1,p1_2,p1_3;
bb_2X2 U1_0( .sx(sn1[4]), .x1(in1[9]),  .x0(in1[8]),  .sy(sn2[4]), .y1(in2[9]),  .y0(in2[8]),  .out(p1_0) );
bb_2X2 U1_1( .sx(sn1[5]), .x1(in1[11]), .x0(in1[10]), .sy(sn2[5]), .y1(in2[11]), .y0(in2[10]), .out(p1_1) );
bb_2X2 U1_2( .sx(sn1[6]), .x1(in1[13]), .x0(in1[12]), .sy(sn2[6]), .y1(in2[13]), .y0(in2[12]), .out(p1_2) );
bb_2X2 U1_3( .sx(sn1[7]), .x1(in1[15]), .x0(in1[14]), .sy(sn2[7]), .y1(in2[15]), .y0(in2[14]), .out(p1_3) );
assign p1 = p1_0 + p1_1 + p1_2 + p1_3;

// p2
wire [7:0] p2;
wire [5:0] p2_0,p2_1,p2_2,p2_3;
bb_2X2 U2_0( .sx(sn1[8]),  .x1(in1[17]), .x0(in1[16]), .sy(sn2[8]),  .y1(in2[17]), .y0(in2[16]), .out(p2_0) );
bb_2X2 U2_1( .sx(sn1[9]),  .x1(in1[19]), .x0(in1[18]), .sy(sn2[9]),  .y1(in2[19]), .y0(in2[18]), .out(p2_1) );
bb_2X2 U2_2( .sx(sn1[10]), .x1(in1[21]), .x0(in1[20]), .sy(sn2[10]), .y1(in2[21]), .y0(in2[20]), .out(p2_2) );
bb_2X2 U2_3( .sx(sn1[11]), .x1(in1[23]), .x0(in1[22]), .sy(sn2[11]), .y1(in2[23]), .y0(in2[22]), .out(p2_3) );
assign p2 = p2_0 + p2_1 + p2_2 + p2_3;

// p3
wire [7:0] p3;
wire [5:0] p3_0,p3_1,p3_2,p3_3;
bb_2X2 U3_0( .sx(sn1[12]), .x1(in1[25]), .x0(in1[24]), .sy(sn2[12]), .y1(in2[25]), .y0(in2[24]), .out(p3_0) );
bb_2X2 U3_1( .sx(sn1[13]), .x1(in1[27]), .x0(in1[26]), .sy(sn2[13]), .y1(in2[27]), .y0(in2[26]), .out(p3_1) );
bb_2X2 U3_2( .sx(sn1[14]), .x1(in1[29]), .x0(in1[28]), .sy(sn2[14]), .y1(in2[29]), .y0(in2[28]), .out(p3_2) );
bb_2X2 U3_3( .sx(sn1[15]), .x1(in1[31]), .x0(in1[30]), .sy(sn2[15]), .y1(in2[31]), .y0(in2[30]), .out(p3_3) );
assign p3 = p3_0 + p3_1 + p3_2 + p3_3;

// sum of four BB4
wire [9:0] sum;
assign sum = p0 + p1 + p2 + p3;

reg [9:0] out;
always @ (posedge clk or negedge rst_n) begin
  if (rst_n == 1'b0) begin
    out <= 10'b0;
  end else begin
    out <= sum;
  end
end

endmodule

module bb_2X2(
  sx,x1,x0,sy,y1,y0,out
);

input sx,x1,x0,sy,y1,y0;
output [5:0] out;

wire [2:0] x3b;
wire [2:0] y3b;
assign x3b = {x1&sx,x1,x0};
assign y3b = {y1&sy,y1,y0};

assign out = x3b*y3b;

endmodule
