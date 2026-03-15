module select_and_encode (
    input wire [31:0] IR,
    input wire Gra,
    input wire Grb,
    input wire Grc,
    input wire Rin,
    input wire Rout,
    input wire BAout,
    input wire Cout,
    output wire [15:0] R_in,
    output wire [15:0] R_out,
    output wire [31:0] C_sign_extended
);

    // Extract the Ra, Rb, and Rc fields from the Instruction Register (IR)
    wire [3:0] Ra = IR[26:23];
    wire [3:0] Rb = IR[22:19];
    wire [3:0] Rc = IR[18:15];
    
    wire [3:0] decoder_in;
    wire [15:0] decoder_out;

    // 1. Select the appropriate 4-bit field using Gra, Grb, or Grc
    assign decoder_in = (Gra ? Ra : 4'b0000) |
                        (Grb ? Rb : 4'b0000) |
                        (Grc ? Rc : 4'b0000);

    // 2. 4-to-16 Decoder to select the specific register
    assign decoder_out = 16'b1 << decoder_in;

    // 3. Generate R_in and R_out control signals
    assign R_in = decoder_out & {16{Rin}};

    // R1 to R15 out signals are simply ANDed with Rout
    assign R_out[15:1] = decoder_out[15:1] & {15{Rout}};

    // R0 out signal is ANDed with (Rout OR BAout) to support Load/Store
    assign R_out[0] = decoder_out[0] & (Rout | BAout);

    // 4. Sign-extend constant C
    // Fans out IR[18] to all higher-order bits when Cout is asserted
    assign C_sign_extended = Cout ? { {14{IR[18]}}, IR[17:0] } : 32'b0;

endmodule