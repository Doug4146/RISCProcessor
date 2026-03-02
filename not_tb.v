`timescale 1ns/10ps

module not_tb;

    reg clock, clear;
    
    reg PCout, Zlowout, MDRout, R7out;
    
    reg MARin, Zin, PCin, MDRin, IRin, Yin;
    reg R4in, R7in;
    
    reg Read, IncPC;
    reg NOT;         
    reg [31:0] Mdatain;
    
    parameter Default = 4'b0000, Reg_load1a = 4'b0001, Reg_load1b = 4'b0010, Reg_load2a = 4'b0011,
              Reg_load2b = 4'b0100, Reg_load3a = 4'b0101, Reg_load3b = 4'b0110, T0 = 4'b0111,
              T1 = 4'b1000, T2 = 4'b1001, T3 = 4'b1010, T4 = 4'b1011, T5 = 4'b1100; 
              
    reg [3:0] Present_state = Default;

    datapath DUT (
        .clock(clock),
        .clear(clear),
        .PCout(PCout), 
        .Zlowout(Zlowout), 
        .MDRout(MDRout),
        .R7out(R7out),
        .MARin(MARin), 
        .Zin(Zin), 
        .PCin(PCin), 
        .MDRin(MDRin), 
        .IRin(IRin), 
        .Yin(Yin), 
        .R4in(R4in), 
        .R7in(R7in),
        .Read(Read),
        .NOT(NOT),     
        .Mdatain(Mdatain)
    );

    // Clock Generation
    initial begin
        clock = 0;
        clear = 1;       // clearing all registers so nothing is 'X'
        #5 clear = 0;    
        forever #10 clock = ~clock; 
    end

    always @(posedge clock) begin 
        case (Present_state)
            Default    : Present_state = Reg_load1a; 
            Reg_load1a : Present_state = Reg_load1b; 
            Reg_load1b : Present_state = Reg_load2a; 
            Reg_load2a : Present_state = Reg_load2b; 
            Reg_load2b : Present_state = T0;       
            T0 : Present_state = T1; 
            T1 : Present_state = T2; 
            T2 : Present_state = T3; 
            T3 : Present_state = T4; 
        endcase
    end

    always @(Present_state) begin
        // reset everything to 0 at the start of every state
        PCout = 0; Zlowout = 0; MDRout = 0; R7out = 0;
        MARin = 0; Zin = 0; PCin = 0; MDRin = 0; IRin = 0; Yin = 0;
        IncPC = 0; Read = 0; NOT = 0; R4in = 0; R7in = 0; Mdatain = 32'h00000000;

        case (Present_state)
            Reg_load1a: begin Mdatain = 32'h00000005; Read = 1; MDRin = 1; end
            Reg_load1b: begin MDRout = 1; R7in = 1; end
            Reg_load2a: begin Mdatain = 32'h00000002; Read = 1; MDRin = 1; end
            Reg_load2b: begin MDRout = 1; R4in = 1; end

            // instruction execution
            T0: begin PCout = 1; MARin = 1; IncPC = 1; Zin = 1; end
            T1: begin Zlowout = 1; PCin = 1; Read = 1; MDRin = 1; Mdatain = 32'h112B0000; end
            T2: begin MDRout = 1; IRin = 1; end
            T3: begin R7out = 1; NOT = 1; Zin = 1; end
            T4: begin Zlowout = 1; R4in = 1; end
        endcase
    end
endmodule