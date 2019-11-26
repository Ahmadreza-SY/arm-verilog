module Val2Generate (
	input[31:0] val_rm,
	input[11:0] shift_operand,
	input los, imm,
	output[31:0] val2
);

	assign val2 = (los == 1'd1) ? {20'b0, shift_operand} 
				: (imm == 1'd1) ? {24'b0, shift_operand[7:0]} >> (shift_operand[11:8] << 1) 
				: (shift_operand[6:5] == 2'b00) ? val_rm << 1'b0 
				: (shift_operand[6:5] == 2'b01) ? val_rm >> 1'b0 
				: (shift_operand[6:5] == 2'b10) ? val_rm >>> 1'b0 
				: (shift_operand[6:5] == 2'b11) ? {val_rm[0], val_rm[30:0]}
				: 32'd0;

endmodule