module ror_32_bit (
	output reg[31:0] Rz,
	input wire[31:0] Ra,
	input wire[31:0] Number
);
	wire [4:0] Rotate = Number[4:0];
	always@(*) begin
		Rz = (Ra >> Rotate) | (Ra << (5'd32 - Rotate));
	end
endmodule
	
