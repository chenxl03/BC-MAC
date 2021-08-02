module bb_2X2_sft(
  sx,x1,x0,sy,y1,y0,sft,out
);

input sx,x1,x0,sy,y1,y0;
input [1:0] sft;
output [13:0] out;

wire [2:0] x3b;
wire [2:0] y3b;
assign x3b = {x1&sx,x1,x0};
assign y3b = {y1&sy,y1,y0};

wire [5:0] prod;
assign prod = x3b*y3b;

assign out = 
             (sft==2'b01) ? prod<<2 :
             (sft==2'b10) ? prod<<4 :
             (sft==2'b11) ? prod<<8 :
             prod;

endmodule
