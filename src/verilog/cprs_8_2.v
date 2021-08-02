`timescale 1ns/1ps

module cprs_8_2 (
  input [7:0] in,
  input [4:0] yi,
  output [1:0] out,
  output [4:0] yo
);


cprs_4_2 I0 (.in(in[7:4]), .out({yo[0],I0_out}), .err(I0_err));
cprs_4_2 I1 (.in(in[3:0]), .out({yo[1],I1_out}), .err(I1_err));

cprs_3_2 I2 (.in({{I0_out,I0_err,yi[0]}}), .out({yo[2],I2_out}));
cprs_3_2 I3 (.in({{I1_out,I1_err,yi[1]}}), .out({yo[3],I3_out}));

cprs_4_2 I4 (.in({I2_out,I3_out,yi[3:2]}), .out({yo[4],I4_out}), .err(I4_err));

cprs_3_2 I5 (.in({I4_out,I4_err,yi[4]}), .out(out[1:0]));

endmodule
