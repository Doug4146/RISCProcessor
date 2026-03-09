module in_port #(parameter WIDTH=32, INIT = 32'h0) (
	output reg [WIDTH-1:0]to_bus,
	input wire [WIDTH-1:0]input_unit,
	input wire clear, clock
);

always @ (posedge clock)
		begin 
			if (clear) begin
				to_bus <= INIT;
			end
			else begin
				to_bus <= input_unit;
			end
		end
endmodule

