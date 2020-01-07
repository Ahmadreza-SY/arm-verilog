module RegisterFile (
  input clk, rst, writeBackEn,
  input [3:0] src1, src2, Dest_wb,
  input [31:0] Result_WB,
  // exam
  input bl,
  input [31:0] pc,
  output [31:0] reg1, reg2
  );

  reg [31:0] registerMemory [0:15];
  integer i;

  always @ (negedge clk) begin
    if (rst) begin
      for (i = 0; i < 16; i = i + 1)
        registerMemory[i] <= i[31:0];
	    end
    else if (writeBackEn) registerMemory[Dest_wb] <= Result_WB;
    // exam
    if (bl) begin
      registerMemory[14] <= pc;
    end
  end

  assign reg1 = (registerMemory[src1]);
  assign reg2 = (registerMemory[src2]);
endmodule