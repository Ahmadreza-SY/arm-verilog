module ARM
	(
		////////////////////	Clock Input	 	////////////////////	 
		CLOCK_27,						//	27 MHz
		CLOCK_50,						//	50 MHz
		EXT_CLOCK,						//	External Clock
		////////////////////	Push Button		////////////////////
		KEY,							//	Pushbutton[3:0]
		////////////////////	DPDT Switch		////////////////////
		SW,								//	Toggle Switch[17:0]
		////////////////////	7-SEG Dispaly	////////////////////
		HEX0,							//	Seven Segment Digit 0
		HEX1,							//	Seven Segment Digit 1
		HEX2,							//	Seven Segment Digit 2
		HEX3,							//	Seven Segment Digit 3
		HEX4,							//	Seven Segment Digit 4
		HEX5,							//	Seven Segment Digit 5
		HEX6,							//	Seven Segment Digit 6
		HEX7,							//	Seven Segment Digit 7
		////////////////////////	LED		////////////////////////
		LEDG,							//	LED Green[8:0]
		LEDR,							//	LED Red[17:0]
		////////////////////////	UART	////////////////////////
		//UART_TXD,						//	UART Transmitter
		//UART_RXD,						//	UART Receiver
		////////////////////////	IRDA	////////////////////////
		//IRDA_TXD,						//	IRDA Transmitter
		//IRDA_RXD,						//	IRDA Receiver
		/////////////////////	SDRAM Interface		////////////////
		DRAM_DQ,						//	SDRAM Data bus 16 Bits
		DRAM_ADDR,						//	SDRAM Address bus 12 Bits
		DRAM_LDQM,						//	SDRAM Low-byte Data Mask 
		DRAM_UDQM,						//	SDRAM High-byte Data Mask
		DRAM_WE_N,						//	SDRAM Write Enable
		DRAM_CAS_N,						//	SDRAM Column Address Strobe
		DRAM_RAS_N,						//	SDRAM Row Address Strobe
		DRAM_CS_N,						//	SDRAM Chip Select
		DRAM_BA_0,						//	SDRAM Bank Address 0
		DRAM_BA_1,						//	SDRAM Bank Address 0
		DRAM_CLK,						//	SDRAM Clock
		DRAM_CKE,						//	SDRAM Clock Enable
		////////////////////	Flash Interface		////////////////
		FL_DQ,							//	FLASH Data bus 8 Bits
		FL_ADDR,						//	FLASH Address bus 22 Bits
		FL_WE_N,						//	FLASH Write Enable
		FL_RST_N,						//	FLASH Reset
		FL_OE_N,						//	FLASH Output Enable
		FL_CE_N,						//	FLASH Chip Enable
		////////////////////	SRAM Interface		////////////////
		SRAM_DQ,						//	SRAM Data bus 16 Bits
		SRAM_ADDR,						//	SRAM Address bus 18 Bits
		SRAM_UB_N,						//	SRAM High-byte Data Mask 
		SRAM_LB_N,						//	SRAM Low-byte Data Mask 
		SRAM_WE_N,						//	SRAM Write Enable
		SRAM_CE_N,						//	SRAM Chip Enable
		SRAM_OE_N,						//	SRAM Output Enable
		////////////////////	ISP1362 Interface	////////////////
		OTG_DATA,						//	ISP1362 Data bus 16 Bits
		OTG_ADDR,						//	ISP1362 Address 2 Bits
		OTG_CS_N,						//	ISP1362 Chip Select
		OTG_RD_N,						//	ISP1362 Write
		OTG_WR_N,						//	ISP1362 Read
		OTG_RST_N,						//	ISP1362 Reset
		OTG_FSPEED,						//	USB Full Speed,	0 = Enable, Z = Disable
		OTG_LSPEED,						//	USB Low Speed, 	0 = Enable, Z = Disable
		OTG_INT0,						//	ISP1362 Interrupt 0
		OTG_INT1,						//	ISP1362 Interrupt 1
		OTG_DREQ0,						//	ISP1362 DMA Request 0
		OTG_DREQ1,						//	ISP1362 DMA Request 1
		OTG_DACK0_N,					//	ISP1362 DMA Acknowledge 0
		OTG_DACK1_N,					//	ISP1362 DMA Acknowledge 1
		////////////////////	LCD Module 16X2		////////////////
		LCD_ON,							//	LCD Power ON/OFF
		LCD_BLON,						//	LCD Back Light ON/OFF
		LCD_RW,							//	LCD Read/Write Select, 0 = Write, 1 = Read
		LCD_EN,							//	LCD Enable
		LCD_RS,							//	LCD Command/Data Select, 0 = Command, 1 = Data
		LCD_DATA,						//	LCD Data bus 8 bits
		////////////////////	SD_Card Interface	////////////////
		//SD_DAT,							//	SD Card Data
		//SD_WP_N,						   //	SD Write protect 
		//SD_CMD,							//	SD Card Command Signal
		//SD_CLK,							//	SD Card Clock
		////////////////////	USB JTAG link	////////////////////
		TDI,  							// CPLD -> FPGA (data in)
		TCK,  							// CPLD -> FPGA (clk)
		TCS,  							// CPLD -> FPGA (CS)
	   TDO,  							// FPGA -> CPLD (data out)
		////////////////////	I2C		////////////////////////////
		I2C_SDAT,						//	I2C Data
		I2C_SCLK,						//	I2C Clock
		////////////////////	PS2		////////////////////////////
		PS2_DAT,						//	PS2 Data
		PS2_CLK,						//	PS2 Clock
		////////////////////	VGA		////////////////////////////
		VGA_CLK,   						//	VGA Clock
		VGA_HS,							//	VGA H_SYNC
		VGA_VS,							//	VGA V_SYNC
		VGA_BLANK,						//	VGA BLANK
		VGA_SYNC,						//	VGA SYNC
		VGA_R,   						//	VGA Red[9:0]
		VGA_G,	 						//	VGA Green[9:0]
		VGA_B,  						//	VGA Blue[9:0]
		////////////	Ethernet Interface	////////////////////////
		ENET_DATA,						//	DM9000A DATA bus 16Bits
		ENET_CMD,						//	DM9000A Command/Data Select, 0 = Command, 1 = Data
		ENET_CS_N,						//	DM9000A Chip Select
		ENET_WR_N,						//	DM9000A Write
		ENET_RD_N,						//	DM9000A Read
		ENET_RST_N,						//	DM9000A Reset
		ENET_INT,						//	DM9000A Interrupt
		ENET_CLK,						//	DM9000A Clock 25 MHz
		////////////////	Audio CODEC		////////////////////////
		AUD_ADCLRCK,					//	Audio CODEC ADC LR Clock
		AUD_ADCDAT,						//	Audio CODEC ADC Data
		AUD_DACLRCK,					//	Audio CODEC DAC LR Clock
		AUD_DACDAT,						//	Audio CODEC DAC Data
		AUD_BCLK,						//	Audio CODEC Bit-Stream Clock
		AUD_XCK,						//	Audio CODEC Chip Clock
		////////////////	TV Decoder		////////////////////////
		TD_DATA,    					//	TV Decoder Data bus 8 bits
		TD_HS,							//	TV Decoder H_SYNC
		TD_VS,							//	TV Decoder V_SYNC
		TD_RESET,						//	TV Decoder Reset
		TD_CLK27,                  //	TV Decoder 27MHz CLK
		////////////////////	GPIO	////////////////////////////
		GPIO_0,							//	GPIO Connection 0
		GPIO_1							//	GPIO Connection 1
	);
////////////////////////	Clock Input	 	////////////////////////
input		   	CLOCK_27;				//	27 MHz
input		   	CLOCK_50;				//	50 MHz
input			   EXT_CLOCK;				//	External Clock
////////////////////////	Push Button		////////////////////////
input	   [3:0]	KEY;					//	Pushbutton[3:0]
////////////////////////	DPDT Switch		////////////////////////
input	  [17:0]	SW;						//	Toggle Switch[17:0]
////////////////////////	7-SEG Dispaly	////////////////////////
output	[6:0]	HEX0;					//	Seven Segment Digit 0
output	[6:0]	HEX1;					//	Seven Segment Digit 1
output	[6:0]	HEX2;					//	Seven Segment Digit 2
output	[6:0]	HEX3;					//	Seven Segment Digit 3
output	[6:0]	HEX4;					//	Seven Segment Digit 4
output	[6:0]	HEX5;					//	Seven Segment Digit 5
output	[6:0]	HEX6;					//	Seven Segment Digit 6
output	[6:0]	HEX7;					//	Seven Segment Digit 7
////////////////////////////	LED		////////////////////////////
output	[8:0]	LEDG;					//	LED Green[8:0]
output  [17:0]	LEDR;					//	LED Red[17:0]
////////////////////////////	UART	////////////////////////////
//output			UART_TXD;				//	UART Transmitter
//input			   UART_RXD;				//	UART Receiver
////////////////////////////	IRDA	////////////////////////////
//output			IRDA_TXD;				//	IRDA Transmitter
//input			   IRDA_RXD;				//	IRDA Receiver
///////////////////////		SDRAM Interface	////////////////////////
inout	  [15:0]	DRAM_DQ;				//	SDRAM Data bus 16 Bits
output  [11:0]	DRAM_ADDR;				//	SDRAM Address bus 12 Bits
output			DRAM_LDQM;				//	SDRAM Low-byte Data Mask 
output			DRAM_UDQM;				//	SDRAM High-byte Data Mask
output			DRAM_WE_N;				//	SDRAM Write Enable
output			DRAM_CAS_N;				//	SDRAM Column Address Strobe
output			DRAM_RAS_N;				//	SDRAM Row Address Strobe
output			DRAM_CS_N;				//	SDRAM Chip Select
output			DRAM_BA_0;				//	SDRAM Bank Address 0
output			DRAM_BA_1;				//	SDRAM Bank Address 0
output			DRAM_CLK;				//	SDRAM Clock
output			DRAM_CKE;				//	SDRAM Clock Enable
////////////////////////	Flash Interface	////////////////////////
inout	  [7:0]	FL_DQ;					//	FLASH Data bus 8 Bits
output [21:0]	FL_ADDR;				//	FLASH Address bus 22 Bits
output			FL_WE_N;				//	FLASH Write Enable
output			FL_RST_N;				//	FLASH Reset
output			FL_OE_N;				//	FLASH Output Enable
output			FL_CE_N;				//	FLASH Chip Enable
////////////////////////	SRAM Interface	////////////////////////
inout	 [15:0]	SRAM_DQ;				//	SRAM Data bus 16 Bits
output [17:0]	SRAM_ADDR;				//	SRAM Address bus 18 Bits
output			SRAM_UB_N;				//	SRAM High-byte Data Mask 
output			SRAM_LB_N;				//	SRAM Low-byte Data Mask 
output			SRAM_WE_N;				//	SRAM Write Enable
output			SRAM_CE_N;				//	SRAM Chip Enable
output			SRAM_OE_N;				//	SRAM Output Enable
////////////////////	ISP1362 Interface	////////////////////////
inout	 [15:0]	OTG_DATA;				//	ISP1362 Data bus 16 Bits
output  [1:0]	OTG_ADDR;				//	ISP1362 Address 2 Bits
output			OTG_CS_N;				//	ISP1362 Chip Select
output			OTG_RD_N;				//	ISP1362 Write
output			OTG_WR_N;				//	ISP1362 Read
output			OTG_RST_N;				//	ISP1362 Reset
output			OTG_FSPEED;				//	USB Full Speed,	0 = Enable, Z = Disable
output			OTG_LSPEED;				//	USB Low Speed, 	0 = Enable, Z = Disable
input			   OTG_INT0;				//	ISP1362 Interrupt 0
input			   OTG_INT1;				//	ISP1362 Interrupt 1
input			   OTG_DREQ0;				//	ISP1362 DMA Request 0
input			   OTG_DREQ1;				//	ISP1362 DMA Request 1
output			OTG_DACK0_N;			//	ISP1362 DMA Acknowledge 0
output			OTG_DACK1_N;			//	ISP1362 DMA Acknowledge 1
////////////////////	LCD Module 16X2	////////////////////////////
inout	  [7:0]	LCD_DATA;				//	LCD Data bus 8 bits
output			LCD_ON;					//	LCD Power ON/OFF
output			LCD_BLON;				//	LCD Back Light ON/OFF
output			LCD_RW;					//	LCD Read/Write Select, 0 = Write, 1 = Read
output			LCD_EN;					//	LCD Enable
output			LCD_RS;					//	LCD Command/Data Select, 0 = Command, 1 = Data
////////////////////	SD Card Interface	////////////////////////
//inout	 [3:0]	SD_DAT;					//	SD Card Data
//input			   SD_WP_N;				   //	SD write protect
//inout			   SD_CMD;					//	SD Card Command Signal
//output			SD_CLK;					//	SD Card Clock
////////////////////////	I2C		////////////////////////////////
inout			   I2C_SDAT;				//	I2C Data
output			I2C_SCLK;				//	I2C Clock
////////////////////////	PS2		////////////////////////////////
input		 	   PS2_DAT;				//	PS2 Data
input			   PS2_CLK;				//	PS2 Clock
////////////////////	USB JTAG link	////////////////////////////
input  			TDI;					// CPLD -> FPGA (data in)
input  			TCK;					// CPLD -> FPGA (clk)
input  			TCS;					// CPLD -> FPGA (CS)
output 			TDO;					// FPGA -> CPLD (data out)
////////////////////////	VGA			////////////////////////////
output			VGA_CLK;   				//	VGA Clock
output			VGA_HS;					//	VGA H_SYNC
output			VGA_VS;					//	VGA V_SYNC
output			VGA_BLANK;				//	VGA BLANK
output			VGA_SYNC;				//	VGA SYNC
output	[9:0]	VGA_R;   				//	VGA Red[9:0]
output	[9:0]	VGA_G;	 				//	VGA Green[9:0]
output	[9:0]	VGA_B;   				//	VGA Blue[9:0]
////////////////	Ethernet Interface	////////////////////////////
inout	[15:0]	ENET_DATA;				//	DM9000A DATA bus 16Bits
output			ENET_CMD;				//	DM9000A Command/Data Select, 0 = Command, 1 = Data
output			ENET_CS_N;				//	DM9000A Chip Select
output			ENET_WR_N;				//	DM9000A Write
output			ENET_RD_N;				//	DM9000A Read
output			ENET_RST_N;				//	DM9000A Reset
input			   ENET_INT;				//	DM9000A Interrupt
output			ENET_CLK;				//	DM9000A Clock 25 MHz
////////////////////	Audio CODEC		////////////////////////////
inout			   AUD_ADCLRCK;			//	Audio CODEC ADC LR Clock
input			   AUD_ADCDAT;				//	Audio CODEC ADC Data
inout			   AUD_DACLRCK;			//	Audio CODEC DAC LR Clock
output			AUD_DACDAT;				//	Audio CODEC DAC Data
inout			   AUD_BCLK;				//	Audio CODEC Bit-Stream Clock
output			AUD_XCK;				//	Audio CODEC Chip Clock
////////////////////	TV Devoder		////////////////////////////
input	 [7:0]	TD_DATA;    			//	TV Decoder Data bus 8 bits
input			   TD_HS;					//	TV Decoder H_SYNC
input			   TD_VS;					//	TV Decoder V_SYNC
output			TD_RESET;				//	TV Decoder Reset
input          TD_CLK27;            //	TV Decoder 27MHz CLK
////////////////////////	GPIO	////////////////////////////////
inout	[35:0]	GPIO_0;					//	GPIO Connection 0
inout	[35:0]	GPIO_1;
// input clk, rst,
	
	wire[31:0] if_pc_out, if_instruction_out;
	wire[31:0] ifreg_instruction_out;
	wire[31:0] ifreg_pc_out;
	// ID Stage outs
	wire id_wb_en_out, id_mem_r_en_out, id_mem_w_en_out, id_b_out, id_s_out;
	wire[3:0] id_exe_cmd_out;
	wire[31:0] id_val_rn_out, id_val_rm_out;
	wire id_imm_out;
	wire[11:0] id_shift_operand_out;
	wire[23:0] id_signed_imm_24_out;
	wire[3:0] id_dest_out;

	// IDReg Stage outs
	wire idreg_wb_en_out, idreg_mem_r_en_out, idreg_mem_w_en_out;
	wire idreg_b_out, idreg_s_out;
	wire[3:0] idreg_exe_cmd_out;
	wire[31:0] idreg_val_rn_out, idreg_val_rm_out;
	wire idreg_imm_out;
	wire[11:0] idreg_shift_operand_out;
	wire[23:0] idreg_signed_imm_24_out;
	wire[3:0] idreg_dest_out;
  	wire[31:0] idreg_pc_out;
  	wire[3:0] idreg_sr_out;

  	// EXEC Stage outs
  	wire[31:0] exec_alu_result_out, exec_br_addr_out;
 	wire[3:0] exec_status_out;

 	// EXECReg Stage outs
 	wire execreg_wb_en_out, execreg_mem_r_en_out, execreg_mem_w_en_out;
	wire[31:0] execreg_alu_result_out, execreg_st_val_out;
	wire[3:0] execreg_dest_out;

	// MEM Stage outs
	wire[31:0] mem_result_out;

	// MEMReg Stage outs
	wire memreg_wb_en_out, memreg_mem_r_en_out;
	wire[31:0] memreg_alu_result_out, memreg_mem_read_value_out;
	wire[3:0] memreg_dest_out;

	// WBReg Stage outs
	wire[31:0] wb_out;

	wire[31:0] status_reg_out;

	wire hazard_detected;
	wire [3:0] src2;
	assign src2 = (ifreg_instruction_out[25] == 1'b0 && ifreg_instruction_out[4] == 0) ? ifreg_instruction_out[3:0] : 4'b0;

	HazardDetectionUnit hdu(
		.src1(ifreg_instruction_out[19:16]),
		.src2(src2),
		.Exe_Dest(idreg_dest_out),
		.Mem_Dest(execreg_dest_out),
		.Exe_WB_EN(idreg_wb_en_out),
		.Mem_WB_EN(execreg_wb_en_out),
		.is_imm(ifreg_instruction_out[25]),
		.is_str(id_mem_w_en_out),
 		.hazard_detected(hazard_detected)
	);

	IF_Stage ifStage (
		.clk(CLOCK_50),
		.rst(SW[0]),
		.freeze(hazard_detected),
		.branch_taken(idreg_b_out),
		.branch_addr(exec_br_addr_out),
		.pc(if_pc_out),
		.instruction(if_instruction_out)
	);

	IF_Stage_Reg ifStageReg (
		.clk(CLOCK_50),
		.rst(SW[0]),
		.freeze(hazard_detected),
		.flush(idreg_b_out),
		.pc_in(if_pc_out),
		.instuction_in(if_instruction_out),
		.pc(ifreg_pc_out),
		.instruction(ifreg_instruction_out)
	);

	ID_Stage idStage (
		// inputs
		.clk(CLOCK_50), 
		.rst(SW[0]),
		// from if
		.instruction(ifreg_instruction_out),
		// from wb
		.result_wb(wb_out),
		.write_back_in(memreg_wb_en_out),
		.dest_wb(memreg_dest_out),
		// from status reg
		.sr(status_reg_out[31:28]),
		.hazard(hazard_detected),
		// outputs
		.wb_en(id_wb_en_out),
		.mem_r_en(id_mem_r_en_out),
		.mem_w_en(id_mem_w_en_out),
		.b(id_b_out),
		.s(id_s_out),
		.exe_cmd(id_exe_cmd_out),
		.val_rn(id_val_rn_out),
		.val_rm(id_val_rm_out),
		.imm(id_imm_out),
		.shift_operand(id_shift_operand_out),
		.signed_imm_24(id_signed_imm_24_out),
		.dest(id_dest_out)
	);


	ID_Stage_Reg idStageReg (
		.clk(CLOCK_50),
		.rst(SW[0]),
		.flush(idreg_b_out),
		.pc_in(ifreg_pc_out),
		.wb_en_in(id_wb_en_out),
		.mem_r_en_in(id_mem_r_en_out),
		.mem_w_en_in(id_mem_w_en_out), 
		.b_in(id_b_out),
		.s_in(id_s_out),
		.exe_cmd_in(id_exe_cmd_out),
		.val_rn_in(id_val_rn_out),
		.val_rm_in(id_val_rm_out),
		.imm_in(id_imm_out),
		.shift_operand_in(id_shift_operand_out),
		.signed_imm_24_in(id_signed_imm_24_out),
		.dest_in(id_dest_out),
		.sr_in(status_reg_out[31:28]),
		
		// outputs
		.wb_en(idreg_wb_en_out), 
		.b(idreg_b_out),
		.s(idreg_s_out),
		.exe_cmd(idreg_exe_cmd_out),
		.val_rn(idreg_val_rn_out), 
		.val_rm(idreg_val_rm_out),
		.mem_r_en(idreg_mem_r_en_out), 
		.mem_w_en(idreg_mem_w_en_out), 
		.imm(idreg_imm_out),
		.shift_operand(idreg_shift_operand_out),
		.signed_imm_24(idreg_signed_imm_24_out),
		.dest(idreg_dest_out),
		.pc(idreg_pc_out),
		.sr(idreg_sr_out)
	);

	NegRegister statusReg (
		.clk(CLOCK_50),
		.rst(SW[0]),
		.write_en(idreg_s_out),
		.reg_in({exec_status_out, 28'b0}), 
		.reg_out(status_reg_out)
	);

	EXEC_Stage execStage (
		.clk(CLOCK_50),
		.pc_in(idreg_pc_out),
		
		.exe_cmd(idreg_exe_cmd_out),
		.val_rn(idreg_val_rn_out),
		.val_rm(idreg_val_rm_out),
		.mem_r_en(idreg_mem_r_en_out),
		.mem_w_en(idreg_mem_w_en_out),
		.imm(idreg_imm_out),
		.shift_operand(idreg_shift_operand_out),
		.signed_imm_24(idreg_signed_imm_24_out),
		.sr(idreg_sr_out),

		// outputs
		.alu_result(exec_alu_result_out),
		.br_addr(exec_br_addr_out),
		.status(exec_status_out)
	);

	EXEC_Stage_Reg execStageReg (
		.clk(CLOCK_50),
		.rst(SW[0]),
		.wb_en_in(idreg_wb_en_out),
		.mem_r_en_in(idreg_mem_r_en_out),
		.mem_w_en_in(idreg_mem_w_en_out),
		.alu_result_in(exec_alu_result_out),
		.st_val_in(idreg_val_rm_out),
		.dest_in(idreg_dest_out),
		// outs
		.wb_en(execreg_wb_en_out),
		.mem_r_en(execreg_mem_r_en_out),
		.mem_w_en(execreg_mem_w_en_out),
		.alu_result(execreg_alu_result_out),
		.st_val(execreg_st_val_out),
		.dest(execreg_dest_out)
	);

	MEM_Stage memStage (
		.clk(CLOCK_50), 
		.rst(SW[0]),
		.mem_read(execreg_mem_r_en_out), 
		.mem_write(execreg_mem_w_en_out),
		.address(execreg_alu_result_out), 
		.data(execreg_st_val_out),
		// outputs
		.mem_result(mem_result_out)
	);

	MEM_Stage_Reg memStageReg (
		.clk(CLOCK_50), 
		.rst(SW[0]), 
		.wb_en_in(execreg_wb_en_out), 
		.mem_r_en_in(execreg_mem_r_en_out),
		.alu_result_in(execreg_alu_result_out), 
		.mem_read_value_in(mem_result_out),
		.dest_in(execreg_dest_out),
		// outputs
		.wb_en(memreg_wb_en_out), 
		.mem_r_en(memreg_mem_r_en_out),
		.alu_result(memreg_alu_result_out), 
		.mem_read_value(memreg_mem_read_value_out),
		.dest(memreg_dest_out)
	);

	WB_Stage wbStage (
		.alu_result(memreg_alu_result_out), 
		.mem_result(memreg_mem_read_value_out),
		.mem_r_en(memreg_mem_r_en_out),
		// outs
		.out(wb_out)
	);	
endmodule
