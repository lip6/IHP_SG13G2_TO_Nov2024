v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 1270 -550 2070 -150 {flags=graph

y2=1.2e-06
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=-40
x2=125
divx=5
subdivx=1

dataset=-1
unitx=1
logx=0
logy=0


y1=4.7e-10
rainbow=0


color="7 6"
node="i(vp2)
i(vp1)"}
B 2 1270 -130 2070 270 {flags=graph

y2=2.8e-09
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=-40
x2=125
divx=5
subdivx=1

dataset=-1
unitx=1
logx=0
logy=0


y1=1.1e-09
rainbow=0


color=9
node=i(vp5)}
T {Inverted signals!} 550 90 0 0 0.4 0.4 {}
N 730 -400 730 -380 {
lab=GND}
N 60 100 60 130 {
lab=GND}
N 1090 -400 1090 -380 {
lab=GND}
N 730 -210 730 -200 {
lab=GND}
N 730 -500 730 -460 {
lab=Vdd}
N 730 -290 730 -270 {
lab=V_in}
N 1090 -470 1090 -460 {
lab=en_p}
N 1090 -230 1090 -210 {
lab=GND}
N 1090 -300 1090 -290 {
lab=en_n}
N -130 50 -90 50 {
lab=en_n}
N -130 70 -90 70 {
lab=en_p}
N 310 20 310 40 {
lab=V_out1}
N 310 100 310 110 {
lab=GND}
N 290 20 310 20 {
lab=V_out1}
N 310 -10 310 20 {
lab=V_out1}
N 210 20 230 20 {
lab=#net1}
N -150 20 -90 20 {
lab=#net2}
N -240 20 -210 20 {
lab=V_in}
N 60 -30 60 -20 {
lab=#net3}
N 60 -100 60 -90 {
lab=Vdd}
N 850 100 850 130 {
lab=GND}
N 660 50 700 50 {
lab=en_p}
N 660 70 700 70 {
lab=en_n}
N 1100 -10 1100 20 {
lab=V_out1}
N 640 20 700 20 {
lab=#net4}
N 850 -30 850 -20 {
lab=#net5}
N 850 -100 850 -90 {
lab=Vdd}
N 1000 20 1100 20 {
lab=V_out1}
N 470 100 470 110 {
lab=GND}
N 470 20 470 40 {
lab=#net6}
N 470 20 580 20 {
lab=#net6}
C {devices/code_shown.sym} -260 -550 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt\\
.lib cornerRES.lib res_typ\\
"}
C {devices/code_shown.sym} -260 -430 0 0 {name=NGSPICE only_toplevel=true 
value="
.param temp=27
.control
save all 
dc temp -40 125 1
write op_Ileak_temp.raw
set hcopydevtype=svg
set color0=white
set color1=black
set color2=red
set color3=blue
set color4=green
hardcopy Ileakoff_temp.svg I(vp1) I(vp2) title 'Off state leakage currents vs temperature' xlabel 'Temperature' ylabel 'Current'
hardcopy Ileakon_temp.svg I(vp5) title 'On state leakage current vs temperature' xlabel 'Temperature' ylabel 'Current'
.endc
"}
C {devices/vsource.sym} 730 -430 0 0 {name=Vpow value=1.2}
C {devices/title.sym} -130 260 0 0 {name=l5 author="Copyright 2023 IHP PDK Authors"}
C {devices/launcher.sym} 1040 240 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/op_Ileak_temp.raw dc"
}
C {devices/gnd.sym} 60 130 0 0 {name=l2 lab=GND}
C {devices/ammeter.sym} 60 -60 0 0 {name=Vp}
C {devices/gnd.sym} 730 -380 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} 730 -240 0 0 {name=Vin value=0}
C {devices/vsource.sym} 1090 -430 0 0 {name=Ven value=0}
C {devices/gnd.sym} 1090 -380 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 730 -200 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 730 -290 1 0 {name=p1 sig_type=std_logic lab=V_in}
C {devices/lab_pin.sym} 1090 -470 1 0 {name=p2 sig_type=std_logic lab=en_p}
C {devices/lab_pin.sym} 310 -10 1 0 {name=p3 sig_type=std_logic lab=V_out1}
C {devices/lab_pin.sym} 730 -500 1 0 {name=p4 sig_type=std_logic lab=Vdd}
C {devices/vsource.sym} 1090 -260 0 0 {name=Ven1 value=1.2}
C {devices/gnd.sym} 1090 -210 0 0 {name=l7 lab=GND}
C {devices/lab_pin.sym} 1090 -300 1 0 {name=p5 sig_type=std_logic lab=en_n}
C {devices/lab_pin.sym} 60 -100 1 0 {name=p6 sig_type=std_logic lab=Vdd}
C {transmission_gate.sym} 60 40 0 0 {name=x1}
C {devices/lab_pin.sym} -240 20 0 0 {name=p7 sig_type=std_logic lab=V_in}
C {devices/lab_pin.sym} -130 70 0 0 {name=p8 sig_type=std_logic lab=en_p}
C {devices/lab_pin.sym} -130 50 0 0 {name=p9 sig_type=std_logic lab=en_n}
C {devices/gnd.sym} 310 110 0 0 {name=l6 lab=GND}
C {devices/vsource.sym} 310 70 0 0 {name=Vout value=1.2}
C {devices/ammeter.sym} 260 20 1 0 {name=Vp1}
C {devices/ammeter.sym} -180 20 1 0 {name=Vp2}
C {devices/gnd.sym} 850 130 0 0 {name=l8 lab=GND}
C {devices/ammeter.sym} 850 -60 0 0 {name=Vp3}
C {devices/lab_pin.sym} 1100 -10 1 0 {name=p10 sig_type=std_logic lab=V_out1}
C {devices/lab_pin.sym} 850 -100 1 0 {name=p11 sig_type=std_logic lab=Vdd}
C {transmission_gate.sym} 850 40 0 0 {name=x2}
C {devices/lab_pin.sym} 660 50 0 0 {name=p13 sig_type=std_logic lab=en_p}
C {devices/lab_pin.sym} 660 70 0 0 {name=p14 sig_type=std_logic lab=en_n}
C {devices/ammeter.sym} 610 20 3 0 {name=Vp5}
C {devices/vsource.sym} 470 70 0 0 {name=Vin1 value=1.2}
C {devices/gnd.sym} 470 110 0 0 {name=l9 lab=GND}
