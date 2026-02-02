module ALU(
    input  [31:0] A,
    input  [31:0] B,
    input  [4:0]  OpCode,      
    output reg [63:0] C      
);

    always @(*) begin
        case (OpCode)
            5'd0: C = A + B;                   
            5'd1: C = A - B;                   
            5'd2: C = A * B;                  
            5'd3: C = A / B;                    

            5'd4: C = {32'b0, (A & B)};        
            5'd5: C = {32'b0, (A | B)};      
            5'd6: C = {32'b0, (~A)};           
            5'd7: C = {32'b0, (~A + 1'b1)};    

            5'd8: C = {32'b0, (A << B[4:0])};   
            5'd9: C = {32'b0, (A >> B[4:0])};   
            5'd10: C = {32'b0, (A >>> B[4:0])}; 
            
            5'd11: C = {32'b0, ((A << B[4:0]) | (A >> (32 - B[4:0])))};
            5'd12: C = {32'b0, ((A >> B[4:0]) | (A << (32 - B[4:0])))};

            default: C = 64'b0;                 
        endcase
    end

endmodule