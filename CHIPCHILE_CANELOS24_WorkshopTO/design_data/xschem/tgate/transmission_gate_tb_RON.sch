v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 930 -230 1730 170 {flags=graph

y2=1.2
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0.001
x2=1.2
divx=5
subdivx=1

dataset=-1
unitx=1
logx=0
logy=0


y1=-0.029
rainbow=0

color="6 9 8"
node="v_out1
v_out2
v_in"}
B 2 930 -660 1730 -260 {flags=graph

y2=1.3
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0.001
x2=1.2
divx=5
subdivx=1

dataset=-1
unitx=1
logx=0
logy=0


y1=0
rainbow=0



color="4 7"
node="en_n
en_p"}
B 2 1780 -230 2580 170 {flags=graph

y2=32
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0.001
x2=1.2
divx=5
subdivx=1

dataset=-1
unitx=1
logx=0
logy=0


y1=2.9
rainbow=0


color=9
node=ron}
N 110 -590 110 -570 {
lab=GND}
N 470 -590 470 -570 {
lab=GND}
N 110 -400 110 -390 {
lab=GND}
N 200 20 200 40 {
lab=V_out1}
N 110 -690 110 -650 {
lab=Vdd}
N 110 -480 110 -460 {
lab=V_in}
N 470 -660 470 -650 {
lab=en_p}
N 470 -420 470 -400 {
lab=GND}
N 470 -490 470 -480 {
lab=en_n}
N -240 20 -200 20 {
lab=V_in}
N -240 50 -200 50 {
lab=en_n}
N -240 70 -200 70 {
lab=en_p}
N 200 -10 200 20 {
lab=V_out1}
N 100 20 200 20 {
lab=V_out1}
N 430 50 470 50 {
lab=en_n}
N 430 70 470 70 {
lab=en_p}
N 310 20 470 20 {
lab=V_out2}
N 310 20 310 40 {
lab=V_out2}
N 310 100 310 110 {
lab=GND}
N 200 100 200 110 {
lab=GND}
N 310 0 310 20 {
lab=V_out2}
N 770 20 790 20 {
lab=V_in}
N -50 -100 -50 -90 {
lab=Vdd}
N -50 -30 -50 -20 {
lab=#net1}
N -50 100 -50 110 {
lab=GND}
N 620 100 620 110 {
lab=GND}
N 620 -30 620 -20 {
lab=#net2}
N 620 -100 620 -90 {
lab=Vdd}
C {devices/code_shown.sym} -320 -570 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt\\
.lib cornerRES.lib res_typ\\
"}
C {devices/code_shown.sym} -320 -460 0 0 {name=NGSPICE only_toplevel=true 
value="
.param temp=27
.param Iload=1m
.control
save all 
dc Vin 1m 1.2 1m
let Ron=(V(V_in)-V(V_out2))/0.001
write dc_RON.raw
set hcopydevtype=svg
set color0=white
set color1=black
set color2=red
set color3=blue
set color4=green
hardcopy Ron.svg Ron title 'ON resistance' xlabel 'Input voltage' ylabel 'Ron'
hardcopy Lin.svg V_in V_out1 V_out2 title 'Gate linearity' xlabel 'Input voltage' ylabel 'Outputs' ylimit 0 1.2
.endc
"}
C {devices/vsource.sym} 110 -620 0 0 {name=Vpow value=1.2}
C {devices/title.sym} -130 260 0 0 {name=l5 author="Copyright 2023 IHP PDK Authors"}
C {devices/launcher.sym} 1020 230 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/dc_RON.raw dc"
}
C {devices/gnd.sym} -50 110 0 0 {name=l2 lab=GND}
C {devices/ammeter.sym} -50 -60 0 0 {name=Vp}
C {devices/gnd.sym} 110 -570 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} 110 -430 0 0 {name=Vin value=0.8}
C {devices/vsource.sym} 470 -620 0 0 {name=Ven value=1.2}
C {devices/gnd.sym} 470 -570 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 110 -390 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 110 -480 1 0 {name=p1 sig_type=std_logic lab=V_in}
C {devices/lab_pin.sym} 470 -660 1 0 {name=p2 sig_type=std_logic lab=en_p}
C {devices/lab_pin.sym} 200 -10 1 0 {name=p3 sig_type=std_logic lab=V_out1}
C {devices/lab_pin.sym} 110 -690 1 0 {name=p4 sig_type=std_logic lab=Vdd}
C {devices/vsource.sym} 470 -450 0 0 {name=Ven1 value=0}
C {devices/gnd.sym} 470 -400 0 0 {name=l7 lab=GND}
C {devices/lab_pin.sym} 470 -490 1 0 {name=p5 sig_type=std_logic lab=en_n}
C {devices/lab_pin.sym} -50 -100 1 0 {name=p6 sig_type=std_logic lab=Vdd}
C {transmission_gate.sym} -50 40 0 0 {name=x1}
C {devices/lab_pin.sym} -240 20 0 0 {name=p7 sig_type=std_logic lab=V_in}
C {devices/lab_pin.sym} -240 70 0 0 {name=p8 sig_type=std_logic lab=en_p}
C {devices/lab_pin.sym} -240 50 0 0 {name=p9 sig_type=std_logic lab=en_n}
C {devices/isource.sym} 200 70 0 0 {name=I0 value=\{Iload\}}
C {devices/gnd.sym} 200 110 0 0 {name=l6 lab=GND}
C {devices/gnd.sym} 620 110 0 0 {name=l8 lab=GND}
C {devices/ammeter.sym} 620 -60 0 0 {name=Vp1}
C {devices/lab_pin.sym} 620 -100 1 0 {name=p11 sig_type=std_logic lab=Vdd}
C {transmission_gate.sym} 620 40 0 0 {name=x2}
C {devices/lab_pin.sym} 430 70 0 0 {name=p13 sig_type=std_logic lab=en_p}
C {devices/lab_pin.sym} 430 50 0 0 {name=p14 sig_type=std_logic lab=en_n}
C {devices/isource.sym} 310 70 0 0 {name=I1 value=\{Iload\}}
C {devices/gnd.sym} 310 110 0 0 {name=l10 lab=GND}
C {devices/lab_pin.sym} 310 0 1 0 {name=p12 sig_type=std_logic lab=V_out2}
C {devices/lab_pin.sym} 790 20 2 0 {name=p10 sig_type=std_logic lab=V_in}
