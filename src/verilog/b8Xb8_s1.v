// two-stage 8B*8B_sum1 MAC (Eyeriss)
module b8Xb8_s1( clk, rst_n, in1, in2, in3, out);

  input clk;
  input rst_n;
  input [7:0] in1;
  input [7:0] in2;
  input [19:0] in3;
  output reg [19:0] out;

  reg [15:0] prod;
  reg [19:0] psum;

  always @(negedge rst_n or posedge clk) begin

    if (rst_n == 1'b0) begin

      prod <= 16'b0;
      psum <= 20'b0;

    end else begin

      prod <= in1 * in2;
      out  <= in3 + prod;

    end
  end

endmodule
