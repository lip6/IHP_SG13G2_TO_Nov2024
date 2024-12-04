v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 930 -230 1730 170 {flags=graph

y2=0.2
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=6e-09
x2=1.26e-07
divx=5
subdivx=1

dataset=-1
unitx=1
logx=0
logy=0


y1=-0.2
rainbow=0

color="7 4"
node="v_out

v_in"}
B 2 930 -660 1730 -260 {flags=graph

y2=1.56
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=6e-09
x2=1.26e-07
divx=5
subdivx=1

dataset=-1
unitx=1
logx=0
logy=0


y1=0.26
rainbow=0



color="4 7"
node="en_n
en_p"}
N 350 -300 350 -260 {
lab=Vdd}
N 110 -590 110 -570 {
lab=GND}
N 350 -200 350 -150 {
lab=#net1}
N 350 -30 350 0 {
lab=GND}
N 470 -590 470 -570 {
lab=GND}
N 110 -400 110 -390 {
lab=GND}
N 540 -110 600 -110 {
lab=V_out}
N 600 -110 600 -90 {
lab=V_out}
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
N 160 -110 200 -110 {
lab=V_in}
N 160 -80 200 -80 {
lab=en_n}
N 160 -60 200 -60 {
lab=en_p}
N 600 -140 600 -110 {
lab=V_out}
N 540 -110 540 -90 {
lab=V_out}
N 500 -110 540 -110 {
lab=V_out}
C {devices/code_shown.sym} -330 -500 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt\\
.lib cornerRES.lib res_typ\\
"}
C {devices/code_shown.sym} -310 -370 0 0 {name=NGSPICE only_toplevel=true 
value="
.param temp=27
.control
save all 
tran 10p 120n
write tran_res_temp.raw
.endc
"}
C {devices/vsource.sym} 110 -620 0 0 {name=Vpow value=1.2}
C {devices/title.sym} -130 260 0 0 {name=l5 author="Copyright 2023 IHP PDK Authors"}
C {devices/launcher.sym} 1000 210 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/tran_res_temp.raw tran"
}
C {devices/gnd.sym} 350 0 0 0 {name=l2 lab=GND}
C {devices/ammeter.sym} 350 -230 0 0 {name=Vp}
C {devices/gnd.sym} 110 -570 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} 110 -430 0 0 {name=Vin value="dc=0 ac=1 sin(0, 200m, 20meg, 0, 0)"}
C {devices/vsource.sym} 470 -620 0 0 {name=Ven value="pulse(0 1.2 50n 1p 1p 50n 100n)"}
C {devices/gnd.sym} 470 -570 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 110 -390 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 110 -480 1 0 {name=p1 sig_type=std_logic lab=V_in}
C {devices/lab_pin.sym} 470 -660 1 0 {name=p2 sig_type=std_logic lab=en_p}
C {devices/lab_pin.sym} 600 -140 1 0 {name=p3 sig_type=std_logic lab=V_out}
C {devices/capa.sym} 600 -60 0 0 {name=C1
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 600 -30 0 0 {name=l6 lab=GND}
C {devices/lab_pin.sym} 110 -690 1 0 {name=p4 sig_type=std_logic lab=Vdd}
C {devices/vsource.sym} 470 -450 0 0 {name=Ven1 value="pulse(0 1.2 0 1p 1p 50n 100n)"}
C {devices/gnd.sym} 470 -400 0 0 {name=l7 lab=GND}
C {devices/lab_pin.sym} 470 -490 1 0 {name=p5 sig_type=std_logic lab=en_n}
C {devices/lab_pin.sym} 350 -300 1 0 {name=p6 sig_type=std_logic lab=Vdd}
C {transmission_gate.sym} 350 -90 0 0 {name=x1}
C {devices/lab_pin.sym} 160 -110 0 0 {name=p7 sig_type=std_logic lab=V_in}
C {devices/lab_pin.sym} 160 -60 0 0 {name=p8 sig_type=std_logic lab=en_p}
C {devices/lab_pin.sym} 160 -80 0 0 {name=p9 sig_type=std_logic lab=en_n}
C {devices/res.sym} 540 -60 0 0 {name=R1
value=100
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 540 -30 0 0 {name=l8 lab=GND}
