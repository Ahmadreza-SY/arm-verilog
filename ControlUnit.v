`include "constants.v"

module ControlUnit (
    input S,
    input [1:0] mode,
    input [3:0] opCode,
    output reg B,
    output reg [3:0] ExecuteCommand,
    output reg S_out, WB_Enable, mem_read, mem_write
  );

  always @ ( * ) begin
    {B, ExecuteCommand, S_out, WB_Enable, mem_read, mem_write} <= 0;
    case (mode)
      2'b00: begin
        S_out <= S;
        case (opCode)
          `OP_NOP: begin ExecuteCommand <= `EXE_NOP; WB_Enable <= 1; end
          `OP_MOV: begin ExecuteCommand <= `EXE_MOV; WB_Enable <= 1; end
          `OP_MVN: begin ExecuteCommand <= `EXE_MVN; WB_Enable <= 1; end
          `OP_ADD:  begin ExecuteCommand <= `EXE_ADD;  WB_Enable <= 1; end
          `OP_ADC: begin ExecuteCommand <= `EXE_ADC; WB_Enable <= 1; end
          `OP_SUB: begin ExecuteCommand <= `EXE_SUB; WB_Enable <= 1; end
          `OP_SBC: begin ExecuteCommand <= `EXE_SBC; WB_Enable <= 1; end
          `OP_AND: begin ExecuteCommand <= `EXE_AND; WB_Enable <= 1; end
          `OP_ORR: begin ExecuteCommand <= `EXE_ORR; WB_Enable <= 1; end
          `OP_EOR: begin ExecuteCommand <= `EXE_EOR; WB_Enable <= 1; end

          // operations using an immediate value embedded in the instruction
          `OP_CMP: begin ExecuteCommand <= `EXE_CMP; WB_Enable <= 1; end
          `OP_TST: begin ExecuteCommand <= `EXE_TST; WB_Enable <= 1; end
          
          // default: {B, ExecuteCommand, WB_Enable, mem_read, mem_write} <= 0;
      endcase
      end
      2'b01: begin 
        case (opCode)
          `OP_LDR: begin ExecuteCommand <= `EXE_LDR; WB_Enable <= 1;  mem_read <= 1; end
          `OP_STR: begin ExecuteCommand <= `EXE_STR; mem_write <= 1;  end
        endcase
      end
      2'b10: begin 
        case (opCode)
          `OP_B: begin ExecuteCommand <= `EXE_NOP; B <= 1; end
        endcase
      end
      
      // default: {B, ExecuteCommand, S_out, WB_Enable, mem_read, mem_write} <= 0;
    endcase
  end
endmodule
