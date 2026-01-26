module DP(
	input wire clock, clear,
	input wire [7:0] A,
	input wire [7:0] RegisterAImmediate,
	input wire RZout, RAout, RBout, R0out,
	input wire RAin, RBin, RZin, R0in
);

wire [7:0] BusMuxOut, BusMuxInRZ, BusMuxInRA, BusMuxInRB, BusMuxInR0;

wire [7:0] Zregin;

//Devices
register RA(clear, clock, RAin, RegisterAImmediate, BusMuxInRA);
register RB(clear, clock, RBin, BusMuxOut, BusMuxInRB);

//adder
RCAdd add(A, BusMuxOut, Zregin);
//register RZ(clear, clock, RZin, Zregin, BusMuxInRZ);

register R0(clear, clock, R0in, BusMuxtOut, BusMuxInR0);


//Bus
Bus bus(BusMuxInRZ, BusMuxInRA, BusMuxInRB, BusMuxInR0, RZout, RAout, RBout, R0out, BusMuxOut);

endmodule
