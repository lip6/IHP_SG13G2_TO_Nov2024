`timescale 1ns/10ps



module bondpad_70x70(pad);
    inout wire pad;
endmodule


module tb();

    reg             clk = 1'b0;
    reg [7:0]      data_in;
    reg [7:0]       median_out; 
    reg             rst, wr_enable; 
    reg [1:0]       out_select;
    reg [2:0]       reg_addr;

    wire             clk_w;
    wire [7:0]       data_in_w;
    wire [7:0]       median_out_w; 
    wire             rst_w, wr_enable_w; 
    wire [1:0]       out_select_w;
    wire [2:0]       reg_addr_w;

    assign clk_w = clk;
    assign data_in_w = data_in;
    always @* begin
        median_out = median_out_w;
    end
    assign rst_w = rst;
    assign wr_enable_w = wr_enable; 
    assign out_select_w = out_select;
    assign reg_addr_w = reg_addr;


    reg [7:0] test_data [7:0];
    reg [7:0] median;
    reg [7:0] expected_op;

    integer i,j;

    always
        #10 clk = ~clk;

    task send_data;
    begin
        wr_enable = 1'b1;
        for(i = 0; i < 8; i=i+1) begin
            reg_addr = i;
            data_in = test_data[i];
            @(posedge clk);  
            #5;
        end
        wr_enable = 1'b0;
    end
    endtask

    function [7:0] get_median;
        input reg [7:0] in_array1 ;
        input reg [7:0] in_array2 ;
        input reg [7:0] in_array3 ;
        input reg [7:0] in_array4 ;
        input reg [7:0] in_array5 ;
        input reg [7:0] in_array6 ;
        input reg [7:0] in_array7 ;
        input reg [7:0] in_array8 ;
        reg [7:0] temp;

        reg [7:0] in_array [7:0];
        reg [7:0] sorted_array [7:0];

        begin
        in_array[0] = in_array1;
        in_array[1] = in_array2;
        in_array[2] = in_array3;
        in_array[3] = in_array4;
        in_array[4] = in_array5;
        in_array[5] = in_array6;
        in_array[6] = in_array7;
        in_array[7] = in_array8;
        for (i = 0; i < 8; i = i + 1) begin
            sorted_array[i] = in_array[i];
        end

        for (i = 0; i < 7; i = i + 1) begin
            for (j = 0; j < 7-i; j = j + 1) begin
            if (sorted_array[j] > sorted_array[j+1]) begin
                // Swap
                temp = sorted_array[j];
                sorted_array[j] = sorted_array[j+1];
                sorted_array[j+1] = temp;
            end
            end
        end
        get_median = sorted_array[4];
        end
    endfunction

    task generate_data;
        for(i = 0; i < 8 ; i=i+1) begin
            test_data[i] = $random%256;
        end
    endtask


    martin_top DUT(.clk_pad(clk_w), .rst_pad(rst_w), .data_in_pad(data_in_w), .reg_addr_pad(reg_addr_w), .wr_enable_pad(wr_enable_w), .out_select_pad(out_select_w), .data_out_pad(median_out_w));
    



    initial begin

	$dumpfile("filter.vcd"); 
  	$dumpvars(0, tb);  


        // 1.Test - transparency test
        $display("1.Test - transparency test");
        wr_enable = 1'b0;
        rst = 1'b1;
        out_select = 2'b10;
        reg_addr = 3'b000;

        @(posedge clk);
        #5;
        repeat (10000) begin
            generate_data;
            data_in = test_data[0];
            #14;
            if (median_out != test_data[0]) 
                $display("Transparency is wrong");
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
            generate_data;
            send_data;
            @(posedge clk);
            #19;
            median = get_median(test_data[0],test_data[1],test_data[2],test_data[3],test_data[4],test_data[5],test_data[6],test_data[7]);
            if (median_out != median)  $display("Median is wrong");

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
            generate_data;
            send_data;
            @(posedge clk);
            #19; 
            median = get_median(test_data[0],test_data[1],test_data[2],test_data[3],test_data[4],test_data[5],test_data[6],test_data[7]);
            expected_op = data_in - median;
            if (median_out !=  expected_op)   begin
                $display("Filter is wrong!");
            end
        end


        $finish;

    end

endmodule
