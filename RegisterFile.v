module RegisterFile (
  input clk, rst, writeBackEn,
  input [3:0] src1, src2, Dest_wb,
  input [31:0] Result_WB,
  output [31:0] reg1, reg2
  );

  reg [31:0] registerMemory [0:31];
  integer i;

  always @ (negedge clk) begin
    if (rst) begin
      for (i = 0; i < 32; i = i + 1)
        registerMemory[i] <= i[31:0];
	    end

    else if (writeBackEn) registerMemory[Dest_wb] <= Result_WB;
    registerMemory[0] <= 0;
  end

  assign reg1 = (registerMemory[src1]);
  assign reg2 = (registerMemory[src2]);
endmodule