module MixedSignal_AIaccelerator_AMux (
    inout [7:0] chip_in_PAD,
    inout [12:0] chip_in_analog_PAD,
    inout chip_out_PAD,
    inout [15:0] chip_internal,
    inout clk_PAD,
    inout rst_n_PAD
);

wire [7:0] chip_in;
wire chip_out;
wire [12:0] chip_in_analog;
(* keep *)
wire clk;
wire rst_n;

(* keep *)
sg13g2_IOPadIn sg13g2_clk (
    .p2c(clk),
    .pad({clk_PAD})
);
(* keep *)
sg13g2_IOPadIn sg13g2_rst_n (
    .p2c(rst_n),
    .pad(rst_n_PAD)
);

(* keep *)
sg13g2_IOPadIn sg13g2_chip_in_0 (
      .p2c(chip_in[0]),
      .pad({chip_in_PAD[0]})
);
(* keep *)
sg13g2_IOPadIn sg13g2_chip_in_1 (
      .p2c(chip_in[1]),
      .pad({chip_in_PAD[1]})
);
(* keep *)
sg13g2_IOPadIn sg13g2_chip_in_2 (
      .p2c(chip_in[2]),
      .pad({chip_in_PAD[2]})
);
(* keep *)
sg13g2_IOPadIn sg13g2_chip_in_3 (
      .p2c(chip_in[3]),
      .pad({chip_in_PAD[3]})
);
(* keep *)
sg13g2_IOPadIn sg13g2_chip_in_4 (
      .p2c(chip_in[4]),
      .pad({chip_in_PAD[4]})
);
(* keep *)
sg13g2_IOPadIn sg13g2_chip_in_5 (
      .p2c(chip_in[5]),
      .pad({chip_in_PAD[5]})
);
(* keep *)
sg13g2_IOPadIn sg13g2_chip_in_6 (
      .p2c(chip_in[6]),
      .pad({chip_in_PAD[6]})
);
(* keep *)
sg13g2_IOPadIn sg13g2_chip_in_7 (
      .p2c(chip_in[7]),
      .pad({chip_in_PAD[7]})
);

sg13g2_IOPadOut4mA sg13g2_chip_out_0 (
      .c2p(chip_out),
      .pad(chip_out_PAD)
  );

(* keep *)
sg13g2_IOPadAnalog sg13g2_chip_analog_0 (
    .pad(chip_in_analog_PAD[0]),
    .padres({chip_in_analog[0]})
);
(* keep *)
sg13g2_IOPadAnalog sg13g2_chip_analog_1 (
    .pad(chip_in_analog_PAD[1]),
    .padres({chip_in_analog[1]})
);
(* keep *)
sg13g2_IOPadAnalog sg13g2_chip_analog_2 (
    .pad(chip_in_analog_PAD[2]),
    .padres({chip_in_analog[2]})
);
(* keep *)
sg13g2_IOPadAnalog sg13g2_chip_analog_3 (
    .pad(chip_in_analog_PAD[3]),
    .padres({chip_in_analog[3]})
);
(* keep *)
sg13g2_IOPadAnalog sg13g2_chip_analog_4 (
    .pad(chip_in_analog_PAD[4]),
    .padres({chip_in_analog[4]})
);
(* keep *)
sg13g2_IOPadAnalog sg13g2_chip_analog_5 (
    .pad(chip_in_analog_PAD[5]),
    .padres({chip_in_analog[5]})
);
(* keep *)
sg13g2_IOPadAnalog sg13g2_chip_analog_6 (
    .pad(chip_in_analog_PAD[6]),
    .padres({chip_in_analog[6]})
);
(* keep *)
sg13g2_IOPadAnalog sg13g2_chip_analog_7 (
    .pad(chip_in_analog_PAD[7]),
    .padres({chip_in_analog[7]})
);
(* keep *)
sg13g2_IOPadAnalog sg13g2_chip_analog_8 (
    .pad(chip_in_analog_PAD[8]),
    .padres({chip_in_analog[8]})
);
(* keep *)
sg13g2_IOPadAnalog sg13g2_chip_analog_9 (
    .pad(chip_in_analog_PAD[9]),
    .padres({chip_in_analog[9]})
);
(* keep *)
sg13g2_IOPadAnalog sg13g2_chip_analog_10 (
    .pad(chip_in_analog_PAD[10]),
    .padres({chip_in_analog[10]})
);
(* keep *)
sg13g2_IOPadAnalog sg13g2_chip_analog_11 (
    .pad(chip_in_analog_PAD[11]),
    .padres({chip_in_analog[11]})
);
(* keep *)
sg13g2_IOPadAnalog sg13g2_chip_analog_12 (
    .pad(chip_in_analog_PAD[12]),
    .padres({chip_in_analog[12]})
);

digital_block digital_block_i(
    .clk(clk), 
    .rst_neg(rst_n), 
    .ss(chip_in[0]), 
    .mosi(chip_in[1]), 
    .sck(chip_in[2]),
    .miso(chip_out),
    .amux_en(chip_internal[7:0]),
    .amux_en_neg(chip_internal[15:8]),
    .sel(chip_in[3]), 
    .amux_sel(chip_in[4]),
    .amux_pad_en(chip_in[7:5])
);

endmodule
