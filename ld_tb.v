`timescale 1ns/10ps

module ld_tb;
    reg clock, clear;

    // Phase 2 Control Signals
    reg Gra, Grb, Grc, Rin, Rout, BAout, Cout;
    reg HIout, LOout, Zhighout, Zlowout, PCout, MDRout, InPortout;
    reg MARin, Zin, PCin, MDRin, IRin, Yin, HIin, LOin;
    reg ADD, SUB, AND, OR, SHR, SHRA, SHL, ROR, ROL, DIV, MUL, NEG, NOT;
    reg Read, Write, MUL_start, OutPort_in, CONin;
    reg [31:0] input_unit;

    wire MUL_busy;
    wire [31:0] MARout, port_display;
    wire CON_val;

    parameter Default = 4'b0000, 
              T0 = 4'b0001, T1 = 4'b0010, T2 = 4'b0011, T3 = 4'b0100,
              T4 = 4'b0101, T5 = 4'b0110, T6 = 4'b0111, T7 = 4'b1000;

    reg [3:0] Present_state = Default;

    datapath DUT (
        .clock(clock), .clear(clear),
        .Gra(Gra), .Grb(Grb), .Grc(Grc), .Rin(Rin), .Rout(Rout), .BAout(BAout), .Cout(Cout),
        .HIout(HIout), .LOout(LOout), .Zhighout(Zhighout), .Zlowout(Zlowout),
        .PCout(PCout), .MDRout(MDRout), .InPortout(InPortout),
        .PCin(PCin), .IRin(IRin), .Yin(Yin), .Zin(Zin), .MDRin(MDRin), .MARin(MARin), .HIin(HIin), .LOin(LOin),
        .ADD(ADD), .SUB(SUB), .AND(AND), .OR(OR), .SHR(SHR), .SHRA(SHRA), .SHL(SHL),
        .ROR(ROR), .ROL(ROL), .DIV(DIV), .MUL(MUL), .NEG(NEG), .NOT(NOT),
        .MUL_start(MUL_start), .MUL_busy(MUL_busy),
        .Read(Read), .Write(Write), .MARout(MARout),
        .input_unit(input_unit), .OutPort_in(OutPort_in), .port_display(port_display),
        .CONin(CONin), .CON_val(CON_val)
    );

    initial begin
        clock = 0;
        forever #10 clock = ~clock; 
    end

    initial begin
        clear = 1;
        #25 clear = 0; // Clear finishes at 25ns
        
        // Load RAM with all test data
        DUT.RAM_Unit.memory[9'h065] = 32'h00000084; // Case 1 
        DUT.RAM_Unit.memory[9'h0C9] = 32'h0000002B; // Case 2
        DUT.RAM_Unit.memory[0] = 32'h03800065;      // RAM[0]: ld R7, 0x65
        DUT.RAM_Unit.memory[1] = 32'h00100072;      // RAM[1]: ld R0, 0x72(R2)

        // wait 8 clock cycles (8 * 20ns = 160ns) for T0-T7 to complete.
        #160; 

        force DUT.PC_val = 32'h00000001; 
        force DUT.R2_val = 32'h00000057; // Setup R2 for the math
        
        // Wait another 8 clock cycles for Case 2 to finish
        #160;

        
        $stop; // Pauses ModelSim so it doesn't run forever
    end

    always @(posedge clock) begin
        case (Present_state)
            Default : Present_state = T0;
            T0      : Present_state = T1;
            T1      : Present_state = T2;
            T2      : Present_state = T3;
            T3      : Present_state = T4;
            T4      : Present_state = T5;
            T5      : Present_state = T6;
            T6      : Present_state = T7;
            T7      : Present_state = T0; // LOOP BACK TO START!
        endcase
    end

    always @(*) begin
        // Full Reset
        Gra=0; Grb=0; Grc=0; Rin=0; Rout=0; BAout=0; Cout=0;
        HIout=0; LOout=0; Zhighout=0; Zlowout=0; PCout=0; MDRout=0; InPortout=0;
        MARin=0; Zin=0; PCin=0; MDRin=0; IRin=0; Yin=0; HIin=0; LOin=0;
        ADD=0; SUB=0; AND=0; OR=0; SHR=0; SHRA=0; SHL=0; ROR=0; ROL=0; DIV=0; MUL=0; NEG=0; NOT=0;
        Read=0; Write=0; MUL_start=0; OutPort_in=0; CONin=0;

        case (Present_state)
            T0: begin PCout = 1; MARin = 1; Zin = 1; end 
            T1: begin Zlowout = 1; PCin = 1; Read = 1; MDRin = 1; end 
            T2: begin MDRout = 1; IRin = 1; end
            T3: begin Grb = 1; BAout = 1; Yin = 1; end         
            T4: begin Cout = 1; ADD = 1; Zin = 1; end         
            T5: begin Zlowout = 1; MARin = 1; end             
            T6: begin Read = 1; MDRin = 1; end                
            T7: begin MDRout = 1; Gra = 1; Rin = 1; end        
        endcase
    end
endmodule