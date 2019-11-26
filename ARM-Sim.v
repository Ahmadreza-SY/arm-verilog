module ARMSIM(input CLOCK_50, rst, output[31:0] pc_out, instuction_out);
	wire[31:0] if_pc_out, if_instruction_out;
	wire[31:0] ifreg_pc_out;
	// ID Stage outs
	wire id_wb_en_out, id_mem_r_en_out, id_mem_w_en_out, id_b_out, id_s_out;
	wire[3:0] id_exe_cmd_out;
	wire[31:0] id_val_rn_out, id_val_rm_out;
	wire id_imm_out;
	wire[11:0] id_shift_operand_out;
	wire[23:0] id_signed_imm_24_out;
	wire[3:0] id_dest_out;

	// IDReg Stage outs
	wire idreg_wb_en_out, idreg_mem_r_en_out, idreg_mem_w_en_out;
	wire idreg_b_out, idreg_s_out;
	wire[3:0] idreg_exe_cmd_out;
	wire[31:0] idreg_val_rn_out, idreg_val_rm_out;
	wire idreg_imm_out;
	wire[11:0] idreg_shift_operand_out;
	wire[23:0] idreg_signed_imm_24_out;
	wire[3:0] idreg_dest_out;
  	wire[31:0] idreg_pc_out;
  	wire[3:0] idreg_sr_out;

  	// EXEC Stage outs
  	wire[31:0] exec_alu_result_out, exec_br_addr_out;
 	wire[3:0] exec_status_out;

 	// EXECReg Stage outs
 	wire execreg_wb_en_out, execreg_mem_r_en_out, execreg_mem_w_en_out;
	wire[31:0] execreg_alu_result_out, execreg_st_val_out;
	wire[3:0] execreg_dest_out;

	// MEM Stage outs
	wire[31:0] mem_result_out;

	// MEMReg Stage outs
	wire memreg_wb_en_out, memreg_mem_r_en_out;
	wire[31:0] memreg_alu_result_out, memreg_mem_read_value_out;
	wire[3:0] memreg_dest_out;

	// WBReg Stage outs
	wire[31:0] wb_out;

	wire[31:0] status_reg_out;

	IF_Stage ifStage (
		.clk(CLOCK_50),
		.rst(rst),
		.freeze(1'b0),
		.branch_taken(idreg_b_out),
		.branch_addr(exec_br_addr_out),
		.pc(if_pc_out),
		.instruction(if_instruction_out)
	);

	IF_Stage_Reg ifStageReg (
		.clk(CLOCK_50),
		.rst(rst),
		.freeze(1'b0),
		.flush(idreg_b_out),
		.pc_in(if_pc_out),
		.instuction_in(if_instruction_out),
		.pc(ifreg_pc_out),
		.instruction(instuction_out)
	);

	ID_Stage idStage (
		// inputs
		.clk(CLOCK_50), 
		.rst(rst),
		// from if
		.instruction(instuction_out),
		// from wb
		.result_wb(wb_out),
		.write_back_in(memreg_wb_en_out),
		.dest_wb(memreg_dest_out),
		// from status reg
		.sr(status_reg_out),
		// outputs
		.wb_en(id_wb_en_out),
		.mem_r_en(id_mem_r_en_out),
		.mem_w_en(id_mem_w_en_out),
		.b(id_b_out),
		.s(id_s_out),
		.exe_cmd(id_exe_cmd_out),
		.val_rn(id_val_rn_out),
		.val_rm(id_val_rm_out),
		.imm(id_imm_out),
		.shift_operand(id_shift_operand_out),
		.signed_imm_24(id_signed_imm_24_out),
		.dest(id_dest_out)
	);


	ID_Stage_Reg idStageReg (
		.clk(CLOCK_50),
		.rst(rst),
		.flush(idreg_b_out),
		.pc_in(ifreg_pc_out),
		.wb_en_in(id_wb_en_out),
		.mem_r_en_in(id_mem_r_en_out),
		.mem_w_en_in(id_mem_w_en_out), 
		.b_in(id_b_out),
		.s_in(id_s_out),
		.exe_cmd_in(id_exe_cmd_out),
		.val_rn_in(id_val_rn_out),
		.val_rm_in(id_val_rm_out),
		.imm_in(id_imm_out),
		.shift_operand_in(id_shift_operand_out),
		.signed_imm_24_in(id_signed_imm_24_out),
		.dest_in(id_dest_out),
		.sr_in(status_reg_out[31:28]),
		
		// outputs
		.wb_en(idreg_wb_en_out), 
		.b(idreg_b_out),
		.s(idreg_s_out),
		.exe_cmd(idreg_exe_cmd_out),
		.val_rn(idreg_val_rn_out), 
		.val_rm(idreg_val_rm_out),
		.mem_r_en(idreg_mem_r_en_out), 
		.mem_w_en(idreg_mem_w_en_out), 
		.imm(idreg_imm_out),
		.shift_operand(idreg_shift_operand_out),
		.signed_imm_24(idreg_signed_imm_24_out),
		.dest(idreg_dest_out),
		.pc(idreg_pc_out),
		.sr(idreg_sr_out)
	);

	Register statusReg (
		.clk(CLOCK_50),
		.rst(rst),
		.write_en(idreg_s_out),
		.reg_in({exec_status_out, 28'b0}), 
		.reg_out(status_reg_out)
	);

	EXEC_Stage execStage (
		.clk(CLOCK_50),
		.pc_in(idreg_pc_out),
		
		.exe_cmd(idreg_exe_cmd_out),
		.val_rn(idreg_val_rn_out),
		.val_rm(idreg_val_rm_out),
		.mem_r_en(idreg_mem_r_en_out),
		.mem_w_en(idreg_mem_w_en_out),
		.imm(idreg_imm_out),
		.shift_operand(idreg_shift_operand_out),
		.signed_imm_24(idreg_signed_imm_24_out),
		.sr(idreg_sr_out),

		// outputs
		.alu_result(exec_alu_result_out),
		.br_addr(exec_br_addr_out),
		.status(exec_status_out)
	);

	EXEC_Stage_Reg execStageReg (
		.clk(CLOCK_50),
		.rst(rst),
		.wb_en_in(idreg_wb_en_out),
		.mem_r_en_in(idreg_mem_r_en_out),
		.mem_w_en_in(idreg_mem_w_en_out),
		.alu_result_in(exec_alu_result_out),
		.st_val_in({exec_status_out, 28'b0}),
		.dest_in(idreg_dest_out),
		// outs
		.wb_en(execreg_wb_en_out),
		.mem_r_en(execreg_mem_r_en_out),
		.mem_w_en(execreg_mem_w_en_out),
		.alu_result(execreg_alu_result_out),
		.st_val(execreg_st_val_out),
		.dest(execreg_dest_out)
	);

	MEM_Stage memStage (
		.clk(CLOCK_50), 
		.rst(rst),
		.mem_read(execreg_mem_r_en_out), 
		.mem_write(execreg_mem_w_en_out),
		.address(execreg_st_val_out), 
		.data(execreg_alu_result_out),
		// outputs
		.mem_result(mem_result_out)
	);

	MEM_Stage_Reg memStageReg (
		.clk(CLOCK_50), 
		.rst(rst), 
		.wb_en_in(execreg_wb_en_out), 
		.mem_r_en_in(execreg_mem_r_en_out),
		.alu_result_in(execreg_alu_result_out), 
		.mem_read_value_in(mem_result_out),
		.dest_in(execreg_dest_out),
		// outputs
		.wb_en(memreg_wb_en_out), 
		.mem_r_en(memreg_mem_r_en_out),
		.alu_result(memreg_alu_result_out), 
		.mem_read_value(memreg_mem_read_value_out),
		.dest(memreg_dest_out)
	);

	WB_Stage wbStage (
		.alu_result(memreg_alu_result_out), 
		.mem_result(memreg_mem_read_value_out),
		.mem_r_en(memreg_mem_r_en_out),
		// outs
		.out(wb_out)
	);

endmodule
