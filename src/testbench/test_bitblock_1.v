module test_bitblock_1;

parameter period = 5;

reg clk,rstn;
reg [10:0] in1;
wire [3:0] yo;
wire ppo;
wire co;
wire out;

bitblock_1 DUT(
.clk(clk),
.rstn(rstn),
.in(in1[4:0]),
.ppi(in1[5]),
.cci(in1[6]),
.ppo(ppo),
.yi(in1[10:7]),
.yo(yo),
.shift_in(1'b0),
.ci(1'b0),
.co(co),
.out(out)
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
		$display("INFO: in1:%b yo:%b, ppo:%b, co:%b, out:%b  arrival at %t",
						in1,yo,ppo,co,out,$time);
    end

// dump
`ifdef DUMP
	initial begin
		$dumpfile("test.vcd");
		$dumpvars();
	end
`endif

endmodule
