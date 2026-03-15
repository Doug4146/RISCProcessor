module or_32_bit(
	output reg[31:0] Rz,
	input wire[31:0] Ra, Rb
);

always@(*)
begin
	Rz = Ra|Rb;
end
endmodule