`timescale 1ns/1ps

module mac_b16_s16 (
clk,
rstn,
//in1
in1_0  ,
in1_1  ,
in1_2  ,
in1_3  ,
in1_4  ,
in1_5  ,
in1_6  ,
in1_7  ,
in1_8  ,
in1_9  ,
in1_10 ,
in1_11 ,
in1_12 ,
in1_13 ,
in1_14 ,
in1_15 ,
//in2, 
in2_0  ,
in2_1  ,
in2_2  ,
in2_3  ,
in2_4  ,
in2_5  ,
in2_6  ,
in2_7  ,
in2_8  ,
in2_9  ,
in2_10 ,
in2_11 ,
in2_12 ,
in2_13 ,
in2_14 ,
in2_15 ,
// 
out
);

input clk;
input rstn;
//in1
input signed [15:0] in1_0  ;
input signed [15:0] in1_1  ;
input signed [15:0] in1_2  ;
input signed [15:0] in1_3  ;
input signed [15:0] in1_4  ;
input signed [15:0] in1_5  ;
input signed [15:0] in1_6  ;
input signed [15:0] in1_7  ;
input signed [15:0] in1_8  ;
input signed [15:0] in1_9  ;
input signed [15:0] in1_10 ;
input signed [15:0] in1_11 ;
input signed [15:0] in1_12 ;
input signed [15:0] in1_13 ;
input signed [15:0] in1_14 ;
input signed [15:0] in1_15 ;
//in2, 
input signed [15:0] in2_0  ;
input signed [15:0] in2_1  ;
input signed [15:0] in2_2  ;
input signed [15:0] in2_3  ;
input signed [15:0] in2_4  ;
input signed [15:0] in2_5  ;
input signed [15:0] in2_6  ;
input signed [15:0] in2_7  ;
input signed [15:0] in2_8  ;
input signed [15:0] in2_9  ;
input signed [15:0] in2_10 ;
input signed [15:0] in2_11 ;
input signed [15:0] in2_12 ;
input signed [15:0] in2_13 ;
input signed [15:0] in2_14 ;
input signed [15:0] in2_15 ;
// output
output signed [35:0] out;

// prod;
reg signed [31:0] prod_0  ;
reg signed [31:0] prod_1  ;
reg signed [31:0] prod_2  ;
reg signed [31:0] prod_3  ;
reg signed [31:0] prod_4  ;
reg signed [31:0] prod_5  ;
reg signed [31:0] prod_6  ;
reg signed [31:0] prod_7  ;
reg signed [31:0] prod_8  ;
reg signed [31:0] prod_9  ;
reg signed [31:0] prod_10 ;
reg signed [31:0] prod_11 ;
reg signed [31:0] prod_12 ;
reg signed [31:0] prod_13 ;
reg signed [31:0] prod_14 ;
reg signed [31:0] prod_15 ;

always @ (posedge clk or negedge rstn) begin
	if (rstn == 1'b0) begin
		prod_0  <= 32'b0;
		prod_1  <= 32'b0;
		prod_2  <= 32'b0;
		prod_3  <= 32'b0;
		prod_4  <= 32'b0;
		prod_5  <= 32'b0;
		prod_6  <= 32'b0;
		prod_7  <= 32'b0;
		prod_8  <= 32'b0;
		prod_9  <= 32'b0;
		prod_10 <= 32'b0;
		prod_11 <= 32'b0;
		prod_12 <= 32'b0;
		prod_13 <= 32'b0;
		prod_14 <= 32'b0;
		prod_15 <= 32'b0;
	end else begin
		prod_0  <= in1_0  * in2_0 ;
		prod_1  <= in1_1  * in2_1 ;
		prod_2  <= in1_2  * in2_2 ;
		prod_3  <= in1_3  * in2_3 ;
		prod_4  <= in1_4  * in2_4 ;
		prod_5  <= in1_5  * in2_5 ;
		prod_6  <= in1_6  * in2_6 ;
		prod_7  <= in1_7  * in2_7 ;
		prod_8  <= in1_8  * in2_8 ;
		prod_9  <= in1_9  * in2_9 ;
		prod_10 <= in1_10 * in2_10;
		prod_11 <= in1_11 * in2_11;
		prod_12 <= in1_12 * in2_12;
		prod_13 <= in1_13 * in2_13;
		prod_14 <= in1_14 * in2_14;
		prod_15 <= in1_15 * in2_15;
	end
end

// out, psum
wire [35:0] psum;
assign psum = prod_0   +  prod_1   +  prod_2   +  prod_3 
            + prod_4   +  prod_5   +  prod_6   +  prod_7 
            + prod_8   +  prod_9   +  prod_10  +  prod_11 
            + prod_12  +  prod_13  +  prod_14  +  prod_15 ;
reg [35:0] out;
always @ (posedge clk or negedge rstn) begin
	if (rstn == 1'b0) begin
		out		<= 36'b0;
	end else begin
		out		<= psum;
	end
end

endmodule
