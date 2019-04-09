module cprs_6_2 (
in,out,yi,yo
);

input [5:0] in;
output [2:0] yi;
output [1:0] out;
output [2:0] yo;

wire cprs_3_2_out0;
wire cprs_3_2_out1;

cprs_3_2 I0(
	.in(in[5:3]),
	.out({yo[1],cprs_3_2_out1})
	);
cprs_3_2 I1(
	.in(in[2:0]),
	.out({yo[0],cprs_3_2_out0})
	);

cprs_4_2 I2(
	.in({cprs_3_2_out1,cprs_3_2_out0,yi[1:0]}),
	.out(cprs_4_2_out),
	.err(cprs_4_2_err)
	);

cprs_3_2 I3(
	.in({cprs_4_2_out}),
	.out({yo[0],cprs_3_2_out0})
	);

endmodule
