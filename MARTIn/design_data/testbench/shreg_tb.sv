`define SIZE 1600
`define TEST_SIZE 1000
`timescale 1ns/1ps
class test_data;

    rand bit [`TEST_SIZE-1:0] data; 

endclass

module bondpad_70x70(pad);
    inout wire pad;
endmodule

module tb();

    logic clk = 1'b0; 
    logic rst, shreg_enable, shreg_in, shreg_out;

    wire clk_w, rst_w, shreg_enable_w, shreg_in_w, shreg_out_w;
    assign clk_w = clk;
    assign rst_w = rst;
    assign shreg_enable_w = shreg_enable;
    assign shreg_in_w = shreg_in;
    assign shreg_out = shreg_out_w;

    martin_top DUT(.clk_pad(clk_w), .rst_pad(rst_w), .shreg_in_pad(shreg_in_w), .aux_enable_pad(shreg_enable_w), .shreg_out_pad(shreg_out_w));

    always #20 clk = ~clk;

    test_data data_to_go;
 
    initial begin

        $sdf_annotate("6_final.sdf", tb.DUT,, "sdf.log", "MAXIMUM");

        $display("Test started!");

        //Reset cycle
        @(negedge clk)
        rst = 1'b1;
        @(negedge clk)
        rst = 1'b0;
        @(negedge clk)
        rst = 1'b1;


        shreg_enable = 1'b1;
        data_to_go = new();
        void'(data_to_go.randomize());
        fork
            IMPULSE_GEN: begin 
                shreg_in = data_to_go.data[0];
                for(int i = 1; i < `TEST_SIZE; i++) begin
                    @(posedge clk);
                    #5;
                    shreg_in = data_to_go.data[i];
                end
            end
            IMPULSE_COLLECT: begin
                repeat(`SIZE) @(posedge clk);
                #19;
                for(int i = 0; i < `TEST_SIZE; i++) begin
                    assert (shreg_out == data_to_go.data[i]) else begin
                          $error("Value difference!");
                          $display("Test %d: exp: %b got: %b", i, data_to_go.data[i], shreg_out);
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