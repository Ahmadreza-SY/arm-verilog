module IF_Stage_Reg (
	input clk, rst, freeze, flush,
	input[31:0] pc_in, instuction_in,
	
	output reg [31:0] pc, instruction
);
	always @ (posedge clk) begin
		if (rst) begin
			pc <= 0;
			instruction <= 0;
		end
		else begin
			if (~freeze) begin
				if (flush) begin
					instruction <= 0;
					pc <= 0;
				end
				else begin
					instruction <= instuction_in;
					pc <= pc_in;
				end
			end
		end
	end
endmodule
