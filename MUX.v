module MUX(
	input[31:0] in_1, in_2, 
	input select, 
	output[31:0] out
);
  assign out = select ? in_2 : in_1;
endmodule