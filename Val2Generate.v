module Val2Generate (
	input[31:0] val_rm,
	input[11:0] shift_operand,
	input los, imm,
	output[31:0] val2
);

	// always @* begin
	// 	if (los) val2 = {20'b0, shift_operand};
	// 	else if (imm) begin
	// 		shiftby = {4'b0000, shift_operand[11:8]} << 1;
	// 		imm_value = {24'b0, shift_operand[7:0]};
	// 		{temp,val2} = {imm_value,imm_value} >> shiftby;
	// 	end
	// 	else if (shift_operand[6:5] == 2'b00) val2 = val_rm << shift_operand[11:7] ;
	// 	else if (shift_operand[6:5] == 2'b01) val2 = val_rm >> shift_operand[11:7] ;
	// 	else if (shift_operand[6:5] == 2'b10) val2 = val_rm >>> shift_operand[11:7] ;
	// 	else if (shift_operand[6:5] == 2'b11) val2 = {val_rm[0], val_rm[30:0]};
	// 	else val2 = 32'd0;
	// end

	assign val2 = los ? {20'b0, shift_operand} :
				  imm ? {{{24'b0, shift_operand[7:0]},{24'b0, shift_operand[7:0]}} >> {{4'b0000, shift_operand[11:8]} << 1}} :
				  shift_operand[6:5] == 2'b00 ? val_rm << shift_operand[11:7]  :
				  shift_operand[6:5] == 2'b01 ? val_rm >> shift_operand[11:7]  :
				  shift_operand[6:5] == 2'b10 ? val_rm >>> shift_operand[11:7]  :
				  shift_operand[6:5] == 2'b11 ? {val_rm[0], val_rm[30:0]} :
				  32'd0;

endmodule