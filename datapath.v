module datapath (
    input clock, clear,
    
	 input BusMuxOutR0, BusMuxOutR1, BusMuxOutR2, BusMuxOutR3,
    input BusMuxOutR4, BusMuxOutR5, BusMuxOutR6, BusMuxOutR7,
    input BusMuxOutR8, BusMuxOutR9, BusMuxOutR10, BusMuxOutR11,
    input BusMuxOutR12, BusMuxOutR13, BusMuxOutR14, BusMuxOutR15,
	 
	 input BusMuxOutHI, BusMuxOutLO,
	 input BusMuxOutZhigh, BusMuxOutZlow,
    input BusMuxOutPC, BusMuxOutMDR,  
	 input BusMuxOutInPort, BusMuxOutC,
	 
	 input R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in,
	 input R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in, R16in,
	 
	 input PCin, IRin, Yin, Zin, MDRin, MARin, HIin, LOin,
	 
	 input [4:0] alu_op,
	 
	 input [31:0] Mdatain,
	 input Read
	
);
    // Bus wires
    wire [31:0] BusMuxOut;
	 
	 wire [31:0] BusMuxInR0, BusMuxInR1, BusMuxInR2, BusMuxInR3;
	 wire [31:0] BusMuxInR4, BusMuxInR5, BusMuxInR6, BusMuxInR7;
	 wire [31:0] BusMuxInR8, BusMuxInR9, BusMuxInR10, BusMuxInR11;
	 wire [31:0] BusMuxInR12, BusMuxInR13, BusMuxInR14, BusMuxInR15;
	 
	 wire [31:0] BusMuxInHI, BusMuxInLO, BusMuxInZhigh, BusMuxInZlow;
    wire [31:0] BusMuxInPC, BusMuxInMDR, BusMuxInInPort, BusMuxInC;
    wire [31:0] MARout;
	 
	 wire [31:0] Y_value;
	 wire [63:0] alu_result;
	 
	 //Bus instantiation
	 bus Bus (
		//Select Signals
		BusMuxOutR0, BusMuxOutR1, BusMuxOutR2, BusMuxOutR3, BusMuxOutR4, BusMuxOutR5, BusMuxOutR6, BusMuxOutR7,
		BusMuxOutR8, BusMuxOutR9, BusMuxOutR10, BusMuxOutR11, BusMuxOutR12, BusMuxOutR13, BusMuxOutR14, BusMuxOutR15,
		
		BusMuxOutHI, BusMuxOutLO, BusMuxOutZhigh, BusMuxOutZlow,
		BusMuxOutPC, BusMuxOutMDR,BusMuxOutInPort, BusMuxOutC,
		
		//Data Inputs
		BusMuxInR0, BusMuxInR1, BusMuxInR2, BusMuxInR3,
		BusMuxInR4, BusMuxInR5, BusMuxInR6, BusMuxInR7,
		BusMuxInR8, BusMuxInR9, BusMuxInR10, BusMuxInR11,
		BusMuxInR12, BusMuxInR13, BusMuxInR14, BusMuxInR15,
		
		BusMuxInHI, BusMuxInLO,
		BusMuxInZhigh, BusMuxInZlow,
      BusMuxInPC, BusMuxInMDR,
      BusMuxInInPort, BusMuxInC,
		
		//Output
		BusMuxOut
    );
	 
	 register R0 (clock, clear, R0in, BusMuxOut, BusMuxInR0);
	 register R1 (clock, clear, R1in, BusMuxOut, BusMuxInR1);	 
	 register R2 (clock, clear, R2in, BusMuxOut, BusMuxInR2);
	 register R3 (clock, clear, R3in, BusMuxOut, BusMuxInR3);
	 register R4 (clock, clear, R4in, BusMuxOut, BusMuxInR4);
	 register R5 (clock, clear, R5in, BusMuxOut, BusMuxInR5);
	 register R6 (clock, clear, R6in, BusMuxOut, BusMuxInR6);
	 register R7 (clock, clear, R7in, BusMuxOut, BusMuxInR7);
	 register R8 (clock, clear, R8in, BusMuxOut, BusMuxInR8);
	 register R9 (clock, clear, R9in, BusMuxOut, BusMuxInR9);
	 register R10 (clock, clear, R10in, BusMuxOut, BusMuxInR10);
	 register R11 (clock, clear, R11in, BusMuxOut, BusMuxInR11);
	 register R12 (clock, clear, R12in, BusMuxOut, BusMuxInR12);
	 register R13 (clock, clear, R13in, BusMuxOut, BusMuxInR13);
	 register R14 (clock, clear, R14in, BusMuxOut, BusMuxInR14);
	 register R15 (clock, clear, R15in, BusMuxOut, BusMuxInR15);


	 register PC (clock, clear, PCin, BusMuxOut, BusMuxInPC);
    register IR (clock, clear, IRin, BusMuxOut, .BusMuxIn()); 

    register HI (clock, clear, HIin, BusMuxOut, BusMuxInHI);
    register LO (clock, clear, LOin, BusMuxOut, BusMuxInLO);
	 
	 register Y (
		clock, clear, Yin, 
		BusMuxOut, 
		Y_value    
	 );
	 register ZHi (
		clock, clear, Zin, 
		ALU_Result[63:32],
		BusMuxInZhigh       
	 );
	 register ZLo (
		clock, clear, Zin, 
		ALU_Result[31:0],  
		BusMuxInZlow        
	 );	
	 
    register MAR (clock, clear, MARin, 
		BusMuxOut, 
		MARout
	 );	 
	 
	 mdr MDR_Unit (
		clock, clear, MDRin, 
		BusMuxOut, 
		Mdatain,
		Read,
		BusMuxInMDR
    );
	 
	 alu ALU_Unit(
		alu_result,
		Y_value,
		BusMuxOut,
		alu_op
	);
	 
	 
endmodule