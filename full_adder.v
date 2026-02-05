module full_adder (
	output wire sum, cout,
    input wire a, b, cin
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (cin & a);
endmodule