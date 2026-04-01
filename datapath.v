module datapath (
    input clock, clear,
   
    // PHASE 2: Select and Encode & Control Flow 
    input Gra, Grb, Grc, Rin, Rout, BAout, Cout,
    
    // Bus Control Signals
    input HIout, LOout, Zhighout, Zlowout,
    input PCout, MDRout, InPortout,
    
    // Register Enables
    input PCin, IRin, Yin, Zin, MDRin, MARin, HIin, LOin,
    
    // ALU Control Signals
    input ADD, SUB, AND, OR, SHR, SHRA, SHL, ROR, ROL, DIV, MUL, NEG, NOT,  
    input MUL_start,
    output wire MUL_busy,
    
    // Memory Interface
    
    input Read, Write,
    output wire [31:0] MARout,

    // PHASE 2: I/O Interface 
    input [31:0] In_PortOut,      // Switches from the outside world
    input Out_PortIn,             // Enable signal for the output port
    output wire [31:0] port_display, 
	 
	 input CONin,
	 output wire CON_val,
	 
	 input IncPC,                  // From Control Unit to increment PC
    output wire [31:0] IR_out		// Opcode decoding in control unit
);

    // Internal Wires 
    wire [31:0] BusData;
    
    wire [31:0] R0_val, R1_val, R2_val, R3_val, R4_val, R5_val, R6_val, R7_val;
    wire [31:0] R8_val, R9_val, R10_val, R11_val, R12_val, R13_val, R14_val, R15_val;
    
    wire [31:0] HI_val, LO_val, Zhigh_val, Zlow_val;
    wire [31:0] PC_val, MDR_val, InPort_val, C_val;
    wire [31:0] IR_val, Y_val;
    wire [63:0] alu_result;
	 
	 wire [63:0] Z_in_data;

    wire [15:0] R_in_sig;
    wire [15:0] R_out_sig;
    wire [31:0] R0_reg_val;

    // PHASE 2: Select and Encode Logic 
    select_and_encode SE_Unit (
        .IR(IR_val),
        .Gra(Gra),
        .Grb(Grb),
        .Grc(Grc),
        .Rin(Rin),
        .Rout(Rout),
        .BAout(BAout),
        .R_in(R_in_sig),
        .R_out(R_out_sig)
    );

    // PHASE 2: Sign Extension Logic 
    sign_extend Sign_Extender (
			.C_out_extended(C_val),
        .IR(IR_val) 
    );
    
    // Bus Instantiation
    bus Bus (
        // Select Signals (Driven by Select and Encode)
        R_out_sig[0], R_out_sig[1], R_out_sig[2], R_out_sig[3], R_out_sig[4], R_out_sig[5], R_out_sig[6], R_out_sig[7],
        R_out_sig[8], R_out_sig[9], R_out_sig[10], R_out_sig[11], R_out_sig[12], R_out_sig[13], R_out_sig[14], R_out_sig[15],
        
        HIout, LOout, Zhighout, Zlowout,
        PCout, MDRout, InPortout, Cout,
        
        // Data Inputs
        R0_val, R1_val, R2_val, R3_val, R4_val, R5_val, R6_val, R7_val,
        R8_val, R9_val, R10_val, R11_val, R12_val, R13_val, R14_val, R15_val,
        
        HI_val, LO_val,
        Zhigh_val, Zlow_val,
        PC_val, MDR_val,
        InPort_val, C_val,
        
        // Output
        BusData
    );
    
    // PHASE 2: Revised R0 Logic 
    register R0_internal (R0_reg_val, clock, clear, R_in_sig[0], BusData);
    assign R0_val = {32{~BAout}} & R0_reg_val; // Outputs 0 if BAout is high

    // General Purpose Registers 
    register R1 (R1_val, clock, clear, R_in_sig[1], BusData);  
    register R2 (R2_val, clock, clear, R_in_sig[2], BusData);
    register R3 (R3_val, clock, clear, R_in_sig[3], BusData);
    register R4 (R4_val, clock, clear, R_in_sig[4], BusData);
    register R5 (R5_val, clock, clear, R_in_sig[5], BusData);
    register R6 (R6_val, clock, clear, R_in_sig[6], BusData);
    register R7 (R7_val, clock, clear, R_in_sig[7], BusData);
    register R8 (R8_val, clock, clear, R_in_sig[8], BusData);
    register R9 (R9_val, clock, clear, R_in_sig[9], BusData);
    register R10 (R10_val, clock, clear, R_in_sig[10], BusData);
    register R11 (R11_val, clock, clear, R_in_sig[11], BusData);
    register R12 (R12_val, clock, clear, R_in_sig[12], BusData);
    register R13 (R13_val, clock, clear, R_in_sig[13], BusData);
    register R14 (R14_val, clock, clear, R_in_sig[14], BusData);
    register R15 (R15_val, clock, clear, R_in_sig[15], BusData);

    // Special Registers 
    register PC (PC_val, clock, clear, PCin, BusData);
    register IR (IR_val, clock, clear, IRin, BusData);
	 assign IR_out = IR_val;
	 
    register HI (HI_val, clock, clear, HIin, BusData);
    register LO (LO_val, clock, clear, LOin, BusData);
    
    register Y (Y_val, clock, clear, Yin, BusData);
	 
	 // If IncPC is high, add 1 to the BusData, if not take the ALU result.
	 assign Z_in_data = (IncPC) ? {32'd0, BusData + 32'd1} : alu_result;
	 
    register ZHi (Zhigh_val, clock, clear, Zin, Z_in_data[63:32]);
    register ZLo (Zlow_val, clock, clear, Zin, Z_in_data[31:0]);  
	 
    register MAR (MARout, clock, clear, MARin, BusData);  
	 
	 wire [31:0] ram_dataout;

    // PHASE 2: Memory Subsystem  
    ram RAM_Unit (
        .clk(clock),
        .read(Read),
        .write(Write),
        .address(MARout[8:0]),     // RAM only needs the lower 9 bits of the MAR
        .datain(MDR_val),          // Data to be stored comes from the MDR
        .dataout(ram_dataout)      // Data loaded from RAM goes to the MDR wire
    );
    
    mdr MDR_Unit (
        MDR_val, BusData, ram_dataout,
        Read,
        clock, clear, MDRin
    );

    // PHASE 2: I/O Registers 
	in_port Input_Unit (
        .to_bus(InPort_val),     // Maps to your new output reg
        .input_unit(In_PortOut), // Maps to the top-level external switch input
        .clear(clear), 
        .clock(clock)
    );
    
    out_port Output_Unit (
        .output_unit(port_display), // Maps to the top-level external LED output
        .bus_input(BusData),        // Maps to the new input wire
        .clock(clock), 
        .clear(clear), 
        .enable(Out_PortIn)         // Maps to your new enable control signal
    );
	 
	 // Condition ff
	 con_ff Condition_Logic (
			.con_out(CON_val),
			.IR_condition(IR_val[20:19]),
			.bus_in(BusData),
			.con_in(CONin)
	 );
    
    // ALU
    alu ALU_Unit(
        alu_result,    
        MUL_busy,
        clock, clear, MUL_start,
        Y_val,         
        BusData,       
        ADD, SUB, AND, OR, SHR, SHRA, SHL, ROR, ROL, DIV, MUL, NEG, NOT
    );
    
endmodule