module test_cprs_4_2;

parameter period = 5;

reg clk,rstn;
reg [3:0] in1;
wire [1:0] out;
wire err;

cprs_4_2 DUT(
.in(in1), 
.out(out),
.err(err)
);

always #period clk = ~clk;

//reset
initial begin
    clk=0;
    rstn=0;
    in1=0;
    #8;
    rstn=1;
    #200;
    $finish();
end

// stimulus
    always @(negedge clk) begin
        if (rstn == 1) begin
            in1 <= in1+1;
        end
    end
    
    always @(posedge clk) begin
		$display("INFO: in1:%b out:%b, err:%b, arrival at %t",in1,out,err,$time);
    end

// dump
`ifdef DUMP
	initial begin
		$dumpfile("test.vcd");
		$dumpvars();
	end
`endif

endmodule
