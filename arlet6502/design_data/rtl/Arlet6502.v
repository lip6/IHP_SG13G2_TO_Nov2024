/*
 * Bare wrapper around code mainly to give module the right name
 */

`include "ALU.v"
`include "cpu_syncreset.v"
`include "serializer.v"

module Arlet6502(clk, reset, DI, DO, WE, IRQ, NMI, RDY, lh);

input clk;              // CPU clock 
input reset;            // reset signal
input [7:0] DI;         // data in, read bus
output [7:0] DO;        // data out or address, write bus
output WE;              // write enable
input IRQ;              // interrupt request
input NMI;              // non-maskable interrupt request
input RDY;              // Ready signal. Pauses CPU when RDY=0
output [1:0] lh;        // information about data on DO  

wire RDY_in;            // internal RDY pauses if serializer not ready A
wire [15:0] A;          // address bus from CPU
wire [7:0] DO_in;       // data out from CPU   
   
cpu MOS6502(
    .clk(clk), .reset(reset), .AB(A), .DI(DI), .DO(DO_in), .WE(WE),
    .IRQ(IRQ), .NMI(NMI), .RDY(RDY_in)
);

serializer ser(
	       .clk(clk),
	       .reset(reset),
	       .AB(A),
	       .DO(DO_in),
	       .WE(WE),
	       .RDY(RDY),
	       .RDY_in(RDY_in),
	       .DO_pad(DO),
	       .lh(lh));

endmodule // Arlet6502
