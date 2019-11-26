module IF_Stage (
	input clk, rst, freeze, branch_taken,
	input[31:0] branch_addr,

	output[31:0] pc, instruction
);

	wire[31:0] mux_out, pc_out;
	
	Register pcReg (
		.clk(clk),
		.rst(rst),
		.write_en(~freeze),
		.reg_in(mux_out),
		.reg_out(pc_out)
	);

	MUX ifMux (
		.in_1(pc),
		.in_2(branch_addr),
		.select(branch_taken),
		.out(mux_out)
	);

	Adder pcInc (
		.in_1(pc_out),
		.in_2(32'd1),
		.out(pc)
	);

	InstructionMem instructionMem (
		.rst(rst),
		.addr(pc_out),
		.instruction(instruction)
	);

endmodule
