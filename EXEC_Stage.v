module EXEC_Stage (
	input clk,
	input[31:0] pc_in,
	input[3:0] exe_cmd,
	input mem_r_en, mem_w_en,
	input[31:0] val_rn, val_rm,
	input imm,
	input[11:0] shift_operand,
	input[23:0] signed_imm_24,
	input[3:0] sr,
	// forwarding inputs
	input[1:0] src1_sel, src2_sel,
	input[31:0] wb_value, mem_alu_res,

	// exam
	input ret_sig,

	output[31:0] alu_result, br_addr,
	output[3:0] status
);
	wire [31:0] alu_1_wire, alu_2_wire;
	wire[31:0] val2;
	// exam
	wire[31:0] br_adder_out;
	assign br_addr = ret_sig ? val_rn : br_adder_out;
	
	Val2Generate val2_gen (
		.val_rm(alu_2_wire),
		.shift_operand(shift_operand),
		.los(mem_r_en | mem_w_en),
		.imm(imm),
		.val2(val2)
	);

	Adder adder (
		.in_1(pc_in),
		.in_2({{8{signed_imm_24[23]}}, signed_imm_24}),
		.out(br_adder_out)
	);

	ALU alu (
		.val1(alu_1_wire),
		.val2(val2),
		.C(sr[1]),
		.exe_cmd(exe_cmd),
		.alu_out(alu_result),
		.nzcv(status)
	);

	Forward_ALU_Mux lal1 (
		.reg_ex_in(val_rn), 
		.reg_wb_in(wb_value), 
		.reg_mem_in(mem_alu_res), 
		.forward_control_in(src1_sel), 
		.reg_out(alu_1_wire)
	);

	Forward_ALU_Mux lal2 (
		.reg_ex_in(val_rm), 
		.reg_wb_in(wb_value), 
		.reg_mem_in(mem_alu_res), 
		.forward_control_in(src2_sel), 
		.reg_out(alu_2_wire)
	);

endmodule
