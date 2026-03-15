module sub_32_bit (
	output wire [31:0] Sout, 
	output wire Cout,
	input wire [31:0] Ra, Rb
);

	//wire c;
	wire [31:0] flipped;
	
	not_32_bit flip(flipped, Rb);
	
	rc_adder subtract (
		Sout, Cout, 
		Ra, flipped, 1'b1
	);
endmodule
	
