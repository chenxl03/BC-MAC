module bb_4X4(
  input clk,
  input rst_n,
  input [3:0] in1,
  input [3:0] in2,
  output [7:0] out
);

reg [7:0] out;
always @ (posedge clk or negedge rst_n) begin
  if (rst_n == 1'b0) begin
    out <= 8'b0;
  end else begin
    out <= in1 * in2;
  end
end

endmodule
