module alu(
    output reg [63:0] Rc,
    input wire [31:0] Ra, Rb,
    input wire ADD, SUB, AND, OR, SHR, SHRA, SHL, ROR, ROL, DIV, MUL, NEG, NOT
);

    wire [31:0] and_out, or_out, not_out, add_s, sub_s, neg_out;
    wire [31:0] shr_out, shra_out, shl_out, ror_out, rol_out;
    wire add_c, sub_c;
    
    and_32_bit and_op(and_out, Ra, Rb);
    or_32_bit or_op(or_out, Ra, Rb);
    not_32_bit not_op(not_out, Rb);
    rc_adder add(add_s, add_c, Ra, Rb, 1'b0);
    rc_adder sub(sub_s, sub_c, Ra, not_out, 1'b1);
    neg_32_bit neg(neg_out, Ra);
    shr_32_bit shr(shr_out, Ra, Rb);
    shra_32_bit shra(shra_out, Ra, Rb);
    shl_32_bit shl(shl_out, Ra, Rb);
    ror_32_bit ror(ror_out, Ra, Rb);
    rol_32_bit rol(rol_out, Ra, Rb);

    always @(*)
        begin
            Rc = 64'd0; 

            if (ADD) begin
                Rc[31:0] = add_s[31:0];
                Rc[63:32] = 32'd0;
            end
            else if (SUB) begin
                Rc[31:0] = sub_s[31:0];
                Rc[63:32] = 32'd0;
            end
            else if (AND) begin
                Rc[31:0] = and_out[31:0];
                Rc[63:32] = 32'd0;
            end
            else if (OR) begin
                Rc[31:0] = or_out[31:0];
                Rc[63:32] = 32'd0;
            end
            else if (SHR) begin
                Rc[31:0] = shr_out[31:0];
                Rc[63:32] = 32'd0;
            end
            else if (SHRA) begin
                Rc[31:0] = shra_out[31:0];
                Rc[63:32] = 32'd0;
            end
            else if (SHL) begin
                Rc[31:0] = shl_out[31:0];
                Rc[63:32] = 32'd0;
            end
            else if (ROR) begin
                Rc[31:0] = ror_out[31:0];
                Rc[63:32] = 32'd0;
            end
            else if (ROL) begin
                Rc[31:0] = rol_out[31:0];
                Rc[63:32] = 32'd0;
            end
            else if (NEG) begin
                Rc[31:0] = neg_out[31:0];
                Rc[63:32] = 32'd0;
            end
            else if (NOT) begin
                Rc[31:0] = not_out[31:0];
                Rc[63:32] = 32'd0;
            end
				
        end
endmodule