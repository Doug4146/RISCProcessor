module booth_multiplier(
	input clock, clear, start,
	input wire [31:0] multiplicand, multiplier,
	output wire [63:0] product,
	output complete
);

	wire [64:0] prod;
	wire [31:0] M;
	wire [4:0] count;
	
	
	