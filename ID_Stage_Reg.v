module ID_Stage_Reg(
	input clk, rst, flush,
	input[31:0] pc_in,
	input wb_en_in, mem_r_en_in, mem_w_en_in, 
	input b_in, s_in,
	input[3:0] exe_cmd_in,
	input[31:0] val_rn_in, val_rm_in,
	// forwarding
	input[3:0] src1_in, src2_in,

	input imm_in,
	input[11:0] shift_operand_in,
	input[23:0] signed_imm_24_in,
	input[3:0] dest_in,
	input[3:0] sr_in,

	// exam
	input ret_sig_in,

	output reg wb_en, mem_r_en, mem_w_en, 
	output reg b, s,
	output reg[3:0] exe_cmd,
	output reg[31:0] val_rn, val_rm,
	// forwarding
	output reg[3:0] src1_out, src2_out,
	output reg imm,
	output reg[11:0] shift_operand,
	output reg[23:0] signed_imm_24,
	output reg[3:0] dest,
	output reg[31:0] pc,
	output reg[3:0] sr,

	// exam
	output reg ret_sig_out
);
	always @ (posedge clk) begin
		if (rst) begin
			// exam
	  		{wb_en, mem_r_en, mem_w_en, b, s, exe_cmd, val_rn, val_rm, imm, shift_operand, signed_imm_24, pc, sr, src1_out, src2_out, ret_sig_out} <= 0;
	  		dest <= -1;
		end
		else begin
			if (flush) begin
				wb_en <= 0;
				mem_r_en <= 0;
				mem_w_en <= 0;
				b <= 0;
				s <= 0;
				exe_cmd <= 0;
				val_rn <= 0;
				val_rm <= 0;
				imm <= 0;
				shift_operand <= 0;
				signed_imm_24 <= 0;
				dest <= 0;
				pc <= 0;
				sr <= 0;
				src1_out <= 0;
				src2_out <= 0;
				// exam
				ret_sig_out <= 0;
			end
			else begin
				wb_en <= wb_en_in;
				mem_r_en <= mem_r_en_in;
				mem_w_en <= mem_w_en_in;
				b <= b_in;
				s <= s_in;
				exe_cmd <= exe_cmd_in;
				val_rn <= val_rn_in;
				val_rm <= val_rm_in;
				imm <= imm_in;
				shift_operand <= shift_operand_in;
				signed_imm_24 <= signed_imm_24_in;
				dest <= dest_in;
				pc <= pc_in;
				sr <= sr_in;
				src1_out <= src1_in;
				src2_out <= src2_in;
				// exam
				ret_sig_out <= ret_sig_in;
			end
		end
	end
endmodule
