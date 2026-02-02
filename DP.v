// DP.v
module DP(
    input wire clock, clear,
    input wire PCout, Zlowout, MDRout, R5out, R6out, 
    input wire MARin, Zin, PCin, MDRin, IRin, Yin,
    input wire R2in, R5in, R6in,
    input wire IncPC, Read, AND,
    input wire [31:0] Mdatain
);

    wire [31:0] BusData;
    wire [31:0] R0_q, R1_q, R2_q, R3_q, R4_q, R5_q, R6_q, R7_q;
    wire [31:0] R8_q, R9_q, R10_q, R11_q, R12_q, R13_q, R14_q, R15_q;
    wire [31:0] PC_q, IR_q, MAR_q, MDR_q, Y_q, HI_q, LO_q;
    wire [63:0] Z_q;

    // MDR Logic
    wire [31:0] MDR_Input;
    assign MDR_Input = (Read) ? Mdatain : BusData;

    // Registers (Using 'register' module name)
    register R0  (.clear(clear), .clock(clock), .enable(1'b0), .BusMuxOut(BusData), .BusMuxIn(R0_q));
    register R1  (.clear(clear), .clock(clock), .enable(1'b0), .BusMuxOut(BusData), .BusMuxIn(R1_q));
    register R2  (.clear(clear), .clock(clock), .enable(R2in), .BusMuxOut(BusData), .BusMuxIn(R2_q));
    register R3  (.clear(clear), .clock(clock), .enable(1'b0), .BusMuxOut(BusData), .BusMuxIn(R3_q));
    register R4  (.clear(clear), .clock(clock), .enable(1'b0), .BusMuxOut(BusData), .BusMuxIn(R4_q));
    register R5  (.clear(clear), .clock(clock), .enable(R5in), .BusMuxOut(BusData), .BusMuxIn(R5_q));
    register R6  (.clear(clear), .clock(clock), .enable(R6in), .BusMuxOut(BusData), .BusMuxIn(R6_q));
    register R7  (.clear(clear), .clock(clock), .enable(1'b0), .BusMuxOut(BusData), .BusMuxIn(R7_q));
    register R8  (.clear(clear), .clock(clock), .enable(1'b0), .BusMuxOut(BusData), .BusMuxIn(R8_q));
    register R9  (.clear(clear), .clock(clock), .enable(1'b0), .BusMuxOut(BusData), .BusMuxIn(R9_q));
    register R10 (.clear(clear), .clock(clock), .enable(1'b0), .BusMuxOut(BusData), .BusMuxIn(R10_q));
    register R11 (.clear(clear), .clock(clock), .enable(1'b0), .BusMuxOut(BusData), .BusMuxIn(R11_q));
    register R12 (.clear(clear), .clock(clock), .enable(1'b0), .BusMuxOut(BusData), .BusMuxIn(R12_q));
    register R13 (.clear(clear), .clock(clock), .enable(1'b0), .BusMuxOut(BusData), .BusMuxIn(R13_q));
    register R14 (.clear(clear), .clock(clock), .enable(1'b0), .BusMuxOut(BusData), .BusMuxIn(R14_q));
    register R15 (.clear(clear), .clock(clock), .enable(1'b0), .BusMuxOut(BusData), .BusMuxIn(R15_q));

    register PC  (.clear(clear), .clock(clock), .enable(PCin),  .BusMuxOut(BusData), .BusMuxIn(PC_q));
    register IR  (.clear(clear), .clock(clock), .enable(IRin),  .BusMuxOut(BusData), .BusMuxIn(IR_q));
    register MAR (.clear(clear), .clock(clock), .enable(MARin), .BusMuxOut(BusData), .BusMuxIn(MAR_q));
    register Y   (.clear(clear), .clock(clock), .enable(Yin),   .BusMuxOut(BusData), .BusMuxIn(Y_q));
    register HI  (.clear(clear), .clock(clock), .enable(1'b0),  .BusMuxOut(BusData), .BusMuxIn(HI_q));
    register LO  (.clear(clear), .clock(clock), .enable(1'b0),  .BusMuxOut(BusData), .BusMuxIn(LO_q));
    register MDR (.clear(clear), .clock(clock), .enable(MDRin), .BusMuxOut(MDR_Input), .BusMuxIn(MDR_q));

    // ALU Logic
    wire [31:0] ALU_A = Y_q;
    wire [31:0] ALU_B = (IncPC) ? 32'd1 : BusData; 
    
    // *** FIX: Mapped to 5'd4 for AND because that is what your ALU.v uses ***
    wire [4:0]  ALU_Op = (AND) ? 5'd4 : 5'd0; 
    
    wire [63:0] ALU_Out;

    ALU alu_inst (.A(ALU_A), .B(ALU_B), .OpCode(ALU_Op), .C(ALU_Out));

    // Z Register
    reg [63:0] Z_reg;
    always @(posedge clock) begin
        if (clear) Z_reg <= 64'd0;
        else if (Zin) Z_reg <= ALU_Out;
    end
    assign Z_q = Z_reg;

    // Bus Multiplexer
    assign BusData = 
        (R5out)   ? R5_q :
        (R6out)   ? R6_q :
        (PCout)   ? PC_q :
        (MDRout)  ? MDR_q :
        (Zlowout) ? Z_q[31:0] : 
        32'd0;
endmodule