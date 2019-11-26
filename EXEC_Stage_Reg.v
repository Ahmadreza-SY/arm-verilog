module EXEC_Stage_Reg (
	input clk, rst,
	input wb_en_in, mem_r_en_in, mem_w_en_in,
	input[31:0] alu_result_in, st_val_in,
	input[3:0] dest_in,

	output reg wb_en, mem_r_en, mem_w_en,
	output reg[31:0] alu_result, st_val,
	output reg[3:0] dest
);
	always @ (posedge clk) begin
	    if (rst) begin
	      {wb_en, mem_r_en, mem_w_en, alu_result, st_val, dest} <= 0;
	    end
	    else begin
   			wb_en <= wb_en_in; 
   			mem_r_en <= mem_r_en_in; 
   			mem_w_en <= mem_w_en_in; 
   			alu_result <= alu_result_in; 
   			st_val <= st_val_in; 
   			dest <= dest_in; 
	    end
	end
endmodule
