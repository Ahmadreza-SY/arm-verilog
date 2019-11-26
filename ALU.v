`include "constants.v"

module ALU (
	input [31:0] val1, val2,
	input C,
	input [3:0] exe_cmd,
	output reg[31:0] alu_out,
	output reg[3:0] nzcv
);

  always @ ( * ) begin
    nzcv = 4'b0;
    case (exe_cmd)
      `EXE_MOV: alu_out = val2;
      `EXE_MVN: alu_out = ~val2;
      `EXE_ADD: {nzcv[1], alu_out} = val1 + val2;
      `EXE_ADC: {nzcv[1], alu_out} = val1 + val2 + C;
      `EXE_SUB: {nzcv[1], alu_out} = val1 - val2;
      `EXE_SBC: {nzcv[1], alu_out} = val1 - val2 - 32'd1;
      `EXE_AND: alu_out = val1 & val2;
      `EXE_ORR: alu_out = val1 | val2;
      `EXE_EOR: alu_out = val1 ^ val2;
      `EXE_CMP: {nzcv[1], alu_out} = val1 - val2;
      `EXE_TST: alu_out = val1 & val2;
      `EXE_LDR: {nzcv[1], alu_out} = val1 + val2;
      `EXE_STR: {nzcv[1], alu_out} = val1 + val2;
      default: alu_out = 0;
    endcase
    
    nzcv[3] = alu_out[31];
    nzcv[2] = (alu_out == 0);
  end
endmodule