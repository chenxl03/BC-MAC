module bb_3X3 (
  input clk,
  input rst_n,
  input [2:0] in1,
  input [2:0] in2,
  output [5:0] out
);

reg [5:0] out;
always @ (posedge clk or negedge rst_n) begin
  if (rst_n == 1'b0) begin
    out <= 6'b0;
  end else begin
    out <= in1 * in2;
  end
end

endmodule
