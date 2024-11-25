module serializer (clk, reset, AB, DO, WE, RDY, RDY_in, DO_pad, lh);

   input clk;
   input reset;
   input [15:0]     AB;
   input [7:0] 	    DO;
   input 	    WE;
   input 	    RDY;
   output reg	    RDY_in;
   output reg [7:0] DO_pad;
   output reg [1:0] lh;

   reg [1:0] 	    state;

   parameter
     ADL = 2'b00,
     ADH = 2'b01,
     SDO  = 2'b10;
   
   always @(posedge clk or posedge reset)
    if (reset)
        state <= ADL;
    else 
      case(state)
	ADL:
	  begin
	     if(RDY)
	       state <= ADH;
	     else
	       state <= ADL;
	     DO_pad = AB[7:0];
	     lh = 0;
	     RDY_in = 0;
	  end
	ADH:
	  begin
	     if(RDY & ~WE)
	       begin
		  state <= ADL;
		  RDY_in = 1;
	       end
	     else if(RDY & WE)
	       begin
		  state <= SDO;
		  RDY_in = 0;
	       end
	     else
	       begin
		  state <= ADH;
		  RDY_in = 0;
	       end	   
	     DO_pad = AB[15:8];
	     lh = 1;
	  end
	SDO:
	  begin
	     if(RDY)
	       state <= ADL;
	     else
	       state <= DO;
	     DO_pad = DO;
	     lh = 2;
	     RDY_in = 1;	
	  end
      endcase // case (state)
endmodule // serializer
