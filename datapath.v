module datapath (
    input clock, clear,
    
    input R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out,
    input R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out,
    
    input HIout, LOout, Zhighout, Zlowout,
    input PCout, MDRout, InPortout, Cout,
    
    input R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in,
    input R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in,
    
    input PCin, IRin, Yin, Zin, MDRin, MARin, HIin, LOin,
    
    input ADD, SUB, AND, OR, SHR, SHRA, SHL, ROR, ROL, DIV, MUL, NEG, NOT,  
    
    input MUL_start,
    output wire MUL_busy,
    
    input [31:0] Mdatain,
    input Read,
    
    output wire [31:0] MARout
);

    // Bus wires
    wire [31:0] BusData;
    
    wire [31:0] R0_val, R1_val, R2_val, R3_val, R4_val, R5_val, R6_val, R7_val;
    wire [31:0] R8_val, R9_val, R10_val, R11_val, R12_val, R13_val, R14_val, R15_val;
    
    wire [31:0] HI_val, LO_val, Zhigh_val, Zlow_val;
    wire [31:0] PC_val, MDR_val, InPort_val, C_val;
    
    wire [31:0] IR_val;
    
    wire [31:0] Y_val;
    wire [63:0] alu_result;
    
    //Bus instantiation
    bus Bus (
        //Select Signals
        R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out,
        R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out,
        
        HIout, LOout, Zhighout, Zlowout,
        PCout, MDRout, InPortout, Cout,
        
        //Data Inputs
        R0_val, R1_val, R2_val, R3_val, R4_val, R5_val, R6_val, R7_val,
        R8_val, R9_val, R10_val, R11_val, R12_val, R13_val, R14_val, R15_val,
        
        HI_val, LO_val,
        Zhigh_val, Zlow_val,
        PC_val, MDR_val,
        InPort_val, C_val,
        
        //Output
        BusData
    );
    
    register R0 (R0_val, clock, clear, R0in, BusData);
    register R1 (R1_val, clock, clear, R1in, BusData);  
    register R2 (R2_val, clock, clear, R2in, BusData);
    register R3 (R3_val, clock, clear, R3in, BusData);
    register R4 (R4_val, clock, clear, R4in, BusData);
    register R5 (R5_val, clock, clear, R5in, BusData);
    register R6 (R6_val, clock, clear, R6in, BusData);
    register R7 (R7_val, clock, clear, R7in, BusData);
    register R8 (R8_val, clock, clear, R8in, BusData);
    register R9 (R9_val, clock, clear, R9in, BusData);
    register R10 (R10_val, clock, clear, R10in, BusData);
    register R11 (R11_val, clock, clear, R11in, BusData);
    register R12 (R12_val, clock, clear, R12in, BusData);
    register R13 (R13_val, clock, clear, R13in, BusData);
    register R14 (R14_val, clock, clear, R14in, BusData);
    register R15 (R15_val, clock, clear, R15in, BusData);

    register PC (PC_val, clock, clear, PCin, BusData);
    register IR (IR_val, clock, clear, IRin, BusData); 

    register HI (HI_val, clock, clear, HIin, BusData);
    register LO (LO_val, clock, clear, LOin, BusData);
    
    register Y (
        Y_val, 
        clock, clear, Yin, 
        BusData
    );
    register ZHi (
        Zhigh_val,
        clock, clear, Zin, 
        alu_result[63:32]  
    );
    register ZLo (
        Zlow_val,
        clock, clear, Zin, 
        alu_result[31:0]      
    );  
    
    register MAR (
        MARout,
        clock, clear, MARin, 
        BusData
    );  
    
    mdr MDR_Unit (
        MDR_val, BusData, Mdatain,
        Read,
        clock, clear, MDRin
    );
    
    alu ALU_Unit(
        alu_result,    //Rc
        MUL_busy,
        clock, clear, MUL_start,
        Y_val,         //Ra
        BusData,       //Rb
        ADD, SUB, AND, OR, SHR, SHRA, SHL, ROR, ROL, DIV, MUL, NEG, NOT
    );
    
endmodule