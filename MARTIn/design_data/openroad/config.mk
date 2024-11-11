export DESIGN_NICKNAME = martin
export DESIGN_NAME = martin_top
export PLATFORM    = ihp-sg13g2



export VERILOG_FILES = ./../src/filter.v \
			           ./../src/shreg.v \
					   ./../src/lfsr.v \
		               ./../src/chip_top.v
export SDC_FILE      = ./constraint.sdc
export FOOTPRINT_TCL = ./pad.tcl

export SEAL_GDS = ./macros/sealring.gds


export DIE_AREA = 0.0 0.0 1370.0 1370.0
export CORE_AREA = 390.0 390.0 980.0 980.0

export TNS_END_PERCENT = 100
export PDN_TCL = ./pdn.tcl

export USE_FILL = 1



