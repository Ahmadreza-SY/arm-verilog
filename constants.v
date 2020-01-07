
// To be used inside controller.v
`define OP_NOP 4'b0000
`define OP_MOV 4'b1101
`define OP_MVN 4'b1111
`define OP_ADD 4'b0100
`define OP_ADC 4'b0101
`define OP_SUB 4'b0010
`define OP_SBC 4'b0110
`define OP_AND 4'b0000
`define OP_ORR 4'b1100
`define OP_EOR 4'b0001
`define OP_CMP 4'b1010
`define OP_TST 4'b1000
`define OP_LDR 4'b0100
`define OP_STR 4'b0100
`define OP_B 4'b0111
// exam
`define OP_BL 4'b1000
`define OP_RET 4'b1110


// To be used in side ALU // TODO:
`define EXE_NOP 4'b0000
`define EXE_MOV 4'b1101
`define EXE_MVN 4'b1111
`define EXE_ADD 4'b0100
`define EXE_ADC 4'b0101
`define EXE_SUB 4'b0010
`define EXE_SBC 4'b0110
`define EXE_AND 4'b0000
`define EXE_ORR 4'b1100
`define EXE_EOR 4'b0001
`define EXE_CMP 4'b1010
`define EXE_TST 4'b1000
`define EXE_LDR 4'b0100
`define EXE_STR 4'b0100
// exam
`define EXE_RET 4'b1110