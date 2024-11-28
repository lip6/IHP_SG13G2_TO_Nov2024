module design_sel(
    input sel,
    input [7:0] spi_out,
    input spi_done,
    output reg [7:0] tgate_spi_out,
    output reg tgate_spi_done,
    output reg [7:0] neuron_spi_out,
    output reg neuron_spi_done
);

always @(*) begin
    case(sel)
        0: begin
            tgate_spi_out = spi_out;
            tgate_spi_done = spi_done;
            neuron_spi_out = 8'd0;
            neuron_spi_done = 0;
        end
        1: begin
            tgate_spi_out = 8'd0;
            tgate_spi_done = 0;
            neuron_spi_out = spi_out;
            neuron_spi_done = spi_done;
        end
    endcase
end

endmodule