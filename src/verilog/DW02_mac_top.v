`timescale 1ns/1ps

module DW02_mac_top (
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

wire [35:0] out_mac;
  DW02_mac #(16, 16)
    U1 ( .A(in1), .B(in2), .C(out[31:0]), .TC(1'b1), .MAC(out_mac[31:0]) );

reg [35:0] out;
always @ (posedge clk or negedge rstn) begin
	if (rstn == 1'b0) begin
		out <= 36'b0;
	end else begin
		out <= out_mac;
	end
end

endmodule
