`timescale 1ns/1ps

module cprs_7_2 (
in,
out,
yi,
yo
);

input [6:0] in;
input [3:0] yi;
output [1:0] out;
output [3:0] yo;

cprs_3_2 I0 (.in(in[6:4]), .out({yo[3],net1}));
cprs_3_2 I1 (.in(in[3:1]), .out({yo[2],net2}));
cprs_4_2 I2 (.in({net1,net2,yi[3:2]}), .out({yo[1],net3}), .err(net4));
cprs_4_2 I3 (.in({net3,net4,in[0],yi[1]}), .out({yo[0],net5}), .err(net6));
cprs_3_2 I4 (.in({net5,net6,yi[0]}), .out(out[1:0]));

endmodule
