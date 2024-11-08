Design data and design process description
############################################


This project was made utilizing: 
    - sv2v  
    - OpenRoad
    - Klayout
    - OpenSTA

The source files of the chip were developed in System Verilog language. \
To enable its synthesis, they were converted using sv2v open source tool that converted them to Yosys readable \
verilog files.

The team also developed SDC, pad placment and power placment files that were necessary in the OpenRoad flow. \
Using the OpenRoad flow, the final GDS, SDC, netlist, SPEF and DEF files were generated. 

These generated files were used in OpenSTA to generate a SDF annotation file, capable of improving the accuracy \
of the netlist simulation.

Klayout was utilized to merge GDS files, visualization and to test the DRC and LVS of the design.

After all that process, a chip filling script was utilized to remove DRC errors. 

Finally the chip netlist was simulated to verify the intended functionality.

