`timescale 1ns/1ps

module b16_loom_AC1 (
  input clk,
  input rst_n, 
// in1, in2
  input [15:0] in1,
  input [15:0] in2,
// output 
  output [19:0] out
);

wire [3:0] psum;
assign psum = in1[0]  &  in2[0]
            + in1[1]  &  in2[1]
            + in1[2]  &  in2[2]
            + in1[3]  &  in2[3]
            + in1[4]  &  in2[4]
            + in1[5]  &  in2[5]
            + in1[6]  &  in2[6]
            + in1[7]  &  in2[7]
            + in1[8]  &  in2[8]
            + in1[9]  &  in2[9]
            + in1[10] &  in2[10]
            + in1[11] &  in2[11]
            + in1[12] &  in2[12]
            + in1[13] &  in2[13]
            + in1[14] &  in2[14]
            + in1[15] &  in2[15]
			;

reg [19:0] out;
always @ (posedge clk or negedge rst_n) begin
	if (rst_n == 1'b0) begin
		out		<= 20'b0;
	end else begin
		out		<= psum + out<<1;
	end
end

endmodule
