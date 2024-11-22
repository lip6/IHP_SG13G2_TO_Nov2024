`include "timescale.v"

module comb_comparator #(
    parameter DATA_SIZE = 12
)

(
    input logic [DATA_SIZE-1:0] data_in1, data_in2,
    output logic gr1, gr2
);

always @* begin
    if(data_in1 < data_in2) begin
        gr1 = 1'b0;
        gr2 = 1'b1;
    end else begin
        gr1 = 1'b1;
        gr2 = 1'b0;
    end
end



endmodule
