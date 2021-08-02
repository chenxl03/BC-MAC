module adder4 (
  input clk,
  input rst_n,
  input [3:0] in1,
  input [3:0] in2,
  input cin,
  output reg [3:0] sum,
  output reg cout
);

reg [3:0] in1_r1,in2_r1;
reg cin_r1;

always @(posedge clk or negedge rst_n) begin
  if (rst_n == 1'b0) begin
    in1_r1 <= 4'b0;
    in2_r1 <= 4'b0;
    cin_r1 <= 1'b0;
  end else begin
    in1_r1 <= in1;
    in2_r1 <= in2;
    cin_r1 <= cin;
  end
end

wire [3:0] sum_r0;
wire cout_r0;

DW01_add #(4) U1 (.A(in1_r1), .B(in2_r1), .CI(cin_r1), .SUM(sum_r0), .CO(cout_r0));

//wire [3:0] p,g,c;
//assign g = {in1_r1[3]&in2_r1[3],in1_r1[2]&in2_r1[2],in1_r1[1]&in2_r1[1],in1_r1[0]&in2_r1[0]};
//assign p = {in1_r1[3]|in2_r1[3],in1_r1[2]|in2_r1[2],in1_r1[1]|in2_r1[1],in1_r1[0]|in2_r1[0]};
//assign c[0] = g[0] + p[0]*cin_r1;
//assign c[1] = g[1] + p[1]*c[0];
//assign c[2] = g[2] + p[2]*c[1];
//assign c[3] = g[3] + p[3]*c[2];
//
//assign G = c[3];
//assign P = p[0]&p[1]&p[2]&p[3];
//assign G8 = G + P*G4;

always @(posedge clk or negedge rst_n) begin
  if (rst_n == 1'b0) begin
	sum  <= 4'b0;
    cout <= 1'b0;
  end else begin
	sum  <= sum_r0;
    cout <= cout_r0;
  end
end

endmodule
