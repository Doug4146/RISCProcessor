module select_and_encode (
    input wire [31:0] IR,
    input wire Gra,
    input wire Grb,
    input wire Grc,
    input wire Rin,
    input wire Rout,
    input wire BAout,
    output wire [15:0] R_in,
    output wire [15:0] R_out
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

    // Fixed: BAout now correctly applies to ALL registers so offset addressing works
    assign R_out = decoder_out & {16{Rout | BAout}};

endmodule