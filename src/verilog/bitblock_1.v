`timescale 1ns/1ps

module bitblock_1 (
clk,
rstn,
in,
ppi,
cci,
yi,
yo,
ppo,
psum,
ci,
co,
out
);

input clk;
input rstn;
input [4:0] in;
input ppi;
input cci;
input [3:0] yi;
output [3:0] yo;
output ppo;
input psum;
input ci;
output co;
output out;

wire [1:0] cprs_7_2_out;

cprs_7_2 I0 (
	.in({in,ppi,cci}),
	.out(cprs_7_2_out[1:0]),
	.yi(yi),
	.yo(yo)
	);

reg pp,ppo;
always @ (posedge clk) begin
	if (rstn == 1'b0) begin
		ppo	<= 1'b0;
		pp	<= 1'b0;
	end else begin
		ppo	<= cprs_7_2_out[1];
		pp	<= cprs_7_2_out[0];
	end
end

wire sum;
assign {co,sum} = pp + psum + ci;

reg out;
always @ (posedge clk) begin
	if (rstn == 1'b0) begin
		out	<= 1'b0;
	end else begin
		out	<= sum;
	end
end

endmodule
