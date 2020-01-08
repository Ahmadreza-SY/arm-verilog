
`include "constants.v"

module ALU (
  input [31:0] val1, val2,
  input C,
  input [3:0] exe_cmd,
  output reg[31:0] alu_out,
  output reg[3:0] nzcv
);
  parameter N = 32;

  always @ ( * ) begin
    nzcv = 4'b0;
    case (exe_cmd)
      `EXE_MOV: alu_out = val2;
      `EXE_MVN: alu_out = ~val2;
      `EXE_ADD: begin
        {nzcv[1], alu_out} = val1 + val2;  
        nzcv[0] = ~(val1[N-1]^val2[N-1]) & (val1[N-1]^alu_out[N-1]);
      end
      `EXE_ADC: begin
        {nzcv[1], alu_out} = val1 + val2 + C;  
        nzcv[0] = ~(val1[N-1]^val2[N-1]) & (val1[N-1]^alu_out[N-1]);
      end
      `EXE_SUB: begin
        {nzcv[1], alu_out} = val1 - val2;  
        nzcv[0] = (val1[N-1]^val2[N-1]) & (val1[N-1]^alu_out[N-1]);
      end
      `EXE_SBC: begin
        {nzcv[1], alu_out} = val1 - val2 + C - 1;  
        nzcv[0] = (val1[N-1]^val2[N-1]) & (val1[N-1]^alu_out[N-1]);
      end 
      `EXE_MUL: alu_out = val1 * val2; // FIXME should work fine! (done)
      `EXE_AND: alu_out = val1 & val2;
      `EXE_ORR: alu_out = val1 | val2;
      `EXE_EOR: alu_out = val1 ^ val2;
      `EXE_CMP: begin
        {nzcv[1], alu_out} = val1 - val2;  
        nzcv[0] = (val1[N-1]^val2[N-1]) & (val1[N-1]^alu_out[N-1]);
      end
      `EXE_TST: alu_out = val1 & val2;
      `EXE_LDR: {nzcv[1], alu_out} = val1 + val2;
      `EXE_STR: {nzcv[1], alu_out} = val1 + val2;
      default: alu_out = 0;
    endcase
    
    nzcv[3] = alu_out[31];
    nzcv[2] = (alu_out == 0);
  end
endmodule