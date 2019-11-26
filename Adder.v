module Adder (
	input [31:0] in_1, in_2, 
	output[31:0] out
);
  assign out = in_1 + in_2;
endmodule
