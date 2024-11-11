Design data and design process description
############################################


This project was made utilizing: 
    - sv2v (v0.0.12-17-g5374679)
    - OpenRoad (contained in i2c-gpio-expander, commit: c2c17bf)
    - Klayout (contained in i2c-gpio-expander, commit: c2c17bf)
    - filler.py (contained in i2c-gpio-expander, commit: c2c17bf)
    - sealring.py (contained in i2c-gpio-expander, commit: c2c17bf)
    - OpenSTA (2.6.0)

The source files of the chip were developed in System Verilog language. \
To enable its synthesis, they were converted using sv2v open source tool that converted them to Yosys readable \
verilog files.

.. code-block:: language

   ./sv2v [input_files] > output.v

The team also developed SDC, pad placment and power placment files that were necessary in the OpenRoad flow. \
Using the OpenRoad flow, the final GDS, SDC, netlist, SPEF and DEF files were generated. 

The OpenRoad flow utilized to synthesize this project was the one contained in the i2c-gpio-expander \
(https://github.com/aesc-silicon/i2c-gpio-expander). 

These generated files were used in OpenSTA to generate a SDF annotation file, capable of improving the accuracy \
of the netlist simulation.

.. code-block:: language

   ./sta
   read_lib [lib file]
   read_verilog [flow output netlist]
   link martin_top
   read_spef [flow output spef]
   read_sdc [flow output sdc]
   write_sdf [sdf_file]

Klayout was utilized to merge GDS files, visualization and to test the DRC and LVS of the design.

After all that process, a chip filling script was utilized to remove DRC errors. 

Finally the chip netlist was simulated to verify the intended functionality.

