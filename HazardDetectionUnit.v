module HazardDetectionUnit(
	  input [3:0] src1, src2,
	  input [3:0] Exe_Dest, Mem_Dest,
	  input Exe_WB_EN, Mem_WB_EN, is_imm, is_str, 
    input MEM_R_EN_EXE, 
    input fu_EN, 
	  output hazard_detected
  );

  wire src2_is_valid, exe_has_hazard, mem_has_hazard, hazard;

  assign src2_is_valid =  (~is_imm) || is_str;

  assign exe_has_hazard = fu_EN 
                          ?  MEM_R_EN_EXE && (Exe_Dest == src1 || Exe_Dest == src2)
                          : Exe_WB_EN && (src1 == Exe_Dest || (src2_is_valid && src2 == Exe_Dest));
  assign mem_has_hazard = fu_EN ? 1'b0 : Mem_WB_EN && (src1 == Mem_Dest || (src2_is_valid && src2 == Mem_Dest));

  assign hazard = (exe_has_hazard || mem_has_hazard);

  assign hazard_detected = hazard;
endmodule