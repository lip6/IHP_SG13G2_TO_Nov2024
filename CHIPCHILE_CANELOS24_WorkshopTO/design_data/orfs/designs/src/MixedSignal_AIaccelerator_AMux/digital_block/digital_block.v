module digital_block(
    input clk, rst_neg, ss, mosi, sck,
    output miso,
    output [7:0] amux_en,
    output [7:0] amux_en_neg,
    input sel, amux_sel,
    input [2:0] amux_pad_en
);


wire rst;
assign rst = ~rst_neg;

wire done;
wire [7:0] din, dout;

wire [7:0] amux_spi_out, neuron_spi_out;
wire amux_spi_done, neuron_spi_done;

wire [7:0] amux_pad_en_onehot;

reg [7:0] amux_save_spi_en;

assign amux_en_neg = ~amux_en;

spi spi_inst(
    .clk(clk),
    .rst(rst),
    .ss(ss),
    .mosi(mosi),
    .miso(miso),
    .sck(sck),
    .done(done),
    .din(din),
    .dout(dout)
); 

design_sel design_sel_i(
    .sel(sel),
    .spi_out(dout),
    .spi_done(done),
    .tgate_spi_out(amux_spi_out),
    .tgate_spi_done(amux_spi_done),
    .neuron_spi_out(neuron_spi_out),
    .neuron_spi_done(neuron_spi_done)
);

always @(posedge clk) begin
    if(rst) amux_save_spi_en <= 8'd0;
    else if(amux_spi_done) amux_save_spi_en <= amux_spi_out;
end

amux_decoder amux_decoder_i(amux_pad_en, amux_pad_en_onehot);

amux_en_sel amux_en_sel_i(
    .sel(amux_sel),
    .spi_en(amux_save_spi_en),
    .pad_en(amux_pad_en_onehot),
    .amux_en(amux_en)
);

ser_neuron_grid ser_neuron_grid_i(
    .clk(clk),
    .rst(rst),
    .done_iw(neuron_spi_done),
    .dout_iw(neuron_spi_out),
    .dout(din)
);

endmodule