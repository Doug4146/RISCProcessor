`timescale 1ns/10ps

module st_tb;
    reg clock, clear;

    // Phase 2 Control Signals
    reg Gra, Grb, Grc, Rin, Rout, BAout, Cout;
    reg HIout, LOout, Zhighout, Zlowout, PCout, MDRout, InPortout;
    reg MARin, Zin, PCin, MDRin, IRin, Yin, HIin, LOin;
    reg ADD, SUB, AND, OR, SHR, SHRA, SHL, ROR, ROL, DIV, MUL, NEG, NOT;
    reg Read, Write, MUL_start, OutPort_in, CONin;
    reg [31:0] input_unit;

    wire MUL_busy;
    wire [31:0] MARout, port_display, CON_val;

    // Extended state machine for two  cases
    parameter Default = 5'b00000, Setup = 5'b00001, 
              T0  = 5'b00010, T1  = 5'b00011, T2  = 5'b00100, T3  = 5'b00101,
              T4  = 5'b00110, T5  = 5'b00111, T6  = 5'b01000, T7  = 5'b01001,
              Setup2= 5'b01010,
              T8  = 5'b01011, T9  = 5'b01100, T10 = 5'b01101, T11 = 5'b01110,
              T12 = 5'b01111, T13 = 5'b10000, T14 = 5'b10001, T15 = 5'b10010;

    reg [4:0] Present_state = Default;

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
        clock = 0; clear = 1;
        #5 clear = 0;

        DUT.RAM_Unit.memory[0] = 32'h0300001F; // RAM[0]: st 0x1F, R6
        DUT.RAM_Unit.memory[1] = 32'h0330001F; // RAM[1]: st 0x1F(R6), R6
        
        forever #10 clock = ~clock;
    end

    always @(posedge clock) begin
        case (Present_state)
            Default : Present_state = Setup;
            Setup   : Present_state = T0;
            // CASE 1: st 0x1F, R6
            T0      : Present_state = T1;
            T1      : Present_state = T2;
            T2      : Present_state = T3;
            T3      : Present_state = T4;
            T4      : Present_state = T5;
            T5      : Present_state = T6;
            T6      : Present_state = T7;
            T7      : Present_state = Setup2;
            // CASE 2: st 0x1F(R6), R6
            Setup2  : Present_state = T8;
            T8      : Present_state = T9;
            T9      : Present_state = T10;
            T10     : Present_state = T11;
            T11     : Present_state = T12;
            T12     : Present_state = T13;
            T13     : Present_state = T14;
            T14     : Present_state = T15;
        endcase
    end

    always @(*) begin
        // Full Reset
        Gra=0; Grb=0; Grc=0; Rin=0; Rout=0; BAout=0; Cout=0;
        HIout=0; LOout=0; Zhighout=0; Zlowout=0; PCout=0; MDRout=0; InPortout=0;
        MARin=0; Zin=0; PCin=0; MDRin=0; IRin=0; Yin=0; HIin=0; LOin=0;
        ADD=0; SUB=0; AND=0; OR=0; SHR=0; SHRA=0; SHL=0; ROR=0; ROL=0; DIV=0; MUL=0; NEG=0; NOT=0;
        Read=0; Write=0; MUL_start=0; OutPort_in=0; CONin=0;
        input_unit = 32'h00000000;

        case (Present_state)
            // Initialize R6 = 0x63 
            Setup: begin
                input_unit = 32'h03000063;
                InPortout = 1; IRin = 1; // put dummy instruction in IR to trick decoder
                #2 input_unit = 32'h00000063; // Setup actual data
                InPortout = 1; Grb = 1; Rin = 1; // Load 0x63 into R2
            end

            // CASE 1: st 0x1F, R6 
            T0: begin PCout = 1; MARin = 1; Zin = 1; end 
            T1: begin Zlowout = 1; PCin = 1; Read = 1; MDRin = 1; end // Reads RAM[0] (0x0300001F) 
            T2: begin MDRout = 1; IRin = 1; end
            T3: begin Grb = 1; BAout = 1; Yin = 1; end         
            T4: begin Cout = 1; ADD = 1; Zin = 1; end         
            T5: begin Zlowout = 1; MARin = 1; end             
            T6: begin Gra = 1; MDRin = 1; Rout =1; end                
            T7: begin Write = 1; end       

            // Manually point PC to RAM address 1 for the next instruction
            Setup2: begin
                input_unit = 32'h00000001;
                InPortout = 1; PCin = 1;
            end

            // CASE 2: st 0x1F(R6), R6 
            T8:  begin PCout = 1; MARin = 1; Zin = 1; end 
            T9:  begin Zlowout = 1; PCin = 1; Read = 1; MDRin = 1; end // Reads RAM[1] (0x0330001F) 
            T10: begin MDRout = 1; IRin = 1; end
            T11: begin Grb = 1; BAout = 1; Yin = 1; end        
            T12: begin Cout = 1; ADD = 1; Zin = 1; end         
            T13: begin Zlowout = 1; MARin = 1; end             
            T14: begin Gra = 1; MDRin = 1; Rout =1; end                
            T15: begin Write = 1; end       
        endcase
    end
endmodule