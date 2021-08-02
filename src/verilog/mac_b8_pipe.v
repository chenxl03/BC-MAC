`timescale 1ns/1ps

module mac_b8_pipe (
clk,
rstn,
in1,
in2,
out
);

input clk;
input rstn;
input  signed [7:0] in1;
input  signed [7:0] in2;
output signed [19:0] out;

reg [15:0] prod;
reg [19:0] out;

always @ (posedge clk or negedge rstn) begin
	if (rstn == 1'b0) begin
		prod	<= 16'b0;
		out		<= 20'b0;
	end else begin
		prod	<= in1 * in2;
		out		<= out + prod;
	end
end

endmodule
