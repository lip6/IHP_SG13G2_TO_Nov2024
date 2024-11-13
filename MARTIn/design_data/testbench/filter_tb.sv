`timescale 1ns/10ps

class data_c;
    rand bit [7:0] data [8]; 
    bit [7:0] data_sorted[8];
    bit [7:0] q[$];

    function int getMedian;
        data_sorted = data;
        data_sorted.sort();
        q = data.unique();
        return data_sorted[4];
        
    endfunction

endclass


module bondpad_70x70(pad);
    inout wire pad;
endmodule


module tb();

    logic             clk = 1'b0;
    logic [7:0]      data_in;
    logic [7:0]       median_out; 
    logic             rst, wr_enable; 
    logic [1:0]       out_select;
    logic [2:0]       reg_addr;

    wire             clk_w;
    wire [7:0]       data_in_w;
    wire [7:0]       median_out_w; 
    wire             rst_w, wr_enable_w; 
    wire [1:0]       out_select_w;
    wire [2:0]       reg_addr_w;

    assign clk_w = clk;
    assign data_in_w = data_in;
    assign median_out = median_out_w; 
    assign rst_w = rst;
    assign wr_enable_w = wr_enable; 
    assign out_select_w = out_select;
    assign reg_addr_w = reg_addr;


    always
        #10 clk = ~clk;

    task send_data();
        wr_enable = 1'b1;
        for(int i = 0; i < 8; i++) begin
            reg_addr = i;
            data_in = data_to_go.data[i];
            @(posedge clk);  
            #5;
        end
        wr_enable = 1'b0;
    endtask


    martin_top DUT(.clk_pad(clk_w), .rst_pad(rst_w), .data_in_pad(data_in_w), .reg_addr_pad(reg_addr_w), .wr_enable_pad(wr_enable_w), .out_select_pad(out_select_w), .data_out_pad(median_out_w));
    
    data_c data_to_go;

    bit  [7:0] expected_op;




    initial begin

           $sdf_annotate("6_final.sdf", tb.DUT,, "sdf.log", "MAXIMUM");

        // 1.Test - transparency test
        $display("1.Test - transparency test");
        wr_enable = 1'b0;
        rst = 1'b1;
        out_select = 2'b10;
        reg_addr = 3'b000;

        @(posedge clk);
        #5;
        repeat (10000) begin
            data_to_go = new();
            void'(data_to_go.randomize());
            data_in = data_to_go.data[0];
            #14;
            assert (median_out == data_to_go.data[0]) else 
                $error("Transparency is wrong");
            @(posedge clk);
            #5;
        end

        //2.Test - median test
        $display("2.Test - median test");
        @(posedge clk);
        #5;
        rst = 1'b0;
        @(posedge clk);
        #5;
        rst = 1'b1;
        @(posedge clk);
        #5;
        out_select = 2'b00;
        @(posedge clk);
        #5;

        repeat(10000) begin
            data_to_go = new();
            void'(data_to_go.randomize());
            send_data();
            @(posedge clk);
            #19;
            assert (median_out == data_to_go.getMedian()) else  $error("Median is wrong");

        end

        //3.Test - Filter test
        $display("3.Test - filter test");
        @(posedge clk);
        #5;
        rst = 1'b0;
        @(posedge clk);
        #5;
        rst = 1'b1;
        @(posedge clk);
        #5;
        out_select = 2'b01;
        @(posedge clk);
        #5;
        
        repeat(10000) begin
            data_to_go = new();
            void'(data_to_go.randomize());
            send_data();
            @(posedge clk);
            #19; 
            expected_op = data_in - data_to_go.getMedian();
            assert (median_out ==  expected_op) else  begin
 
            end
        end


        $finish;

    end

endmodule