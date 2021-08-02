`timescale 1ns/1ps

module mac_b16_pipe (
clk,
rstn,
in1,
in2,
out
);

input clk;
input rstn;
input  signed [15:0] in1;
input  signed [15:0] in2;
output signed [35:0] out;

reg [31:0] prod;
reg [35:0] out;

always @ (posedge clk or negedge rstn) begin
	if (rstn == 1'b0) begin
		out  <= 36'b0;
		prod <= 32'b0;
	end else begin
		prod <= in1 * in2;
		out  <= out + prod;
	end
end

endmodule
