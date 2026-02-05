module rc_adder (
	output wire [31:0] Sout,
	output wire Cout,
	input wire [31:0] Ra, Rb, 
	input wire Cin);
	
	wire [32:0] c; 

	assign c[0] = Cin; 

	genvar i;
	generate
		for (i = 0; i < 32; i = i + 1) 
		begin : adder_loop
			full_adder fa (
				.sum(Sout[i]),
				.cout(c[i+1]), 
				.a(Ra[i]),
				.b(Rb[i]),
				.cin(c[i])     
			);
		end
	endgenerate

	assign Cout = c[32];
endmodule
