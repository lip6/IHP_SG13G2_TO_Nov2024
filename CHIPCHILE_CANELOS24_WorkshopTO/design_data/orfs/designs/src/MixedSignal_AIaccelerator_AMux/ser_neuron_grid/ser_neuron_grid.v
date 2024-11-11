module ser_neuron_grid(
  input clk,
  input rst,
  input done_iw,
  input [7:0] dout_iw,
  output [7:0] dout
);

  wire trig;

  wire [7:0] control, neuron_select, din, sign, dout_spi;
  wire set_din, set_data_in;

  wire [7:0] din_controller, win_controller, bias_controller;

  wire [7:0] win0, win1, win2, win3, win4, win5, win6, win7;  // Individual inputs for win
  wire [7:0] bias0, bias1, bias2, bias3, bias4, bias5, bias6, bias7;  // Individual inputs for bias
  wire [7:0] dout0, dout1, dout2, dout3, dout4, dout5, dout6, dout7;  // Individual outputs

  controller spi_controller_instance(
    .clk(clk),
    .rst(rst),
    .spi_done(done_iw),
    .spi_input(dout_iw),
    .control(control),
    .set_data_in(set_data_in),
    .set_din(set_din),
    .trig(trig)
  );

  decoder decoder_inst(
    .id(control[2:0]),
    .neuron_select(neuron_select)
  );

  registers registers_inst(
    .clk(clk), .rst(rst),
    .neuron_select(neuron_select),
    .select(control[4:3]),
    .set_din(set_din),
    .set_data_in(set_data_in),
    .data_in(dout_iw),
    .din(din),
    .sign(sign),  // Single 8-bit vector
    .win0(win0), .win1(win1), .win2(win2), .win3(win3), .win4(win4), .win5(win5), .win6(win6), .win7(win7),  // Individual inputs for win
    .bias0(bias0), .bias1(bias1), .bias2(bias2), .bias3(bias3), .bias4(bias4), .bias5(bias5), .bias6(bias6), .bias7(bias7)  // Individual inputs for bias
  );

  grid_8 grid_instance(
    .din(din),
    .sign(sign),  // Single 8-bit vector
    .win0(win0), .win1(win1), .win2(win2), .win3(win3), .win4(win4), .win5(win5), .win6(win6), .win7(win7),  // Individual inputs for win
    .bias0(bias0), .bias1(bias1), .bias2(bias2), .bias3(bias3), .bias4(bias4), .bias5(bias5), .bias6(bias6), .bias7(bias7),  // Individual inputs for bias
    .dout0(dout0), .dout1(dout1), .dout2(dout2), .dout3(dout3), .dout4(dout4), .dout5(dout5), .dout6(dout6), .dout7(dout7),  // Individual outputs
    .trig(trig),
    .clk(clk),
    .rst(rst)
  );

  output_manager output_manager(
    .dout0(dout0), .dout1(dout1), .dout2(dout2), .dout3(dout3), .dout4(dout4), .dout5(dout5), .dout6(dout6), .dout7(dout7),
    .output_select(control[2:0]),
    .dout_spi(dout_spi)
  );

  assign dout = dout_spi;

  //mux output_mux(dout_spi, 8'b11111111, 1'b1, dout);

endmodule