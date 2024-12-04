Design data and design process description
############################################


This project was made utilizing: 
    - sv2v (v0.0.12-17-g5374679)
    - OpenRoad (contained in i2c-gpio-expander, commit: c2c17bf)
    - Klayout (contained in i2c-gpio-expander, commit: c2c17bf)
    - IHP sg13g2 PDK (https://github.com/KrzysztofHerman/IHP-Open-PDK, branch: fillerDSNov2024)
    - filler.py (https://github.com/KrzysztofHerman/IHP-Open-PDK, branch: fillerDSNov2024)
    - sealring.py (contained in i2c-gpio-expander, commit: c2c17bf)
    - OpenSTA (2.6.0)

This project was developed as the following:

0. Verification

Theses design can be verified utilizind the two testbenches provided in 📁design_data/testbench. These can run utilizing the source files contained in 📁design_data/src/pre_synthesis_files.


1. SV to Verilog Conversion

The source files of the chip's filter were developed in System Verilog language. \
To enable its synthesis, they were converted using sv2v open source tool that converted them to Yosys readable \
verilog files.

.. code-block:: language

   ./sv2v comb_comparator.sv comb_counter.sv filter_top.sv median_brute.sv > filter.v

The team also developed SDC, pad placment and power placment files that were necessary in the OpenRoad flow. \
Using the OpenRoad flow, the final GDS, SDC, netlist, SPEF and DEF files were generated. 

2. Creating the sealring

The sealring was created utilizing the sealring python script provided in the IHP-Open-PDK with the dimensions of 1370x1370
      

3. OpenRoad Flow Scripts utilization

The OpenRoad flow scripts utilized to synthesize this project was the one contained in the i2c-gpio-expander \
(https://github.com/aesc-silicon/i2c-gpio-expander). 

Utilizing the following structure we can run the flow:

```
  i2c_gpio_expander
   ┗ ...
   ┗ 📁martin
      ┗ 📁cfg
         ┗ ...
      ┗ 📁src
         ┗ filter.v
         ┗ shreg.v
         ┗ lfsr.v
         ┗ martin_top.v
   ┗ ...
```

The cfg folder is provided in this repository in 📁design_data/cfg. The src files are provided in 📁design_data/src/pre_synthesis_files.

To execute the flow the following code was added in the Makefile

.. code-block:: language

   martin-filler: KLAYOUT_HOME=${PDK_SG13G2_KLAYOUT_DIR}
   martin-filler: PDK_ROOT=./pdks/IHP-Open-PDK
   martin-filler: PDK=ihp-sg13g2

   martin-filler:
	klayout -n sg13g2 -zz -r ${KLAYOUT_HOME}/tech/scripts/filler.py \
		-rd output_file=${OPENROAD_FLOW_ROOT}/results/ihp-sg13g2/martin/base/6_final.gds \
		${OPENROAD_FLOW_ROOT}/results/ihp-sg13g2/martin/base/6_final.gds

   martin-gds:
      source ${OPENROAD_FLOW_ROOT}/../env.sh && make -C ${OPENROAD_FLOW_ROOT} DESIGN_CONFIG=[location]/i2c-gpio-expander/martin/cfg/config.mk

   martin-synth: martin-gds martin-filler


And then you can run:

.. code-block:: language

   podman exec --workdir=$PWD -it i2c-gpio-expander_container bash -c 'make martin-synth'


4. SDF generation

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

5. DRC checks

Klayout was utilized to visualization and to test the DRC of the design.

6. Verification

The final verification was made in Cadence Xcelium to ensure gate-level functionality of the chip. But an open source alternative can be ran utilizing Icarus Verilog and the filter_tb.v \
with the output netlist of the process. 

To execute the functional verification of the shift_register, it's necessary to edit the sg13g2_stdcell.v. The Iverilog simulator only executes functional verification and do not \
fully support specify blocks, so for the functional verification the following alteration is needed:


.. code-block:: verilog

   `timescale 1ns/10ps
   `celldefine
   module sg13g2_dfrbp_1 (Q, Q_N, D, RESET_B, CLK);
      output reg Q, Q_N;
      input D, RESET_B, CLK;
      reg notifier;
      wire delayed_D, delayed_RESET_B, delayed_CLK;

      // Function
      wire int_fwire_IQ, int_fwire_IQN, int_fwire_r;
      wire xcr_0;

      
      //Functional description
      always @(posedge CLK or negedge RESET_B) begin
         if(RESET_B == 1'b0) begin
            Q <= 1'b0;
         end else begin
            Q <= D;
            Q_N <= ~D;
         end
      end

   endmodule
   `endcelldefine


To prove the gate-level verification is working the .vcd file is provided in the 📁design_data/vcd folder.