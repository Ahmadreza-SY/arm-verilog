module DataMemory (
    input clk, rst, mem_r_en, mem_w_en,
    input [31:0] address, dataIn,
    output [31:0] dataOut
  );
  integer i;
  reg [31:0] dataMem [0:2047];
  wire[31:0] converted_address;
  assign converted_address = (address - 1024) >> 2;

  always @ (posedge clk) begin
    if (rst)
      for (i = 0; i < 2048; i = i + 1)
        dataMem[i] <= 0;
    else if (mem_w_en)
      dataMem[converted_address] <= dataIn;
  end

  assign dataOut = (mem_r_en == 1) ? dataMem[converted_address] : 0;
endmodule