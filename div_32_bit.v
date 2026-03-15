module div_32_bit(
    output reg [63:0] result,
    input wire [31:0] dividend,
    input wire [31:0] divisor
);

    integer i;
    reg [31:0] Q;
    reg [31:0] A;
    reg [31:0] subOutput;

    reg [31:0] abs_dividend;
    reg [31:0] abs_divisor;
    reg [31:0] final_Q;
    reg [31:0] final_A;
    reg sign_Q;
    reg sign_A;

    always @(*) begin
        // Division by Zero Check 
        if (divisor == 32'd0) begin
            result = 64'd0;    
        end 
        else begin
            // Determine what the final signs should be
            sign_Q = dividend[31] ^ divisor[31]; 
            sign_A = dividend[31];

            // Convert inputs to Absolute Values
            abs_dividend = dividend[31] ? (~dividend + 1'b1) : dividend;
            abs_divisor  = divisor[31]  ? (~divisor + 1'b1)  : divisor;

            // Restoring Math
            A = 32'd0;
            Q = abs_dividend;
            
            for(i=0; i<32; i=i+1) begin
                A = {A[30:0], Q[31]}; 
                subOutput = A - abs_divisor; 

                if(subOutput[31] == 1'b1) begin
                    Q = {Q[30:0], 1'b0}; 
                end
                else begin
                    Q = {Q[30:0], 1'b1}; 
                    A = subOutput;
                end
            end

            final_Q = sign_Q ? (~Q + 1'b1) : Q;
            final_A = sign_A ? (~A + 1'b1) : A;

            result = {final_A, final_Q}; 
        end
    end
endmodule