module bus (
    // Select Signals (Encoders)
    input BusMuxOutR0, BusMuxOutR1, BusMuxOutR2, BusMuxOutR3,
    input BusMuxOutR4, BusMuxOutR5, BusMuxOutR6, BusMuxOutR7,
    input BusMuxOutR8, BusMuxOutR9, BusMuxOutR10, BusMuxOutR11,
    input BusMuxOutR12, BusMuxOutR13, BusMuxOutR14, BusMuxOutR15,
	 input BusMuxOutHI, BusMuxOutLO,
	 input BusMuxOutZhigh, BusMuxOutZlow,
    input BusMuxOutPC, BusMuxOutMDR,  
	 input BusMuxOutInPort, BusMuxOutC,

    // Data Inputs (The wires coming from registers)
    input [31:0] BusMuxInR0, BusMuxInR1, BusMuxInR2, BusMuxInR3,
    input [31:0] BusMuxInR4, BusMuxInR5, BusMuxInR6, BusMuxInR7,
    input [31:0] BusMuxInR8, BusMuxInR9, BusMuxInR10, BusMuxInR11,
    input [31:0] BusMuxInR12, BusMuxInR13, BusMuxInR14, BusMuxInR15,
	 input [31:0] BusMuxInHI, BusMuxInLO,
	 input [31:0] BusMuxInZhigh, BusMuxInZlow,
    input [31:0] BusMuxInPC, BusMuxInMDR, 
	 input [31:0] BusMuxInInPort, BusMuxInC,

    output reg [31:0] BusMuxOut
);

    always @(*) begin
        // Default value to avoid latch generation if no signal is high
        BusMuxOut = 32'h0; 

        // Selection Logic
        if (BusMuxOutR0) BusMuxOut = BusMuxInR0;
        else if (BusMuxOutR1) BusMuxOut = BusMuxInR1;
        else if (BusMuxOutR2) BusMuxOut = BusMuxInR2;
		  else if (BusMuxOutR3) BusMuxOut = BusMuxInR3;
		  else if (BusMuxOutR4) BusMuxOut = BusMuxInR4;
		  else if (BusMuxOutR5) BusMuxOut = BusMuxInR5;
		  else if (BusMuxOutR6) BusMuxOut = BusMuxInR6;
		  else if (BusMuxOutR7) BusMuxOut = BusMuxInR7;
		  else if (BusMuxOutR8) BusMuxOut = BusMuxInR8;
		  else if (BusMuxOutR9) BusMuxOut = BusMuxInR9;
		  else if (BusMuxOutR10) BusMuxOut = BusMuxInR10;
		  else if (BusMuxOutR11) BusMuxOut = BusMuxInR11;
		  else if (BusMuxOutR12) BusMuxOut = BusMuxInR12;
		  else if (BusMuxOutR13) BusMuxOut = BusMuxInR13;
		  else if (BusMuxOutR14) BusMuxOut = BusMuxInR14;
        else if (BusMuxOutR15) BusMuxOut = BusMuxInR15;
		  
        else if (BusMuxOutHI) BusMuxOut = BusMuxInHI;
        else if (BusMuxOutLO) BusMuxOut = BusMuxInLO;
		  else if (BusMuxOutZhigh) BusMuxOut = BusMuxInZhigh;
        else if (BusMuxOutZlow) BusMuxOut = BusMuxInZlow;
        else if (BusMuxOutPC) BusMuxOut = BusMuxInPC;
        else if (BusMuxOutMDR) BusMuxOut = BusMuxInMDR;
		  else if (BusMuxOutInPort) BusMuxOut = BusMuxInInPort; 
        else if (BusMuxOutC)      BusMuxOut = BusMuxInC;
        
    end
endmodule