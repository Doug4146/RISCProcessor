module neg_32_bit(
	output wire [31:0] Rb,
	input wire [31:0] Ra
);

	wire [31:0] Sout;
	wire Cout;
	
	not_32_bit not_res(Sout, Ra);
	rc_adder add(Cout, Rb, 32'h00000000, Sout, 32'h00000001);
	
endmodule