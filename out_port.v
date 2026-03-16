module out_port #(parameter WIDTH = 32, INIT = 32'h0) (
	output reg [WIDTH-1:0]output_unit,
	input wire [WIDTH-1:0]bus_input,
	input  wire clock, clear, enable
);

always @ (posedge clock)
		begin 
			if (clear) begin
				output_unit <= INIT;
			end
			else if (enable) begin
				output_unit <= bus_input;
			end
		end
endmodule