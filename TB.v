module aaa_tb ();
 
  reg clk, rst;
  wire[31:0] pc_out;
 
  ARMSIM armsim (
		.CLOCK_50(clk),
		.rst(rst),
		.pc_out(pc_out)
	);
 
  initial begin
    clk = 1'b0;
    rst = 1'b1;
    repeat(4) #10 clk = ~clk;
    rst = 1'b0;
    forever #10 clk = ~clk;
  end
 
endmodule