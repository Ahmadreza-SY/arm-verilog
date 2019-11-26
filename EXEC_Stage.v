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
	output[31:0] alu_result, br_addr,
	output[3:0] status
);
	wire[31:0] val2;
	Val2Generate val2_gen (
		.val_rm(val_rm),
		.shift_operand(shift_operand),
		.los(mem_r_en | mem_w_en),
		.imm(imm),
		.val2(val2)
	);

	Adder adder (
		.in_1(pc_in),
		.in_2({8'b00000000, signed_imm_24}),
		.out(br_addr)
	);

	ALU alu (
		.val1(val_rn),
		.val2(val2),
		.C(sr[1]),
		.exe_cmd(exe_cmd),
		.alu_out(alu_result),
		.nzcv(status)
	);

endmodule
