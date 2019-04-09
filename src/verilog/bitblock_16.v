`timescale 1ns/1ps

module bitblock_16 (
clk,
rstn,
in,
shift,
out
);

input clk;
input rstn;
input [15:0] in0;
input [15:0] in1;
input [15:0] in2;
input [15:0] in3;
input [15:0] inr;
input shift;
output [:0] out;

//ctrl logic
reg shift_r1;
always @ (posedge clk or negedge rstn) begin
	if (rstn == 0) begin
		shfit_r1 <= 1'b0;
	end else begin
		shfit_r1 <= shift;
	end
end
