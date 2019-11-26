module MEM_Stage (
	input clk, rst, mem_read, mem_write,
	input[31:0] address, data,

	output[31:0] mem_result
);

	DataMemory dataMemory(
		.clk(clk),
		.rst(rst),
		.mem_r_en(mem_read),
		.mem_w_en(mem_write),
		.address(address),
		.dataIn(data),
		.dataOut(mem_result)
	);

endmodule
