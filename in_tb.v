`timescale 1ns/10ps

module in_tb;
    reg clock, clear;
    
    // Phase 2 Decoder & Bus Signals
    reg Gra, Grb, Grc, Rin, Rout, BAout, Cout;
    reg HIout, LOout, Zhighout, Zlowout, PCout, MDRout, InPortout;
    reg MARin, Zin, PCin, MDRin, IRin, Yin, HIin, LOin;
    
    // ALU and Memory Signals
    reg ADD, SUB, AND, OR, SHR, SHRA, SHL, ROR, ROL, DIV, MUL, NEG, NOT;
    reg Read, MUL_start;
    wire MUL_busy;
    reg [31:0] Mdatain;
    wire [31:0] MARout;

    // Phase 2 I/O Signals
    reg [31:0] input_unit;
    reg OutPort_in;
    wire [31:0] port_display;

    parameter Default = 4'b0000, T0 = 4'b0001, T1 = 4'b0010, T2 = 4'b0011, T3 = 4'b0100;
              
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
        .Mdatain(Mdatain), .Read(Read), .MARout(MARout),
        .input_unit(input_unit), .OutPort_in(OutPort_in), .port_display(port_display)
    );

    initial begin
        clock = 0; clear = 1;
        #5 clear = 0;
        forever #10 clock = ~clock;
    end

    always @(posedge clock) begin 
        case (Present_state)
            Default : Present_state = T0; 
            T0      : Present_state = T1; 
            T1      : Present_state = T2; 
            T2      : Present_state = T3; 
        endcase
    end

    always @(*) begin
        Gra=0; Grb=0; Grc=0; Rin=0; Rout=0; BAout=0; Cout=0;
        HIout=0; LOout=0; Zhighout=0; Zlowout=0; PCout=0; MDRout=0; InPortout=0;
        MARin=0; Zin=0; PCin=0; MDRin=0; IRin=0; Yin=0; HIin=0; LOin=0;
        ADD=0; SUB=0; AND=0; OR=0; SHR=0; SHRA=0; SHL=0; ROR=0; ROL=0; DIV=0; MUL=0; NEG=0; NOT=0;
        Read=0; MUL_start=0; OutPort_in=0; 
        Mdatain = 32'h00000000; 

        // Lock external switches to a test value
        input_unit = 32'hCAFEBABE;

        case (Present_state)
            // Instruction Fetch
            T0: begin PCout = 1; MARin = 1; Zin = 1; end 
            T1: begin Zlowout = 1; PCin = 1; Read = 1; MDRin = 1; Mdatain = 32'h02800000; end // '5' in Ra field
            T2: begin MDRout = 1; IRin = 1; end
            
            // Execute in R5
            T3: begin 
                InPortout = 1;     // Push switch data to bus
                Gra = 1; Rin = 1;  // Decoder turns on R5in
            end
        endcase
    end
endmodule