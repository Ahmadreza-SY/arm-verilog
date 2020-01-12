module aa_tb ();
 
  reg clk, rst, fu_EN;
 
  ARMSIM armsim (
		.CLOCK_50(clk),
		.rst(rst),
    .fu_EN(fu_EN)
	);
 
  initial begin
    fu_EN = 1'b0;
    clk = 1'b1;
    rst = 1'b1;
    repeat(4) #10 clk = ~clk;
    rst = 1'b0;
    forever #10 clk = ~clk;
  end
 
endmodule