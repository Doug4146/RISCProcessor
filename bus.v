module bus (
    // Select Signals 
    input R0out, R1out, R2out, R3out,
    input R4out, R5out, R6out, R7out,
    input R8out, R9out, R10out, R11out,
    input R12out, R13out, R14out, R15out,
    input HIout, LOout,
    input Zhighout, Zlowout,
    input PCout, MDRout,  
    input InPortout, Cout,

    // Data Inputs 
    input [31:0] R0_val, R1_val, R2_val, R3_val,
    input [31:0] R4_val, R5_val, R6_val, R7_val,
    input [31:0] R8_val, R9_val, R10_val, R11_val,
    input [31:0] R12_val, R13_val, R14_val, R15_val,
    input [31:0] HI_val, LO_val,
    input [31:0] Zhigh_val, Zlow_val,
    input [31:0] PC_val, MDR_val, 
    input [31:0] InPort_val, C_val,

    output reg [31:0] BusData
);

    always @(*) begin
        BusData = 32'h0; 

        // Selection Logic
        if (R0out) BusData = R0_val;
        else if (R1out) BusData = R1_val;
        else if (R2out) BusData = R2_val;
        else if (R3out) BusData = R3_val;
        else if (R4out) BusData = R4_val;
        else if (R5out) BusData = R5_val;
        else if (R6out) BusData = R6_val;
        else if (R7out) BusData = R7_val;
        else if (R8out) BusData = R8_val;
        else if (R9out) BusData = R9_val;
        else if (R10out) BusData = R10_val;
        else if (R11out) BusData = R11_val;
        else if (R12out) BusData = R12_val;
        else if (R13out) BusData = R13_val;
        else if (R14out) BusData = R14_val;
        else if (R15out) BusData = R15_val;
          
        else if (HIout) BusData = HI_val;
        else if (LOout) BusData = LO_val;
        else if (Zhighout) BusData = Zhigh_val;
        else if (Zlowout) BusData = Zlow_val;
        else if (PCout) BusData = PC_val;
        else if (MDRout) BusData = MDR_val;
        else if (InPortout) BusData = InPort_val; 
        else if (Cout)      BusData = C_val;
        
    end
endmodule