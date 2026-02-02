module RegisterFile(
	input clk,
	input clear,
	input write_enable,            
   input [3:0] Reg_Select,        
   input [31:0] BusMuxOut,        
   output [31:0] BusMuxIn
	
);
	
	
	
wire [31:0] reg_outputs [15:0]; 
wire [15:0] reg_enables;        

assign reg_enables = (write_enable) ? (16'b1 << Reg_Select) : 16'b0;

genvar i;
generate
	for (i = 0; i < 16; i = i + 1) begin : reg_gen
		register32 R (
			.clock(clock),
			.clear(clear),
			.enable(reg_enables[i]),  
			.BusMuxOut(BusMuxOut),    
			.BusMuxIn(reg_outputs[i]) 
      );
	end
endgenerate

   
assign BusMuxIn = reg_outputs[Reg_Select];

endmodule
