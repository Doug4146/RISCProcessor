module neg_32_bit(
	output wire [31:0] Rb,
	input wire [31:0] Ra
);

	wire [31:0] not_ra;
	wire Cout;
	
	not_32_bit not_res(not_ra, Ra);
	
	rc_adder add(
		.Sout(Rb),
		.Cout(Cout),
		.Ra(not_ra),
		.Rb(32'h00000000),
		.Cin(1'b1)
	);
	
endmodule