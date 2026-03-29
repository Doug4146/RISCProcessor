module cpu (
    input clock, clear, stop,
    input [31:0] In_PortOut,
    output wire [31:0] port_display
);

    wire Gra, Grb, Grc, Rin, Rout, BAout, Cout;
    wire HIout, LOout, Zhighout, Zlowout, PCout, MDRout, InPortout;
    wire PCin, IRin, Yin, Zin, MDRin, MARin, HIin, LOin, CONin;
    wire Out_PortIn;
    wire Read, Write, Run, IncPC;
    wire ADD, SUB, AND, OR, SHR, SHRA, SHL, ROR, ROL, DIV, MUL, NEG, NOT, MUL_start;
    
    wire [31:0] IR_val;
    wire MUL_busy, CON_val;
    wire [31:0] MARout; // drives RAM, not Control Unit

    // Control Unit instantiation
    control_unit CU (
        .Gra(Gra), .Grb(Grb), .Grc(Grc), .Rin(Rin), .Rout(Rout), .BAout(BAout), .Cout(Cout),
        .HIout(HIout), .LOout(LOout), .Zhighout(Zhighout), .Zlowout(Zlowout), 
        .PCout(PCout), .MDRout(MDRout), .InPortout(InPortout),
        .PCin(PCin), .IRin(IRin), .Yin(Yin), .Zin(Zin), .MDRin(MDRin), 
        .MARin(MARin), .HIin(HIin), .LOin(LOin), .CONin(CONin),
        .Out_PortIn(Out_PortIn),
        .Read(Read), .Write(Write), .Run(Run), .IncPC(IncPC),
        .ADD(ADD), .SUB(SUB), .AND(AND), .OR(OR), .SHR(SHR), .SHRA(SHRA), .SHL(SHL), 
        .ROR(ROR), .ROL(ROL), .DIV(DIV), .MUL(MUL), .NEG(NEG), .NOT(NOT), .MUL_start(MUL_start),
        .IR(IR_val), .MUL_busy(MUL_busy), .CON_val(CON_val),
        .clock(clock), .clear(clear), .stop(stop)
    );

    // Datapath instantiation
    datapath DP (
        .clock(clock), .clear(clear),
        .Gra(Gra), .Grb(Grb), .Grc(Grc), .Rin(Rin), .Rout(Rout), .BAout(BAout), .Cout(Cout),
        .HIout(HIout), .LOout(LOout), .Zhighout(Zhighout), .Zlowout(Zlowout), 
        .PCout(PCout), .MDRout(MDRout), .InPortout(InPortout),
        .PCin(PCin), .IRin(IRin), .Yin(Yin), .Zin(Zin), .MDRin(MDRin), 
        .MARin(MARin), .HIin(HIin), .LOin(LOin),
        .ADD(ADD), .SUB(SUB), .AND(AND), .OR(OR), .SHR(SHR), .SHRA(SHRA), .SHL(SHL), 
        .ROR(ROR), .ROL(ROL), .DIV(DIV), .MUL(MUL), .NEG(NEG), .NOT(NOT),
        .MUL_start(MUL_start), .MUL_busy(MUL_busy),
        .Read(Read), .Write(Write), .MARout(MARout),
        .In_PortOut(In_PortOut), .Out_PortIn(Out_PortIn), .port_display(port_display),
        .CONin(CONin), .CON_val(CON_val),
        .IncPC(IncPC), .IR_out(IR_val)
    );

endmodule