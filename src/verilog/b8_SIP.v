`timescale 1ns/1ps

module b8_SIP (
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
  input in2_0  ,
  input in2_1  ,
  input in2_2  ,
  input in2_3  ,
  input in2_4  ,
  input in2_5  ,
  input in2_6  ,
  input in2_7  ,
  input in2_8  ,
  input in2_9  ,
  input in2_10 ,
  input in2_11 ,
  input in2_12 ,
  input in2_13 ,
  input in2_14 ,
  input in2_15 ,
// output 
  output [15:0] out
);

wire [19:0] psum;
assign psum = in1_0 &  {8{in2_0}}
            + in1_1 &  {8{in2_1}}
            + in1_2 &  {8{in2_2}}
            + in1_3 &  {8{in2_3}}
            + in1_4 &  {8{in2_4}}
            + in1_5 &  {8{in2_5}}
            + in1_6 &  {8{in2_6}}
            + in1_7 &  {8{in2_7}}
            + in1_8 &  {8{in2_8}}
            + in1_9 &  {8{in2_9}}
            + in1_10 & {8{in2_10}}
            + in1_11 & {8{in2_11}}
            + in1_12 & {8{in2_12}}
            + in1_13 & {8{in2_13}}
            + in1_14 & {8{in2_14}}
            + in1_15 & {8{in2_15}}
            + out<<1 ;

reg [15:0] out;
always @ (posedge clk or negedge rst_n) begin
	if (rst_n == 1'b0) begin
		out		<= 16'b0;
	end else begin
		out		<= psum;
	end
end

endmodule
