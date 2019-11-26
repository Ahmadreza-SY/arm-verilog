module DataMemory (
    input clk, rst, mem_r_en, mem_w_en,
    input [31:0] address, dataIn,
    output [31:0] dataOut
  );
  integer i;
  reg [31:0] dataMem [0:63];

  always @ (posedge clk) begin
    if (rst)
      for (i = 0; i < 64; i = i + 1)
        dataMem[i] <= 0;
    else if (mem_w_en)
      dataMem[address] <= dataIn;
  end

  assign dataOut = (mem_r_en == 1) ? dataMem[address] : 0;
endmodule