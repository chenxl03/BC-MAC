// two-stage 8B*8B_sum16 MAC (DaDianNao)
module b8Xb8_s16( 
  input clk,
  input rst_n, 
//in1, in2, 
  input [7:0] in1_0  ,
  input [7:0] in1_1  ,
  input [7:0] in1_2  ,
  input [7:0] in1_3  ,
  input [7:0] in1_4  ,
  input [7:0] in1_5  ,
  input [7:0] in1_6  ,
  input [7:0] in1_7  ,
  input [7:0] in1_8  ,
  input [7:0] in1_9  ,
  input [7:0] in1_10 ,
  input [7:0] in1_11 ,
  input [7:0] in1_12 ,
  input [7:0] in1_13 ,
  input [7:0] in1_14 ,
  input [7:0] in1_15 ,
//in1, in2, 
  input [7:0] in2_0  ,
  input [7:0] in2_1  ,
  input [7:0] in2_2  ,
  input [7:0] in2_3  ,
  input [7:0] in2_4  ,
  input [7:0] in2_5  ,
  input [7:0] in2_6  ,
  input [7:0] in2_7  ,
  input [7:0] in2_8  ,
  input [7:0] in2_9  ,
  input [7:0] in2_10 ,
  input [7:0] in2_11 ,
  input [7:0] in2_12 ,
  input [7:0] in2_13 ,
  input [7:0] in2_14 ,
  input [7:0] in2_15 ,
// output 
  output [11:0] out
  );

  //input clk;
  //input rst_n;
  //input [7:0] in1 [15:0];
  //input [7:0] in2 [15:0];
  //output [11:0] out;

  reg [19:0] psum;
  //reg [15:0] prod [15:0];
  reg [15:0] prod_0  ;
  reg [15:0] prod_1  ;
  reg [15:0] prod_2  ;
  reg [15:0] prod_3  ;
  reg [15:0] prod_4  ;
  reg [15:0] prod_5  ;
  reg [15:0] prod_6  ;
  reg [15:0] prod_7  ;
  reg [15:0] prod_8  ;
  reg [15:0] prod_9  ;
  reg [15:0] prod_10 ;
  reg [15:0] prod_11 ;
  reg [15:0] prod_12 ;
  reg [15:0] prod_13 ;
  reg [15:0] prod_14 ;
  reg [15:0] prod_15 ;

  always @(negedge rst_n or posedge clk) begin

    if (rst_n == 1'b0) begin

      //for(i=0; i<16; i=i+1) begin
      //    prod[i] = 16'b0;
      //end
      prod_0  <= 16'b0;
      prod_1  <= 16'b0;
      prod_2  <= 16'b0;
      prod_3  <= 16'b0;
      prod_4  <= 16'b0;
      prod_5  <= 16'b0;
      prod_6  <= 16'b0;
      prod_7  <= 16'b0;
      prod_8  <= 16'b0;
      prod_9  <= 16'b0;
      prod_10 <= 16'b0;
      prod_11 <= 16'b0;
      prod_12 <= 16'b0;
      prod_13 <= 16'b0;
      prod_14 <= 16'b0;
      prod_15 <= 16'b0;

      psum <= 20'b0;

    end else begin

      //for(i=0; i<16; i=i+1) begin
      //    prod[i] = in1[i] * in2[i];
      //end
      prod_0  <= in1_0  * in2_0  ;
      prod_1  <= in1_1  * in2_1  ;
      prod_2  <= in1_2  * in2_2  ;
      prod_3  <= in1_3  * in2_3  ;
      prod_4  <= in1_4  * in2_4  ;
      prod_5  <= in1_5  * in2_5  ;
      prod_6  <= in1_6  * in2_6  ;
      prod_7  <= in1_7  * in2_7  ;
      prod_8  <= in1_8  * in2_8  ;
      prod_9  <= in1_9  * in2_9  ;
      prod_10 <= in1_10 * in2_10 ;
      prod_11 <= in1_11 * in2_11 ;
      prod_12 <= in1_12 * in2_12 ;
      prod_13 <= in1_13 * in2_13 ;
      prod_14 <= in1_14 * in2_14 ;
      prod_15 <= in1_15 * in2_15 ;

      psum <= prod_0  + prod_1  + prod_2  + prod_3
           + prod_4  + prod_5  + prod_6  + prod_7
           + prod_8  + prod_9  + prod_10 + prod_11
           + prod_12 + prod_13 + prod_14 + prod_15;

    end
  end

  assign out = psum[19:9];

endmodule
