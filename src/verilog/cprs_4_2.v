module cprs_4_2 (
in,
out,
err
);
input [3:0] in;
output [1:0] out;
output err;

assign in0_and_in1	= in[0] & in[1];
assign in0_or_in1	= in[0] | in[1];
assign in0_xor_in1	= in[0] ^ in[1];

assign in2_or_in3	= in[2] | in[3];
assign in2_xor_in3	= in[2] ^ in[3];

assign out[0] = in0_xor_in1 ^ in2_or_in3;
assign out[1] = (in0_or_in1 & in2_or_in3) | in0_and_in1;
assign err = in[2] & in[3];

endmodule
