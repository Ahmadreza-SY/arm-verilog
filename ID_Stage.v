`include "constants.v"

module ID_Stage(
	input clk, rst,
	input[31:0] instruction,
	// exam
	input[31:0] pc,
	input[31:0] result_wb,
	input write_back_in,
	input[3:0] dest_wb,
	input[3:0] sr,
	input hazard,
	
	output wb_en, mem_r_en, mem_w_en, b, s,
	output[3:0] exe_cmd,
	output[31:0] val_rn, val_rm,
	output imm,
	output[11:0] shift_operand,
	output[23:0] signed_imm_24,
	output[3:0] dest,
	// exam
	output ret_sig
);
	wire w_s, w_b, w_mem_w_en, w_mem_r_en, w_wb_en;
	wire [3:0] w_exe_cmd;
	wire w_condOut;
	wire [3:0] src2;
	// regFileSrc1Mux
	assign src2 = (instruction[24:21] == `OP_STR && instruction[27:26] == 2'b01) ? instruction[15:12] : (imm == 1'b0 && instruction[4] == 0) ? instruction[3:0] : 4'b0;
	// exam
	wire [3:0] src1;
	wire isBL = instruction[24] & (instruction[27:26] == 2'b10);
	assign src1 = ret_sig ? 4'd14 : instruction[19:16];

	RegisterFile registerFile (
	  .clk(clk),
	  .rst(rst),
	  .writeBackEn(write_back_in),
	  // exam
	  .src1(src1),
	  .bl(isBL),
	  .pc(pc),
	  // .src1(instruction[19:16]),
	  .src2(src2),
	  .Dest_wb(dest_wb),
	  .Result_WB(result_wb),
	  // outputs
	  .reg1(val_rn),
	  .reg2(val_rm)
  	);

  	ConditionCheck condtionCheck (
	    .cond(instruction[31:28]), 
	    .nzcv(sr),
	    .condOut(w_condOut)
  	);

  	ControlUnit controlUnit (
	    .S(instruction[20]),
	    .mode(instruction[27:26]),
	    .opCode(instruction[24:21]),
	    .S_out(w_s),
	    .B(w_b),
	    .ExecuteCommand(w_exe_cmd),
	    .mem_write(w_mem_w_en),
	    .mem_read(w_mem_r_en),
	    .WB_Enable(w_wb_en),
	    // exam
	    .ret_sig(ret_sig)
  	);
  	
  	assign {s, b, mem_w_en, mem_r_en, wb_en, exe_cmd} = (~w_condOut || hazard) ? 13'd0 : {w_s, w_b, w_mem_w_en, w_mem_r_en, w_wb_en, w_exe_cmd};
  	assign {imm, signed_imm_24, shift_operand, dest} = {instruction[25], instruction[23:0], instruction[11:0], instruction[15:12]};

endmodule
