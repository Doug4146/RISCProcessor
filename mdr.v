module mdr(
	output [31:0] mdr_out, 
	input [31:0] BusMuxOut, mem_data, 
	input read_signal, clock, clear, enable);
   
   wire[31:0] MDMux_out;
	 
	assign MDMux_out = read_signal ? mem_data : BusMuxOut;
    
	register mdr_reg (
        .clock(clock),
        .clear(clear),
        .enable(enable),
        .BusMuxOut(MDMux_out), 
        .BusMuxIn(mdr_out)   
    );
endmodule