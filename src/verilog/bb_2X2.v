module bb_2X2(
  input clk,
  input rst_n,
  input [1:0] in1,
  input [1:0] in2,
  output [3:0] out
);

reg [3:0] out;
always @ (posedge clk or negedge rst_n) begin
  if (rst_n == 1'b0) begin
    out <= 4'b0;
  end else begin
    out <= in1 * in2;
  end
end

endmodule
