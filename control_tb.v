`timescale 1ns/10ps

module control_tb;

    // Testbench variables
    reg clock;
    reg clear;
    reg stop;
    reg [31:0] In_PortOut;
    wire [31:0] port_display;

    // Instantiate CPU
    cpu CPU (
        .clock(clock), 
        .clear(clear), 
        .stop(stop),
        .In_PortOut(In_PortOut),
        .port_display(port_display)
    );

    // Clock Generation (20ns period)
    always #10 clock = ~clock;

    initial begin
        // initialize inputs
        clock = 0;
        clear = 0;
        stop = 0;
        In_PortOut = 32'd0; 

        // Pulse clear to initialize FSM and zero Datapath registers
        #5 clear = 1;
        #20 clear = 0;

        #15000; 
        
        $stop;
    end

endmodule