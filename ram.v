module ram (
    input wire clk,
    input wire read,
    input wire write,
    input wire [8:0] address,
    input wire [31:0] datain,
    output reg [31:0] dataout
);

    reg [31:0] memory [511:0];

    // Synchronous Write (Only updates memory on the clock edge)
    always @(posedge clk) begin
        if (write) begin
            memory[address] <= datain;
        end
    end

    // Asynchronous Read (Instantly updates dataout when address or read signal changes)
    always @(*) begin
        if (read) begin
            dataout = memory[address];
        end else begin
            dataout = 32'h00000000; // Default zero to keep the bus clean
        end
    end

    initial begin
        // Initialize for Load Instructions testing
        memory[9'h065] = 32'h00000084; // Initialize (0x65) = 0x84 
        memory[9'h0C9] = 32'h0000002B; // Initialize (0xC9) = 0x2B 
        
        // Initialize for Store Instructions testing
        memory[9'h01F] = 32'h000000D4; // Initialize (0x1F) = 0xD4 
        memory[9'h082] = 32'h000000A7; // Initialize (0x82) = 0xA7 
    end

endmodule