module amux_en_sel(
    input sel,
    input [7:0] spi_en,
    input [7:0] pad_en,
    output reg [7:0] amux_en
);

always @(*) begin
    case(sel)
        0: begin
            amux_en = pad_en;
        end
        1: begin
            amux_en = spi_en;
        end
    endcase
end

endmodule