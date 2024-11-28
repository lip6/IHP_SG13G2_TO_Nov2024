v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 930 -230 1730 170 {flags=graph

y2=0.98
ypos1=0
ypos2=2
divy=5
subdivy=4
unity=1
x1=7
x2=10
divx=5
subdivx=8

dataset=-1
unitx=1
logx=1
logy=0


y1=0.7
rainbow=0

color=7
node=s_2_1}
B 2 920 -650 1720 -250 {flags=graph

y2=0.59
ypos1=0
ypos2=2
divy=5
subdivy=4
unity=1
x1=7
x2=10
divx=5
subdivx=8

dataset=-1
unitx=1
logx=1
logy=0


y1=0.028
rainbow=0

color=7
node=s_1_1}
N -200 100 -200 120 {
lab=GND}
N 390 100 390 130 {
lab=GND}
N -140 100 -140 120 {
lab=GND}
N -200 0 -200 40 {
lab=Vdd}
N -140 30 -140 40 {
lab=en_p}
N -80 100 -80 120 {
lab=GND}
N -80 30 -80 40 {
lab=en_n}
N 200 50 240 50 {
lab=en_n}
N 200 70 240 70 {
lab=en_p}
N 540 20 640 20 {
lab=#net1}
N 640 20 640 40 {
lab=#net1}
N -20 20 240 20 {
lab=#net2}
N -20 20 -20 40 {
lab=#net2}
N 640 100 640 130 {
lab=GND}
N 390 -110 390 -90 {
lab=Vdd}
N 390 -30 390 -20 {
lab=#net3}
N -20 100 -20 120 {
lab=GND}
C {devices/code_shown.sym} 280 -520 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt\\
.lib cornerRES.lib res_typ\\
"}
C {devices/code_shown.sym} -230 -520 0 0 {name=NGSPICE only_toplevel=true 
value="
.param temp=27
.options noacct
.control
save all 
sp dec 101 10Meg 10G 0
meas ac s21 FIND s_2_1 AT=100MEG
let dbs21=0.707*s21
meas ac freq_at when s_2_1=dbs21
write offisolation.raw
set hcopydevtype=svg
set color0=white
set color1=black
set color2=red
set color3=blue
set color4=green
hardcopy Bandwidth.svg s_2_1  title 'Transfer function' xlabel 'frequency' ylabel 'S_21' xlog

.endc
"}
C {devices/vsource.sym} -200 70 0 0 {name=Vpow value=1.2}
C {devices/title.sym} -130 260 0 0 {name=l5 author="Copyright 2023 IHP PDK Authors"}
C {devices/launcher.sym} 1000 220 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/offisolation.raw ac"
}
C {devices/gnd.sym} 390 130 0 0 {name=l2 lab=GND}
C {devices/ammeter.sym} 390 -60 0 0 {name=Vp}
C {devices/gnd.sym} -200 120 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} -140 70 0 0 {name=Ven value=1.2
}
C {devices/gnd.sym} -140 120 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} -140 30 1 0 {name=p2 sig_type=std_logic lab=en_p}
C {devices/lab_pin.sym} -200 0 1 0 {name=p4 sig_type=std_logic lab=Vdd}
C {devices/vsource.sym} -80 70 0 0 {name=Ven1 value=0}
C {devices/gnd.sym} -80 120 0 0 {name=l7 lab=GND}
C {devices/lab_pin.sym} -80 30 1 0 {name=p5 sig_type=std_logic lab=en_n}
C {devices/lab_pin.sym} 390 -110 1 0 {name=p6 sig_type=std_logic lab=Vdd}
C {transmission_gate.sym} 390 40 0 0 {name=x1}
C {devices/lab_pin.sym} 200 70 0 0 {name=p8 sig_type=std_logic lab=en_p}
C {devices/lab_pin.sym} 200 50 0 0 {name=p9 sig_type=std_logic lab=en_n}
C {devices/gnd.sym} 640 130 0 0 {name=l8 lab=GND}
C {devices/vsource.sym} -20 70 0 0 {name=V1 value="dc 0 ac 1 portnum 1 z0 50"}
C {devices/vsource.sym} 640 70 0 0 {name=V2 value="dc 0 ac 0 portnum 2 z0 50"}
C {devices/gnd.sym} -20 120 0 0 {name=l6 lab=GND}
