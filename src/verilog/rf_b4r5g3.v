module rf_b4r5g3 (
	clk_w,
	rst_n,
	w_bank,
	w_addr,
	w_data,
	clk_r,
	r_bank,
	r_data,
	bank_full
);

/*
 wbank = 0, 1, 2, 3(all full, no write)
 wen = EEEEE
 wdata = 4'bXXXX
 */

input clk_w;
input rst_w;
input [1:0] w_bank;
input [2:0] w_addr;
input [3:0] w_data;
output ref [2:0] bank_full;

input clk_r;
input [1:0] r_bank;
output reg [3:0] r_data;

reg [4:0] RF_b4r5g3_0 [3:0];
reg [4:0] RF_b4r5g3_1 [3:0];
reg [4:0] RF_b4r5g3_2 [3:0];

assign clk = (clk_r && r_bank[0] && r_bank[1]) || (clk_w && w_bank[0] && w_bank[1]); 

//assign w_data
always @(posedge clk or negedge rst_n) begin
	if (rst_n) begin
		for (i=0;i<4;i=i+1) begin
			RF_b4r5g3_0[i] <= 4'b0;
			RF_b4r5g3_1[i] <= 4'b0;
			RF_b4r5g3_2[i] <= 4'b0;
		end
		bank_full <= 3'b0;
	end else begin

		case (w_bank)
			2'b00: begin
				RF_b4r5g3_0[w_addr] <= w_data;
				end
			2'b01: begin
				RF_b4r5g3_1[w_addr] <= w_data;
				end
			2'b10: begin
				RF_b4r5g3_2[w_addr] <= w_data;
				end
			default:
		endcase

		case (r_bank)
			2'b00: r_data <= RF_b4r5g3_0[r_addr];
			2'b01: r_data <= RF_b4r5g3_1[r_addr];
			2'b10: r_data <= RF_b4r5g3_2[r_addr];
			default:
		endcase
	end
end
