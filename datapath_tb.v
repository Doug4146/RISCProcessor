`timescale 1ns/10ps

module datapath_tb;

    //Inputs to the Datapath
    reg clock, clear;
    
    // Bus Mux Control Signals
    reg BusMuxOutPC, BusMuxOutZlow, BusMuxOutMDR, BusMuxOutR5, BusMuxOutR6;
    
    // Register Load Enable Signals
    reg MARin, Zin, PCin, MDRin, IRin, Yin;
    reg R2in, R5in, R6in;
    
    // Memory and ALU Control Signals
    reg Read, IncPC;
    reg [4:0] alu_op;        
    reg [31:0] Mdatain;
    
    // State Machine Definition
    parameter Default = 4'b0000, Reg_load1a = 4'b0001, Reg_load1b = 4'b0010, Reg_load2a = 4'b0011,
              Reg_load2b = 4'b0100, Reg_load3a = 4'b0101, Reg_load3b = 4'b0110, T0 = 4'b0111,
              T1 = 4'b1000, T2 = 4'b1001, T3 = 4'b1010, T4 = 4'b1011, T5 = 4'b1100; 
              
    reg [3:0] Present_state = Default;

    datapath DUT (
        .clock(clock),
        .clear(clear),
        .BusMuxOutPC(BusMuxOutPC), 
        .BusMuxOutZlow(BusMuxOutZlow), 
        .BusMuxOutMDR(BusMuxOutMDR),
        .BusMuxOutR5(BusMuxOutR5), 
        .BusMuxOutR6(BusMuxOutR6),
        .MARin(MARin), 
        .Zin(Zin), 
        .PCin(PCin), 
        .MDRin(MDRin), 
        .IRin(IRin), 
        .Yin(Yin),
        .R2in(R2in), 
        .R5in(R5in), 
        .R6in(R6in),
        .Read(Read),
        .alu_op(alu_op),     
        .Mdatain(Mdatain)
    );

    // Clock Generation
    initial begin
        clock = 0;
        clear = 1;       // Start by clearing all registers so nothing is 'X' (undefined)
        #5 clear = 0;    
        forever #10 clock = ~clock; // Toggles every 10ns (20ns full period) [cite: 307]
    end

    always @(posedge clock) begin 
        case (Present_state)
            Default    : Present_state = Reg_load1a; 
            Reg_load1a : Present_state = Reg_load1b; 
            Reg_load1b : Present_state = Reg_load2a; 
            Reg_load2a : Present_state = Reg_load2b; 
            Reg_load2b : Present_state = Reg_load3a; 
            Reg_load3a : Present_state = Reg_load3b; 
            Reg_load3b : Present_state = T0;         
            T0 : Present_state = T1; 
            T1 : Present_state = T2; 
            T2 : Present_state = T3; 
            T3 : Present_state = T4; 
            T4 : Present_state = T5; 
        endcase
    end

    always @(Present_state) begin
        // 1. Reset everything to 0 at the start of EVERY state. 
        BusMuxOutPC = 0; BusMuxOutZlow = 0; BusMuxOutMDR = 0; BusMuxOutR5 = 0; BusMuxOutR6 = 0;
        MARin = 0; Zin = 0; PCin = 0; MDRin = 0; IRin = 0; Yin = 0;
        IncPC = 0; Read = 0; alu_op = 5'b00000; 
        R2in = 0; R5in = 0; R6in = 0; Mdatain = 32'h00000000;

        case (Present_state)
            // --- PHASE 1: PRE-LOADING DUMMY DATA ---
            Reg_load1a: begin Mdatain = 32'h00000034; Read = 1; MDRin = 1; end
            Reg_load1b: begin BusMuxOutMDR = 1; R5in = 1; end
            Reg_load2a: begin Mdatain = 32'h00000045; Read = 1; MDRin = 1; end
            Reg_load2b: begin BusMuxOutMDR = 1; R6in = 1; end
            Reg_load3a: begin Mdatain = 32'h00000067; Read = 1; MDRin = 1; end
            Reg_load3b: begin BusMuxOutMDR = 1; R2in = 1; end

            // --- PHASE 2: EXECUTING THE INSTRUCTION ---
            T0: begin BusMuxOutPC = 1; MARin = 1; IncPC = 1; Zin = 1; end
            T1: begin BusMuxOutZlow = 1; PCin = 1; Read = 1; MDRin = 1; Mdatain = 32'h112B0000; end
            T2: begin BusMuxOutMDR = 1; IRin = 1; end
            T3: begin BusMuxOutR5 = 1; Yin = 1; end
            T4: begin BusMuxOutR6 = 1; alu_op = 5'b00010; Zin = 1; end
            T5: begin BusMuxOutZlow = 1; R2in = 1; end
        endcase
    end
endmodule