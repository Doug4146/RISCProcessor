`timescale 1ns/10ps

module brmi_tb;
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

    // Simplified state machine for a single case
    parameter Default = 4'b0000, 
              T0  = 4'b0001, T1  = 4'b0010, T2  = 4'b0011, 
              T3  = 4'b0100, T4  = 4'b0101, T5  = 4'b0110, T6  = 4'b0111;

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
        #25 clear = 0;
        
        // brmi R3, 48	 
        DUT.RAM_Unit.memory[0] = 32'hA9980030; 
		  
		  force DUT.R3_val = -1*32'h00000005;
        
        forever #10 clock = ~clock;
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

            T0: begin PCout = 1; MARin = 1; Zin = 1; end 
            T1: begin Zlowout = 1; PCin = 1; Read = 1; MDRin = 1; end 
            T2: begin MDRout = 1; IRin = 1; end
            T3: begin Gra = 1; Rout = 1; CONin = 1; end       // Drops R3 (0x0) on bus. CON_val becomes 1!
            T4: begin PCout = 1; Yin = 1; end                 // PC latches to Y
            T5: begin Cout = 1; ADD = 1; Zin = 1; end         // ALU calculates Y + 48 (0x30)
            T6: begin Zlowout = 1; if (CON_val) PCin = 1; end // CON_val is 1, so PCin flips to 1. PC = 0x30!
        endcase
    end
endmodule