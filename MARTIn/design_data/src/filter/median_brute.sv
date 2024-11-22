`define CHANNELS 8
`define BITS_PER_CHANNEL 8
`define HALFCH (`CHANNELS/2)
`include "timescale.v"

module median_brute (
    input  logic              clk,
    input  logic [`CHANNELS-1:0][`BITS_PER_CHANNEL-1:0] data_in,
    output logic [`BITS_PER_CHANNEL-1:0]       median_out


);

genvar x;
genvar y;

logic [`CHANNELS-1:0][`CHANNELS-2:0] to_counter;  //First is the channel second is the indx into the counter
logic [`CHANNELS-1:0][3:0]  counter_out;
 
generate
    for(x = 0; x < `CHANNELS ; x++) begin     
        for(y = x + 1; y < `CHANNELS ; y ++) begin
            //                                 to 1st       to 2nd
            comb_comparator #(`BITS_PER_CHANNEL)  comp0(data_in[x], data_in[y], to_counter[x][y-1] , to_counter[y][x]);
        end 
        comb_counter #(`CHANNELS) count0(to_counter[x], counter_out[x]);

    end
endgenerate


always @(posedge clk) begin
    for(int i = 0; i < `CHANNELS; i++) begin
        if(counter_out[i] == 4)
            median_out <= data_in[i];
    end
end


endmodule
