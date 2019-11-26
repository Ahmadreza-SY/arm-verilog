module Register (
	input clk, rst, write_en, 
	input[31:0] reg_in, 
	output reg[31:0] reg_out
);
  always @ (posedge clk) begin
    if (rst == 1) reg_out <= 0;
    else if (write_en) reg_out <= reg_in;
  end
endmodule
