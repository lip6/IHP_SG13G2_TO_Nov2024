v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 930 -230 1730 170 {flags=graph

y2=1.4
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1.5e-07
divx=5
subdivx=1

dataset=-1
unitx=1
logx=0
logy=0


y1=0
rainbow=0

color="7 4"
node="v_out

v_in"}
B 2 930 -650 1730 -250 {flags=graph

y2=1.3
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1.5e-07
divx=5
subdivx=1

dataset=-1
unitx=1
logx=0
logy=0


y1=0
rainbow=0



color="8 9"
node="en_p
v_out"
hilight_wave=0}
N 370 -510 370 -490 {
lab=GND}
N 730 -510 730 -490 {
lab=GND}
N 370 -320 370 -310 {
lab=GND}
N 690 120 750 120 {
lab=V_out}
N 750 120 750 140 {
lab=V_out}
N 370 -610 370 -570 {
lab=Vdd}
N 370 -400 370 -380 {
lab=V_in}
N 730 -580 730 -570 {
lab=en_p}
N 730 -340 730 -320 {
lab=GND}
N 730 -410 730 -400 {
lab=en_n}
N 310 120 350 120 {
lab=V_in}
N 310 150 350 150 {
lab=en_n}
N 310 170 350 170 {
lab=en_p}
N 750 90 750 120 {
lab=V_out}
N 690 120 690 140 {
lab=V_out}
N 650 120 690 120 {
lab=V_out}
N 500 200 500 210 {
lab=GND}
N 500 70 500 80 {
lab=#net1}
N 500 0 500 10 {
lab=Vdd}
C {devices/code_shown.sym} -380 -580 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt\\
.lib cornerRES.lib res_typ\\
"}
C {devices/code_shown.sym} -400 -390 0 0 {name=NGSPICE only_toplevel=true 
value="
.param temp=27
.control
save all 
tran 10p 150n
meas tran turn-On TRIG v(en_p) VAL=0.6 RISE=1 TARG v(v_out) VAL=1.1 RISE=1
meas tran turn-OFF TRIG v(en_p) VAL=0.6 FALL=1 TARG v(v_out) VAL=0.1 FALL=1
write tran_ton-off.raw
set hcopydevtype=svg
set color0=white
set color1=black
set color2=red
set color3=blue
set color4=green
hardcopy turn-on-off1.svg en_p v_out title 'Turn On/Off time' xlabel 'time' ylabel 'voltage'
hardcopy turn-on-off2.svg v_in v_out title 'Turn On/Off time' xlabel 'time' ylabel 'voltage'

.endc
"}
C {devices/vsource.sym} 370 -540 0 0 {name=Vpow value=1.2}
C {devices/title.sym} -130 260 0 0 {name=l5 author="Copyright 2023 IHP PDK Authors"}
C {devices/launcher.sym} 1000 210 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/tran_ton-off.raw tran"
}
C {devices/gnd.sym} 500 210 0 0 {name=l2 lab=GND}
C {devices/ammeter.sym} 500 40 0 0 {name=Vp}
C {devices/gnd.sym} 370 -490 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} 370 -350 0 0 {name=Vin value="dc=0 ac=1 pulse(0 1.2 25n 1p 1p 105n 110n)"}
C {devices/vsource.sym} 730 -540 0 0 {name=Ven value="pulse(0 1.2 50n 1p 1p 50n 100n)"}
C {devices/gnd.sym} 730 -490 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 370 -310 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 370 -400 1 0 {name=p1 sig_type=std_logic lab=V_in}
C {devices/lab_pin.sym} 730 -580 1 0 {name=p2 sig_type=std_logic lab=en_p}
C {devices/lab_pin.sym} 750 90 1 0 {name=p3 sig_type=std_logic lab=V_out}
C {devices/capa.sym} 750 170 0 0 {name=C1
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 750 200 0 0 {name=l6 lab=GND}
C {devices/lab_pin.sym} 370 -610 1 0 {name=p4 sig_type=std_logic lab=Vdd}
C {devices/vsource.sym} 730 -370 0 0 {name=Ven1 value="pulse(0 1.2 0 1p 1p 50n 100n)"}
C {devices/gnd.sym} 730 -320 0 0 {name=l7 lab=GND}
C {devices/lab_pin.sym} 730 -410 1 0 {name=p5 sig_type=std_logic lab=en_n}
C {devices/lab_pin.sym} 500 0 1 0 {name=p6 sig_type=std_logic lab=Vdd}
C {transmission_gate.sym} 500 140 0 0 {name=x1}
C {devices/lab_pin.sym} 310 120 0 0 {name=p7 sig_type=std_logic lab=V_in}
C {devices/lab_pin.sym} 310 170 0 0 {name=p8 sig_type=std_logic lab=en_p}
C {devices/lab_pin.sym} 310 150 0 0 {name=p9 sig_type=std_logic lab=en_n}
C {devices/res.sym} 690 170 0 0 {name=R1
value=10k
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 690 200 0 0 {name=l8 lab=GND}
