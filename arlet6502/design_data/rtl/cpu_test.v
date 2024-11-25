module test;
   reg clk, reset;
   reg [7:0] DI;
   wire [7:0] DO;
   wire WE;
   reg IRQ;
   reg NMI;
   reg RDY;
   wire [1:0] lh;

   Arlet6502 dut (
		  .clk(clk), 
		  .reset(reset), 
		  .DI(DI), 
		  .DO(DO), 
		  .WE(WE), 
		  .IRQ(IRQ), 
		  .NMI(NMI), 
		  .RDY(RDY), 
		  .lh(lh)
		  );

   always #5 clk=~clk;
   
   initial begin
      $dumpfile("test.vcd");
      $dumpvars(0,test);

      clk = 0;
      reset = 1;

      #50;
      reset = 0;
      RDY = 1;
      DI = 8'b10001100;
      
      
   end // initial begin
endmodule // test

	  
