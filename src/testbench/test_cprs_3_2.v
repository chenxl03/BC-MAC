`timescale 1ns / 1ps

module test_cprs_3_2;

parameter period = 5;

reg clk,rstn;
reg [2:0] in1;
wire [1:0] out;

cprs_3_2 DUT(
.in(in1), 
.out(out)
);

always #period clk = ~clk;

//reset
initial begin
    clk=0;
    rstn=0;
    in1=0;
    #9;
    rstn=1;
    #100;
    $finish();
end

// stimulus
    always @(negedge clk) begin
        if (rstn == 1) begin
            in1 <= in1+1;
        end
    end
    
    always @(posedge clk) begin
		$display("INFO: in1:%b out:%b, arrival at %t",in1,out,$time);
    end

// dump
`ifdef DUMP
	initial begin
		$dumpfile("test.vcd");
		$dumpvars(0,test_cprs_3_2);
	end
`endif

endmodule
