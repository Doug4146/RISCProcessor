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
	
endmodule
	

	
	