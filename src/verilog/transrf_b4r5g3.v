module transrf_b4r5g3 (
	clk_w,
	clk_r,
	rst_n,
	w_en,
	w_data,
	r_en,
	r_data,
	rf_full,
	rf_empty
);

/*
 wbank = 0, 1, 2, 3(all full, no write)
 wen = EEEEE
 wdata = 4'bXXXX
 */

input clk_w;
input clk_r;
input rst_n;
input w_en;
input [3:0] w_data;
input r_en;
output [19:0] r_data;
output rf_full;
output rf_empty;

reg [3:0] RF_b4r5g0 [4:0];
reg [3:0] RF_b4r5g1 [4:0];
reg [3:0] RF_b4r5g2 [4:0];

reg [1:0] w_group;
reg [2:0] w_addr;
reg [1:0] r_group;
reg [2:0] g_wstate,g_rstate;
reg [2:0] g_rstate_d1;

// g_wstate

wire [2:0] g_rstate_sync;
assign g_rstate_sync = ~g_rstate | g_rstate_d1;
//assign g_rstate_sync[0] = ~g_rstate[0] | g_rstate_d1[0];
//assign g_rstate_sync[1] = ~g_rstate[1] | g_rstate_d1[1];
//assign g_rstate_sync[2] = ~g_rstate[2] | g_rstate_d1[2];

always @(posedge clk_w or negedge clk_w or negedge rst_n) begin
	if (~rst_n) begin

		g_wstate <= 3'b000;
		g_rstate_d1 <= 3'b000;

	end else begin

		g_rstate_d1 <= g_rstate;

		if (g_wstate[0] == 1'b1) begin
			g_wstate[0] <= g_rstate_sync[0];
		end else if (w_group == 2'd0 && w_addr == 3'd4 && w_en) begin
			g_wstate[0] <= 1'b1;
		end

		if (g_wstate[1] == 1'b1) begin
			g_wstate[1] <= g_rstate_sync[1];
		end else if (w_group == 2'd1 && w_addr == 3'd4 && w_en) begin
			g_wstate[1] <= 1'b1;
		end

		if (g_wstate[2] == 1'b1) begin
			g_wstate[2] <= g_rstate_sync[2];
		end else if (w_group == 2'd2 && w_addr == 3'd4 && w_en) begin
			g_wstate[2] <= 1'b1;
		end

	end
end

// monitor read
always @(posedge clk_r or negedge rst_n) begin
	if (~rst_n) begin
		g_rstate <= 3'b000;

	end else if (r_en) begin

		if (r_group == 2'd0 && ~g_rstate[0] && ~rf_empty) begin
			g_rstate[0] <= 1'b1;
		end else begin
			g_rstate[0] <= 1'd0;
		end

		if (r_group == 2'd1 && ~g_rstate[1] && ~rf_empty) begin
			g_rstate[1] <= 1'b1;
		end else begin
			g_rstate[1] <= 1'b0;
		end

		if (r_group == 2'd2 && ~g_rstate[2] && ~rf_empty) begin
			g_rstate[2] <= 1'b1;
		end else begin
			g_rstate[2] <= 1'b0;
		end

	end
end

assign rf_full	= g_wstate[0] & g_wstate[1] & g_wstate[2];
assign rf_empty	= ~(g_wstate[0] | g_wstate[1] | g_wstate[2]);

//write w_data
integer i = 0;
always @(posedge clk_w or negedge clk_w or negedge rst_n) begin
	if (~rst_n) begin
		// reset RF
		for (i=0;i<5;i=i+1) begin
			RF_b4r5g0[i] <= 4'b0;
			RF_b4r5g1[i] <= 4'b0;
			RF_b4r5g2[i] <= 4'b0;
		end
		// reset state
		w_group <= 2'b0;
		w_addr	<= 3'b0;

	end else if(w_en && ~rf_full) begin

			case (w_group)
			2'd0: RF_b4r5g0[w_addr] <= w_data;
			2'd1: RF_b4r5g1[w_addr] <= w_data;
			2'd2: RF_b4r5g2[w_addr] <= w_data;
			default: RF_b4r5g0[w_addr] <= w_data;
			endcase

			// update w_addr,w_group
			if (w_addr == 3'd4) begin

				if (w_group == 2'd2)begin
					w_group	<= 2'd0;
				end else begin
					w_group	<= w_group + 1'b1;
				end
				w_addr <= 3'd0;

			end else begin

				w_addr <= w_addr + 1'b1;

			end

	end
end

//read rf
reg [19:0] r_data;
always @(posedge clk_r or negedge rst_n) begin
	if (~rst_n) begin
		r_group <= 2'b0;
		r_data <= 20'd0;
		
	end else if(r_en & ~rf_empty) begin

		case (r_group)
		2'd0: begin
			r_data <= {RF_b4r5g0[0][3:0],RF_b4r5g0[1][3:0],RF_b4r5g0[2][3:0],RF_b4r5g0[3][3:0],RF_b4r5g0[4][3:0]};
			end
		2'd1: begin
			r_data <= {RF_b4r5g1[0][3:0],RF_b4r5g1[1][3:0],RF_b4r5g1[2][3:0],RF_b4r5g1[3][3:0],RF_b4r5g1[4][3:0]};
			end
		2'd2: begin
			r_data <= {RF_b4r5g2[0][3:0],RF_b4r5g2[1][3:0],RF_b4r5g2[2][3:0],RF_b4r5g2[3][3:0],RF_b4r5g2[4][3:0]};
			end
		default: r_data <= 20'd0;
		endcase

		// increment r_group
		if (r_group == 2'd2) begin
			r_group <= 2'd0;
		end else begin
			r_group <= r_group + 1'd1;
		end
	end else begin
		r_data <= 20'd0;
	end
end

//always @ (posedge clk_r or negedge rst_n) begin
//	if (~rst_n) begin
//	end else if (r_en & ~rf_empty) begin
//	end else begin
//		r_data = 20'd0;
//	end
//end

//assign r_data = (r_en & ~rf_empty) ? 
//					(r_group == 2'd0) ? {RF_b4r5g0[0][3:0],RF_b4r5g0[1][3:0],RF_b4r5g0[2][3:0],RF_b4r5g0[3][3:0],RF_b4r5g0[4][3:0]}
//					: (r_group == 2'd1) ? {RF_b4r5g1[0][3:0],RF_b4r5g1[1][3:0],RF_b4r5g1[2][3:0],RF_b4r5g1[3][3:0],RF_b4r5g1[4][3:0]}
//					: (r_group == 2'd2) ? {RF_b4r5g2[0][3:0],RF_b4r5g2[1][3:0],RF_b4r5g2[2][3:0],RF_b4r5g2[3][3:0],RF_b4r5g2[4][3:0]}
//					: 20'd0
//				: 20'd0;

endmodule
