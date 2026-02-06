module alu(
	output reg [63:0] Rc,
	input wire [31:0] Ra, Rb,
	input wire [4:0] opcode
);

	parameter
	Add = 5'b00000,
	Sub = 5'b00001,
	And = 5'b00010,
	Or = 5'b00011,
	Shr = 5'b00100,
	Shra = 5'b00101,
	Shl = 5'b00110,
	Ror = 5'b00111,
	Rol = 5'b01000,
	Div = 5'b01100,
	Mul = 5'b01101,
	Neg = 5'b01110,
	Not = 5'b01111;
	
	wire [31:0] and_out, or_out, not_out, add_s, sub_s;
	wire add_c, sub_c;
	
	and_32_bit and_op(and_out, Ra, Rb);
	or_32_bit or_op(or_out, Ra, Rb);
	not_32_bit not_op(not_out, Rb);
	rc_adder add(add_s, add_c, Ra, Rb, 1'b0);
	rc_adder sub(sub_s, sub_c, Ra, not_out, 1'b1); 

	always @(*)
		begin
			case (opcode)
			
				Add: begin
					Rc[31:0] = add_s[31:0];
					Rc[63:32] = 32'd0;
				end
				
				Sub: begin
					Rc[31:0] = sub_s[31:0];
					Rc[63:32] = 32'd0;
				end
				
				And: begin
					Rc[31:0] = and_out[31:0];
					Rc[63:32] = 32'd0;
				end
				
				Or: begin
					Rc[31:0] = or_out[31:0];
					Rc[63:32] = 32'd0;
				end
				
				Not: begin
					Rc[31:0] = not_out[31:0];
					Rc[63:32] = 32'd0;
				end
			endcase
		end
endmodule
	
