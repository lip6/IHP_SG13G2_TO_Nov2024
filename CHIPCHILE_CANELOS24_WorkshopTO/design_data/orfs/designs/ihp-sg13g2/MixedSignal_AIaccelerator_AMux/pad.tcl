# Based on https://github.com/IHP-GmbH/IHP-Open-DesignLib/blob/c8f9135780226fb7c731c70147ae194e55a523a3/ElemRV/design_data/src/pad.tcl

set IO_LENGTH 180
set IO_WIDTH 80
set BONDPAD_SIZE 70
set SEALRING_OFFSET 70
set MAX_NUM_PADS_HORIZONTAL 7
set MAX_NUM_PADS_VERTICAL 7

proc calc_horizontal_pad_location {index} {
    global IO_LENGTH
    global IO_WIDTH
    global BONDPAD_SIZE
    global MAX_NUM_PADS_HORIZONTAL
    global SEALRING_OFFSET

    set DIE_WIDTH [expr {[lindex $::env(DIE_AREA) 2] - [lindex $::env(DIE_AREA) 0]}]
    set PAD_OFFSET [expr {$IO_LENGTH + $BONDPAD_SIZE + $SEALRING_OFFSET}]
    set PAD_AREA_WIDTH [expr {$DIE_WIDTH - ($PAD_OFFSET * 2)}]
    set HORIZONTAL_PAD_DISTANCE [expr {($PAD_AREA_WIDTH / $MAX_NUM_PADS_HORIZONTAL) - $IO_WIDTH}]

    return [expr {$PAD_OFFSET + (($IO_WIDTH + $HORIZONTAL_PAD_DISTANCE) * $index) + ($HORIZONTAL_PAD_DISTANCE / 2)}]
}

proc calc_vertical_pad_location {index} {
    global IO_LENGTH
    global IO_WIDTH
    global BONDPAD_SIZE
    global MAX_NUM_PADS_VERTICAL
    global SEALRING_OFFSET

    set DIE_HEIGHT [expr {[lindex $::env(DIE_AREA) 3] - [lindex $::env(DIE_AREA) 1]}]
    set PAD_OFFSET [expr {$IO_LENGTH + $BONDPAD_SIZE + $SEALRING_OFFSET}]
    set PAD_AREA_HEIGHT [expr {$DIE_HEIGHT - ($PAD_OFFSET * 2)}]
    set VERTICAL_PAD_DISTANCE [expr {($PAD_AREA_HEIGHT / $MAX_NUM_PADS_VERTICAL) - $IO_WIDTH}]

    return [expr {$PAD_OFFSET + (($IO_WIDTH + $VERTICAL_PAD_DISTANCE) * $index) + ($VERTICAL_PAD_DISTANCE / 2)}]
}

#set_io_pin_constraint -pin_names {chip_internal[0] chip_internal[1] chip_internal[2] chip_internal[3] chip_internal[4] chip_internal[5] chip_internal[6] chip_internal[7]} -region top:*
place_pin -pin_name chip_internal[0] -layer Metal5 -location {450 738}
place_pin -pin_name chip_internal[1] -layer Metal5 -location {460 738}
place_pin -pin_name chip_internal[2] -layer Metal5 -location {470 738}
place_pin -pin_name chip_internal[3] -layer Metal5 -location {480 738}
place_pin -pin_name chip_internal[4] -layer Metal5 -location {500 738}
place_pin -pin_name chip_internal[5] -layer Metal5 -location {510 738}
place_pin -pin_name chip_internal[6] -layer Metal5 -location {520 738}
place_pin -pin_name chip_internal[7] -layer Metal5 -location {530 738}

place_pin -pin_name chip_internal[8] -layer Metal5 -location {540 738}
place_pin -pin_name chip_internal[9] -layer Metal5 -location {550 738}
place_pin -pin_name chip_internal[10] -layer Metal5 -location {560 738}
place_pin -pin_name chip_internal[11] -layer Metal5 -location {570 738}
place_pin -pin_name chip_internal[12] -layer Metal5 -location {580 738}
place_pin -pin_name chip_internal[13] -layer Metal5 -location {590 738}
place_pin -pin_name chip_internal[14] -layer Metal5 -location {600 738}
place_pin -pin_name chip_internal[15] -layer Metal5 -location {610 738}

make_fake_io_site -name IOLibSite -width 1 -height $IO_LENGTH
make_fake_io_site -name IOLibCSite -width $IO_LENGTH -height $IO_LENGTH

set IO_OFFSET [expr {$BONDPAD_SIZE + $SEALRING_OFFSET}]
# Create IO Rows
make_io_sites \
    -horizontal_site IOLibSite \
    -vertical_site IOLibSite \
    -corner_site IOLibCSite \
    -offset $IO_OFFSET

# Place Pads
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location  0] {sg13g2_chip_in_0}
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location  1] {sg13g2_chip_in_1} 
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location  2] {sg13g2_IOPadIOVss_1} -master sg13g2_IOPadIOVss
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location  3] {sg13g2_IOPadIOVdd_1} -master sg13g2_IOPadIOVdd
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location  4] {sg13g2_chip_in_2}
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location  5] {sg13g2_chip_in_3} 
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location  6] {sg13g2_chip_in_4}

place_pad -row IO_EAST -location [calc_vertical_pad_location  0] {sg13g2_chip_in_5}
place_pad -row IO_EAST -location [calc_vertical_pad_location  1] {sg13g2_chip_in_6}
place_pad -row IO_EAST -location [calc_vertical_pad_location  2] {sg13g2_chip_in_7} 
place_pad -row IO_EAST -location [calc_vertical_pad_location  3] {sg13g2_IOPadVss_1} -master sg13g2_IOPadVss
place_pad -row IO_EAST -location [calc_vertical_pad_location  4] {sg13g2_chip_analog_0} 
place_pad -row IO_EAST -location [calc_vertical_pad_location  5] {sg13g2_chip_analog_1}
place_pad -row IO_EAST -location [calc_vertical_pad_location  6] {sg13g2_chip_analog_2}

place_pad -row IO_NORTH -location [calc_horizontal_pad_location  0] {sg13g2_chip_analog_3}
place_pad -row IO_NORTH -location [calc_horizontal_pad_location  1] {sg13g2_chip_analog_4}
place_pad -row IO_NORTH -location [calc_horizontal_pad_location  2] {sg13g2_chip_analog_5}
place_pad -row IO_NORTH -location [calc_horizontal_pad_location  3] {sg13g2_chip_analog_6}
place_pad -row IO_NORTH -location [calc_horizontal_pad_location  4] {sg13g2_chip_analog_7}
place_pad -row IO_NORTH -location [calc_horizontal_pad_location  5] {sg13g2_chip_analog_8}
place_pad -row IO_NORTH -location [calc_horizontal_pad_location  6] {sg13g2_chip_analog_9} 

place_pad -row IO_WEST -location [calc_vertical_pad_location  0] {sg13g2_IOPadVdd_1} -master sg13g2_IOPadVdd 
place_pad -row IO_WEST -location [calc_vertical_pad_location  1] {sg13g2_chip_out_0}
place_pad -row IO_WEST -location [calc_vertical_pad_location  2] {sg13g2_rst_n} 
place_pad -row IO_WEST -location [calc_vertical_pad_location  3] {sg13g2_clk} 
place_pad -row IO_WEST -location [calc_vertical_pad_location  4] {sg13g2_chip_analog_10}
place_pad -row IO_WEST -location [calc_vertical_pad_location  5] {sg13g2_chip_analog_11}
place_pad -row IO_WEST -location [calc_vertical_pad_location  6] {sg13g2_chip_analog_12}


# Place Corner Cells and Filler
place_corners sg13g2_Corner

set iofill {
    sg13g2_Filler10000
    sg13g2_Filler4000
    sg13g2_Filler2000
    sg13g2_Filler1000
    sg13g2_Filler400
    sg13g2_Filler200
}

place_io_fill -row IO_NORTH {*}$iofill
place_io_fill -row IO_SOUTH {*}$iofill
place_io_fill -row IO_WEST {*}$iofill
place_io_fill -row IO_EAST {*}$iofill

connect_by_abutment

place_bondpad -bond bondpad_70x70 sg13g2_* -offset {5.0 -70.0}

remove_io_rows
