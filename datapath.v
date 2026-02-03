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
	 
	 bus Bus (
		//Select Signals
		.BusMuxOutR0(BusMuxOutR0), .BusMuxOutR1(BusMuxOutR1), .BusMuxOutR2(BusMuxOutR2), .BusMuxOutR3(BusMuxOutR3),
		.BusMuxOutR4(BusMuxOutR4), .BusMuxOutR5(BusMuxOutR5), .BusMuxOutR6(BusMuxOutR6), .BusMuxOutR7(BusMuxOutR7),
		.BusMuxOutR8(BusMuxOutR8), .BusMuxOutR9(BusMuxOutR9), .BusMuxOutR10(BusMuxOutR10), .BusMuxOutR11(BusMuxOutR11),
		.BusMuxOutR12(BusMuxOutR12), .BusMuxOutR13(BusMuxOutR13), .BusMuxOutR14(BusMuxOutR14), .BusMuxOutR15(BusMuxOutR15),
		
		.BusMuxOutHI(BusMuxOutHI), .BusMuxOutLO(BusMuxOutLO), 
		.BusMuxOutZhigh(BusMuxOutZhigh), .BusMuxOutZlow(BusMuxOutZlow),
		.BusMuxOutPC(BusMuxOutPC), .BusMuxOutMDR(BusMuxOutMDR),
		.BusMuxOutInPort(BusMuxOutInPort), .BusMuxOutC(BusMuxOutC),
		
		//Data Inputs
		.BusMuxInR0(BusMuxInR0), .BusMuxInR1(BusMuxInR1), .BusMuxInR2(BusMuxInR2), .BusMuxInR3(BusMuxInR3),
		.BusMuxInR4(BusMuxInR4), .BusMuxInR5(BusMuxInR5), .BusMuxInR6(BusMuxInR6), .BusMuxInR7(BusMuxInR7),
		.BusMuxInR8(BusMuxInR8), .BusMuxInR9(BusMuxInR9), .BusMuxInR10(BusMuxInR10), .BusMuxInR11(BusMuxInR11),
		.BusMuxInR12(BusMuxInR12), .BusMuxInR13(BusMuxInR13), .BusMuxInR14(BusMuxInR14), .BusMuxInR15(BusMuxInR15),
		
		.BusMuxInHI(BusMuxInHI), .BusMuxInLO(BusMuxInLO),
		.BusMuxInZhigh(BusMuxInZhigh), .BusMuxInZlow(BusMuxInZlow),
      .BusMuxInPC(BusMuxInPC), .BusMuxInMDR(BusMuxInMDR),
      .BusMuxInInPort(BusMuxInInPort), .BusMuxInC(BusMuxInC),
		
		//Output
		.BusMuxOut(BusMuxOut)
    );
	 
	 register R0 (.clock(clock), .clear(clear), .enable(R0in), .BusMuxOut(BusMuxOut), .BusMuxIn(BusMuxInR0));
	 register R1 (.clock(clock), .clear(clear), .enable(R1in), .BusMuxOut(BusMuxOut), .BusMuxIn(BusMuxInR1));
	 register R2 (.clock(clock), .clear(clear), .enable(R2in), .BusMuxOut(BusMuxOut), .BusMuxIn(BusMuxInR2));
	 register R3 (.clock(clock), .clear(clear), .enable(R3in), .BusMuxOut(BusMuxOut), .BusMuxIn(BusMuxInR3));
	 register R4 (.clock(clock), .clear(clear), .enable(R4in), .BusMuxOut(BusMuxOut), .BusMuxIn(BusMuxInR4));
	 register R5 (.clock(clock), .clear(clear), .enable(R5in), .BusMuxOut(BusMuxOut), .BusMuxIn(BusMuxInR5));
	 register R6 (.clock(clock), .clear(clear), .enable(R6in), .BusMuxOut(BusMuxOut), .BusMuxIn(BusMuxInR6));
	 register R7 (.clock(clock), .clear(clear), .enable(R7in), .BusMuxOut(BusMuxOut), .BusMuxIn(BusMuxInR7));
	 register R8 (.clock(clock), .clear(clear), .enable(R8in), .BusMuxOut(BusMuxOut), .BusMuxIn(BusMuxInR8));
	 register R9 (.clock(clock), .clear(clear), .enable(R9in), .BusMuxOut(BusMuxOut), .BusMuxIn(BusMuxInR9));
	 register R10 (.clock(clock), .clear(clear), .enable(R10in), .BusMuxOut(BusMuxOut), .BusMuxIn(BusMuxInR10));
	 register R11 (.clock(clock), .clear(clear), .enable(R11in), .BusMuxOut(BusMuxOut), .BusMuxIn(BusMuxInR11));
	 register R12 (.clock(clock), .clear(clear), .enable(R12in), .BusMuxOut(BusMuxOut), .BusMuxIn(BusMuxInR12));
	 register R13 (.clock(clock), .clear(clear), .enable(R13in), .BusMuxOut(BusMuxOut), .BusMuxIn(BusMuxInR13));
	 register R14 (.clock(clock), .clear(clear), .enable(R14in), .BusMuxOut(BusMuxOut), .BusMuxIn(BusMuxInR14));
	 register R15 (.clock(clock), .clear(clear), .enable(R15in), .BusMuxOut(BusMuxOut), .BusMuxIn(BusMuxInR15));
	 
	 register PC (.clock(clock), .clear(clear), .enable(PCin), .BusMuxOut(BusMuxOut), .BusMuxIn(BusMuxInPC));
    register IR (.clock(clock), .clear(clear), .enable(IRin), .BusMuxOut(BusMuxOut), .BusMuxIn()); // IR Output doesn't go to Bus

    register HI (.clock(clock), .clear(clear), .enable(HIin), .BusMuxOut(BusMuxOut), .BusMuxIn(BusMuxInHI));
    register LO (.clock(clock), .clear(clear), .enable(LOin), .BusMuxOut(BusMuxOut), .BusMuxIn(BusMuxInLO));

    register Y (.clock(clock), .clear(clear), .enable(Yin), .BusMuxOut(BusMuxOut), .BusMuxIn(Y_out));

    register ZHi (.clock(clock), .clear(clear), .enable(Zin), .BusMuxOut(BusMuxOut), .BusMuxIn(BusMuxInZhigh)); // Placeholder connection
    register ZLo (.clock(clock), .clear(clear), .enable(Zin), .BusMuxOut(BusMuxOut), .BusMuxIn(BusMuxInZlow));  // Placeholder connection
    
    // MAR (Output goes to Memory, not Bus)
    register MAR (.clock(clock), .clear(clear), .enable(MARin), .BusMuxOut(BusMuxOut), .BusMuxIn(MARout));	 
	 
	 mdr MDR_Unit (
        .clock(clock), .clear(clear), .enable(MDRin), 
        .BusMuxOut(BusMuxOut), 
        .mem_data(Mdatain),      // External Memory Data
        .read_signal(Read),     // Read Control Signal
        .mdr_out(BusMuxInMDR)
    );
	 
	 
	 
    
endmodule