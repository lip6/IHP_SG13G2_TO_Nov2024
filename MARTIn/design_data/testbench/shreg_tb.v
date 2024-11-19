`define SIZE 1600
`define TEST_SIZE 1000
`timescale 1ns/1ps

module bondpad_70x70(pad);
    inout wire pad;
endmodule

module tb();

    reg clk = 1'b0; 
    reg rst, shreg_enable, shreg_in, shreg_out;

    wire clk_w, rst_w, shreg_enable_w, shreg_in_w, shreg_out_w;
    assign clk_w = clk;
    assign rst_w = rst;
    assign shreg_enable_w = shreg_enable;
    assign shreg_in_w = shreg_in;
    always @* begin
        shreg_out = shreg_out_w;
    end

    martin_top DUT(.clk_pad(clk_w), .rst_pad(rst_w), .shreg_in_pad(shreg_in_w), .aux_enable_pad(shreg_enable_w), .shreg_out_pad(shreg_out_w));

    always #20 clk = ~clk;

 
    reg [`TEST_SIZE-1:0] test_data;

    integer i;

    initial begin
    
     	$dumpfile("shreg.vcd"); 
  	    $dumpvars(0, tb);    


        $display("Test started!");

        //Reset cycle
        #40
        rst = 1'b1;
        #40
        rst = 1'b0;
        #40
        rst = 1'b1;
        #40

        //Generate test vector
        for(i = 0; i < `TEST_SIZE; i=i+1) begin
            test_data[i] = $random%2;
        end

        shreg_enable = 1'b1;
        fork
            begin 
                shreg_in = test_data[0];
                for(i = 1; i < `TEST_SIZE; i=i+1) begin
                    @(posedge clk);
                    #5;
                    shreg_in = test_data[i];
                end
            end
            begin
                repeat(`SIZE) @(posedge clk);
                #19;
                for(i = 0; i < `TEST_SIZE; i=i+1) begin
                    if (shreg_out !== test_data[i]) begin
                          $display("Test %d: exp: %b got: %b", i, test_data[i], shreg_out);
                    end
                    @(posedge clk);
                    #19;
                end
            end
        join
        
        $display("Test finished!");

        $finish;
    end


endmodule
