`timescale 1ns/1ps

module bitblock_4_core (
clk,
rstn,
in,
shift,
shift_r1,
ppi,
ci,
yi,
yo,
ppo,
psum,
out,
co
);

input clk;
input rstn;
input [19:0] in;
input shift;
input shift_r1;
input ppi;
input ci;
input [3:0]	yi;
output [3:0] yo;
output [3:0] ppo;

input [3:0] psum;
output [3:0] out;
output co;

// ctrl logic
//reg shift_r1;
//always @ (posedge clk or negedge rstn) begin
//	if (rstn == 0) begin
//		shift_r1 <= 1'b0;
//	end else begin
//		shift_r1 <= shift;
//	end
//end

// ppi selection
wire [3:0] ppi_in;
wire pp0,pp1,pp2,pp3;

assign ppi_in = (shift == 1) ? {pp3,pp2,pp1,pp0} : {pp2,pp1,pp0,ppi};

// cci selection
wire [3:0] cci_in;
wire shift_xor,shift_and,shift_nor;

assign shift_xor = shift ^ shift_r1;
assign shift_and = shift & shift_r1;
assign shift_nor = ~(shift | shift_r1);
assign cci_in[3] = (shift_xor == 1'b1) ? co : 0;
assign cci_in[2] = (shift_and == 1'b1) ? co : 0;
assign cci_in[1] = 0;
assign cci_in[0] = (shift_nor == 1'b1) ? ci : 0;

// bitblock_1 connection
wire [3:0] yo_I0,yo_I1,yo_I2,yo_I3;
wire co_I0,co_I1,co_I2,co_I3;

bitblock_1 I0 (
	.clk(clk),
	.rstn(rstn),
	.in(in[4:0]),
	.ppi(ppi_in[0]),
	.cci(cci_in[0]),
	.yi(yi),
	.yo(yo_I0),
	.ppo(pp0),
	.psum(psum[0]),
	.ci(1'b0),
	.co(co_I0),
	.out(out[0])
	);

bitblock_1 I1 (
	.clk(clk),
	.rstn(rstn),
	.in(in[9:5]),
	.ppi(ppi_in[1]),
	.cci(cci_in[1]),
	.yi(yo_I0),
	.yo(yo_I1),
	.ppo(pp1),
	.psum(psum[1]),
	.ci(co_I0),
	.co(co_I1),
	.out(out[1])
	);

bitblock_1 I2 (
	.clk(clk),
	.rstn(rstn),
	.in(in[14:10]),
	.ppi(ppi_in[2]),
	.cci(cci_in[2]),
	.yi(yo_I1),
	.yo(yo_I2),
	.ppo(pp2),
	.psum(psum[2]),
	.ci(co_I1),
	.co(co_I2),
	.out(out[2])
	);

bitblock_1 I3 (
	.clk(clk),
	.rstn(rstn),
	.in(in[19:15]),
	.ppi(ppi_in[3]),
	.cci(cci_in[3]),
	.yi(yo_I2),
	.yo(yo_I3),
	.ppo(pp3),
	.psum(psum[3]),
	.ci(co_I2),
	.co(co_I3),
	.out(out[3])
	);

// oupput logic

assign ppo = pp3;
assign yo = yo_I3;

reg co;
always @ (posedge clk or negedge rstn) begin
	if (rstn == 0) begin
		co <= 1'b0;
	end else begin
		co <= co_I3;
	end
end

endmodule
