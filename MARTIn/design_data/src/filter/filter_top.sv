`timescale 1ns / 10ps
module filter_top(
    clk,
    rst,
    data_in,
    reg_addr,
    wr_enable,
    out_select,
    data_out
);
input logic clk, rst;
input logic [7:0] data_in;
input logic [2:0] reg_addr;
input logic wr_enable;
input logic [1:0] out_select;
output logic [7:0] data_out;

logic [7:0][7:0] input_storage;

logic [7:0] processor_out;

median_brute median_processor(.clk(clk), .data_in(input_storage), .median_out(processor_out));


always @(posedge clk) begin
    if(rst == 1'b0) 
        input_storage <= {64{1'b0}};
    else if (wr_enable == 1'b1) begin
        input_storage[reg_addr] <= data_in;
    end
end

assign data_out = (out_select == 2'b10 ) ?  data_in :
                  (out_select == 2'b01)  ? (data_in - processor_out) : 
                  processor_out;


endmodule