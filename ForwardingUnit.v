module ForwardingUnit(
	input [3:0] EX_Rn_in,
	input [3:0] EX_Rm_in,
	input [3:0] MEM_Rd_in,
	input [3:0] WB_Rd_in,
	input WB_EN_MEM,
	input WB_EN_WB,
	input fu_EN,
	output reg [1:0] src1_sel,
	output reg [1:0] src2_sel
);
  always @(*) begin
  		if (~fu_EN) begin
  			src1_sel <= 2'b00;
  		end
		else if ((WB_EN_WB == 1'b1) &&
			/*	(!((WB_EN_MEM == 1'b1) && (MEM_Rd_in !== 31) && (MEM_Rd_in !== EX_Rn_in))) && */
				(WB_Rd_in === EX_Rn_in)) begin
			src1_sel <= 2'b01;
		end else if ((WB_EN_MEM == 1'b1) && (MEM_Rd_in === EX_Rn_in)) begin
			src1_sel <= 2'b10;
		end else begin
			src1_sel <= 2'b00;
		end

		if (~fu_EN) begin
  			src2_sel <= 2'b00;
  		end
		else if ((WB_EN_WB == 1'b1) &&
			/*	(!((WB_EN_MEM == 1'b1) && (MEM_Rd_in !== 31) && (MEM_Rd_in !== EX_Rm_in))) && */
				(WB_Rd_in === EX_Rm_in)) begin
			src2_sel <= 2'b01;
		end else if ((WB_EN_MEM == 1'b1) && (MEM_Rd_in === EX_Rm_in)) begin
			src2_sel <= 2'b10;
		end else begin
			src2_sel <= 2'b00;
		end

  end
endmodule

module Forward_ALU_Mux(
  input [31:0] reg_ex_in,
  input [31:0] reg_wb_in,
  input [31:0] reg_mem_in,
  input [1:0] forward_control_in,
  output reg [31:0] reg_out
);
	always @(*) begin
		case (forward_control_in)
        2'b01 : reg_out <= reg_wb_in;
        2'b10 : reg_out <= reg_mem_in;
        default : reg_out <= reg_ex_in;
      endcase
	end
endmodule