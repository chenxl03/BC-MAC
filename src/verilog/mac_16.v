`timescale 1ns/1ps

module mac_16 (
clk,
rstn,
in1,
in2,
out
);

input clk;
input rstn;
input [15:0] in1;
input [15:0] in2;
output [35:0] out;

reg [35:0] out;
always @ (posedge clk or negedge rstn) begin
	if (rstn == 1'b0) begin
		out <= 36'b0;
	end else begin
		out <= out + in1 * in2;
	end
end

endmodule
