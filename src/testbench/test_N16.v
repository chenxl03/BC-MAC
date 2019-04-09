`timescale 1ns / 1ps

module test_N16;

parameter period = 5;

reg clk,rstn;
reg [15:0] in1,in2;
wire [16:0] res;

CAP_N16_R4_P2 DUT(
.clk(clk), 
.rstn(rstn), 
.in1(in1), 
.in2(in2), 
.res(res)
);

always #period clk = ~clk;

//reset
initial begin
    clk=0;
    rstn=0;
    in1=0;
    in2=0;
    #8;
    rstn=1;
    #100;
    $finish();
end

// stimulus
    always @(negedge clk) begin
        if (rstn == 1) begin
            in1 <= in1+10;
            in2 <= in2+20;
        end
    end
    
    always @(posedge clk) begin
        if (rstn == 1) begin
            if (in1+in2 != res) begin
    			$display("INFO: ERROR: in1:%d + in2:%d != res:%d, arrival at %t",in1,in2,res,$time);
            end
        end
    end

// dump
`ifdef DUMP
	initial begin
		$dumpfile("test.vcd");
		$dumpvars();
	end
`endif

endmodule
