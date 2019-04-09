module test_transrf_b4r5g3;

parameter period = 5;

reg clk_w,clk_r,rst_n,w_en,r_en;
reg [3:0] w_data;
wire [19:0] r_data;
wire rf_full,rf_empty;

transrf_b4r5g3 DUT (
.clk_w(clk_w),
.clk_r(clk_r),
.rst_n(rst_n),
.w_en(w_en),
.w_data(w_data),
.r_en(r_en),
.r_data(r_data),
.rf_full(rf_full),
.rf_empty(rf_empty)
);


always #period clk_w = ~clk_w;
always #40 clk_r = ~clk_r;
//always #30 clk_r = ~clk_r;
//always #20 clk_r = ~clk_r;

//reset
initial begin
    clk_r=0;
    clk_w=0;
    rst_n=0;
	w_en=0;
	r_en=0;
	w_data = 4'd0;
	#6;
	rst_n = 0;
    #6;
    rst_n=1;
	w_en = 1;
	r_en = 1;
    #10000;
    $finish();
end

// stimulus
    always @(posedge clk_w or negedge clk_w or negedge rst_n) begin
		w_en = ($random()%10)>3 ? 1'b1 : 1'b0;
        if (rst_n == 1'b1 && w_en && ~rf_full) begin
            w_data <= w_data+1'd1;
        end
    end
    
    always @(posedge clk_r) begin
		$display("INFO: r_en:%b rf_empty:%b, r_data:%b, arrival at %t",r_en,rf_empty,r_data,$time);
    end

// dump
`ifdef DUMP
	initial begin
		$dumpfile("test.vcd");
		$dumpvars();
	end
`endif

endmodule
