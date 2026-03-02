`timescale 1ns/10ps

module sub_tb;

    reg clock, clear;
    
    reg PCout, Zlowout, MDRout, R5out, R6out;
    
    reg MARin, Zin, PCin, MDRin, IRin, Yin;
    reg R2in, R5in, R6in;
    
    reg Read, IncPC;
    reg SUB;         
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
        .R5out(R5out), 
        .R6out(R6out),
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
        .SUB(SUB),     
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
        // reset everything to 0 at the start of every state
        PCout = 0; Zlowout = 0; MDRout = 0; R5out = 0; R6out = 0;
        MARin = 0; Zin = 0; PCin = 0; MDRin = 0; IRin = 0; Yin = 0;
        IncPC = 0; Read = 0; SUB = 0; 
        R2in = 0; R5in = 0; R6in = 0; Mdatain = 32'h00000000;

        case (Present_state)
            Reg_load1a: begin Mdatain = 32'h00000034; Read = 1; MDRin = 1; end
            Reg_load1b: begin MDRout = 1; R5in = 1; end
            Reg_load2a: begin Mdatain = 32'h00000045; Read = 1; MDRin = 1; end
            Reg_load2b: begin MDRout = 1; R6in = 1; end
            Reg_load3a: begin Mdatain = 32'h00000067; Read = 1; MDRin = 1; end
            Reg_load3b: begin MDRout = 1; R2in = 1; end

            // instruction execution
            T0: begin PCout = 1; MARin = 1; IncPC = 1; Zin = 1; end
            T1: begin Zlowout = 1; PCin = 1; Read = 1; MDRin = 1; Mdatain = 32'h092B0000; end
            T2: begin MDRout = 1; IRin = 1; end
            T3: begin R5out = 1; Yin = 1; end
            T4: begin R6out = 1; SUB = 1; Zin = 1; end
            T5: begin Zlowout = 1; R2in = 1; end
        endcase
    end
endmodule