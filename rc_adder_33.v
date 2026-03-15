module rc_adder_33 ( //32 bit rc adder for multiplication overflow
	output wire [32:0] Sout,
	output wire Cout,
	input wire [32:0] Ra, Rb, 
	input wire Cin
);
	
	wire [33:0] c; 

	assign c[0] = Cin; 

	genvar i;
	generate
		for (i = 0; i < 33; i = i + 1) 
		begin : adder_loop
			full_adder fa (
				Sout[i],
				c[i+1], 
				Ra[i],
				Rb[i],
				c[i]     
			);
		end
	endgenerate

	assign Cout = c[33];
endmodule