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
	 input R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in,
	 
	 input PCin, IRin, Yin, Zin, MDRin, MARin, HIin, LOin,
	 
	 input [4:0] alu_op,
	 
	 input [31:0] Mdatain,
	 input Read,
	 
	 output wire [31:0] MARout
	
);
    // Bus wires
    wire [31:0] BusMuxOut;
	 
	 wire [31:0] BusMuxInR0, BusMuxInR1, BusMuxInR2, BusMuxInR3;
	 wire [31:0] BusMuxInR4, BusMuxInR5, BusMuxInR6, BusMuxInR7;
	 wire [31:0] BusMuxInR8, BusMuxInR9, BusMuxInR10, BusMuxInR11;
	 wire [31:0] BusMuxInR12, BusMuxInR13, BusMuxInR14, BusMuxInR15;
	 
	 wire [31:0] BusMuxInHI, BusMuxInLO, BusMuxInZhigh, BusMuxInZlow;
    wire [31:0] BusMuxInPC, BusMuxInMDR, BusMuxInInPort, BusMuxInC;
	 
	 wire [31:0] IR_out;
	 
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
	 
	 register R0 (BusMuxInR0, clock, clear, R0in, BusMuxOut);
	 register R1 (BusMuxInR1, clock, clear, R1in, BusMuxOut);	 
	 register R2 (BusMuxInR2, clock, clear, R2in, BusMuxOut);
	 register R3 (BusMuxInR3, clock, clear, R3in, BusMuxOut);
	 register R4 (BusMuxInR4, clock, clear, R4in, BusMuxOut);
	 register R5 (BusMuxInR5, clock, clear, R5in, BusMuxOut);
	 register R6 (BusMuxInR6, clock, clear, R6in, BusMuxOut);
	 register R7 (BusMuxInR7, clock, clear, R7in, BusMuxOut);
	 register R8 (BusMuxInR8, clock, clear, R8in, BusMuxOut);
	 register R9 (BusMuxInR9, clock, clear, R9in, BusMuxOut);
	 register R10 (BusMuxInR10, clock, clear, R10in, BusMuxOut);
	 register R11 (BusMuxInR11, clock, clear, R11in, BusMuxOut);
	 register R12 (BusMuxInR12, clock, clear, R12in, BusMuxOut);
	 register R13 (BusMuxInR13, clock, clear, R13in, BusMuxOut);
	 register R14 (BusMuxInR14, clock, clear, R14in, BusMuxOut);
	 register R15 (BusMuxInR15, clock, clear, R15in, BusMuxOut);


	 register PC (BusMuxInPC, clock, clear, PCin, BusMuxOut);
    register IR (IR_out, clock, clear, IRin, BusMuxOut); 

    register HI (BusMuxInHI, clock, clear, HIin, BusMuxOut);
    register LO (BusMuxInLO, clock, clear, LOin, BusMuxOut);
	 
	 register Y (
		Y_value, 
		clock, clear, Yin, 
		BusMuxOut
	 );
	 register ZHi (
		BusMuxInZhigh,
		clock, clear, Zin, 
		alu_result[63:32]  
	 );
	 register ZLo (
		BusMuxInZlow,
		clock, clear, Zin, 
		alu_result[31:0]      
	 );	
	 
    register MAR (
		MARout,
		clock, clear, MARin, 
		BusMuxOut
	 );	 
	 
	 mdr MDR_Unit (
		BusMuxInMDR, BusMuxOut, Mdatain,
		Read,
		clock, clear, MDRin
    );
	 
	 alu ALU_Unit(
		alu_result,
		Y_value,
		BusMuxOut,
		alu_op
	);
	 
	 
endmodule