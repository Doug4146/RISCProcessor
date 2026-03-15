module booth_multiplier(
	output wire [63:0] product,
	output reg busy,
	input wire [31:0] multiplicand, multiplier,
	input clock, clear, start
);

	reg [31:0] A, Q, M;
	reg Q_1;
	reg [4:0] count;
	
	reg [32:0] mux_out; // 33 bits for overflow
	reg sub; // Cin for ripple carry
	
	wire [32:0] adder_out;
	wire Cout; 
	
	// Decoder 
	always @(*) begin
		case ({Q[1], Q[0], Q_1})
			3'b000, 3'b111: begin 
				mux_out = 33'd0; sub = 1'b0; end //0
			3'b001, 3'b010: begin
				mux_out = {M[31], M}; sub = 1'b0; end // 1M
			3'b101, 3'b110: begin
				mux_out = ~{M[31], M}; sub = 1'b1; end //-1M
			3'b011: begin
				mux_out = {M[31:0], 1'b0}; sub = 1'b0; end //2M
			3'b100: begin
				mux_out = ~{M[31:0], 1'b0}; sub = 1'b1; end //-2M
		endcase
	end
	
	rc_adder_33 add (
		.Sout(adder_out), .Cout(Cout),
		.Ra({A[31], A}), .Rb(mux_out), .Cin(sub)
	);
	
	always @(posedge clock or posedge clear) begin
        if (clear) begin
            A <= 32'd0;
            M <= 32'd0;
            Q <= 32'd0;
            Q_1 <= 1'b0;
            count <= 5'd0;
            busy <= 1'b0; 
        end
        else if (start) begin
            A <= 32'd0;
            M <= multiplicand;
            Q <= multiplier;
            Q_1 <= 1'b0;
            count <= 5'd0;
            busy <= 1'b1;
        end
        else if (count < 16) begin
            A <= {adder_out[32], adder_out[32:2]};
            Q   <= {adder_out[1:0], Q[31:2]};
            Q_1 <= Q[1];
            
            count <= count + 1;
            if (count == 15) busy <= 1'b0;
        end
    end 
	
	assign product = {A, Q};
	
endmodule
	
	