`timescale 1ns/1ps

module b16_loom_AC2 (
  input clk,
  input rst_n, 
// in1, in2
  input [19:0] in1,
  input [31:0] in2,
  input sign,
  input sel,
// output 
  output [31:0] out
);

wire [19:0] sign_in1;
assign sign_in1 = (sign == 1'b1) ? ~in1 : in1;
wire [31:0] sel_in2;
assign sel_in2 = (sel == 1'b1) ? in2 : out<<1 ;

reg [31:0] out;
always @ (posedge clk or negedge rst_n) begin
	if (rst_n == 1'b0) begin
		out		<= 32'b0;
	end else begin
		out		<= sign_in1 + sel_in2 + sign;
	end
end

endmodule
