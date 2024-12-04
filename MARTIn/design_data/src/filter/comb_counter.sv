`include "timescale.v"

module comb_counter #(
    parameter CHANNELS = 64
) (
    input logic [CHANNELS-2:0] to_count,
    output logic [3:0] num
);

always @* begin
    num = 0;
    for(int i = 0; i < CHANNELS-1 ; i++ ) begin
        num += to_count[i];
    end
end

endmodule
