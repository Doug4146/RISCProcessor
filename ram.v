module ram (
    input wire clk,
    input wire read,
    input wire write,
    input wire [8:0] address,
    input wire [31:0] datain,
    output reg [31:0] dataout
);

    reg [31:0] memory [511:0];

    always @(posedge clk) begin
        if (write) begin
            memory[address] <= datain;
        end
        if (read) begin
            dataout <= memory[address];
        end
    end

    initial begin
        // You can use $readmemh to load a hex file:
        // $readmemh("memory_init.hex", memory);
        
        // Alternatively, you can hardcode the initialization values 
        // required for the lab test cases directly here:
        
        // Initialize for Load Instructions testing
        memory[9'h065] = 32'h00000084; // Initialize (0x65) = 0x84 
        memory[9'h0C9] = 32'h0000002B; // Initialize (0xC9) = 0x2B 
        
        // Initialize for Store Instructions testing
        memory[9'h01F] = 32'h000000D4; // Initialize (0x1F) = 0xD4 
        memory[9'h082] = 32'h000000A7; // Initialize (0x82) = 0xA7 
    end

endmodule