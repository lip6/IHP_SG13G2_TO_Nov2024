v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 1780 -230 2580 170 {flags=graph

y2=13
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


y1=10
rainbow=0


color=9
node=ron}
N 110 -590 110 -570 {
lab=GND}
N 60 100 60 130 {
lab=GND}
N 470 -590 470 -570 {
lab=GND}
N 110 -400 110 -390 {
lab=GND}
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
op
echo Off state leakage currents
echo output current 
print I(Vp1) 
echo input current
print I(Vp2)
echo On state leakage current
print I(Vp5)  
write op_Ileak.raw
.endc
"}
C {devices/vsource.sym} 110 -620 0 0 {name=Vpow value=1.2}
C {devices/title.sym} -130 260 0 0 {name=l5 author="Copyright 2023 IHP PDK Authors"}
C {devices/launcher.sym} 1020 230 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/dc_RON_temp.raw dc"
}
C {devices/gnd.sym} 60 130 0 0 {name=l2 lab=GND}
C {devices/ammeter.sym} 60 -60 0 0 {name=Vp}
C {devices/gnd.sym} 110 -570 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} 110 -430 0 0 {name=Vin value=0}
C {devices/vsource.sym} 470 -620 0 0 {name=Ven value=0}
C {devices/gnd.sym} 470 -570 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 110 -390 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 110 -480 1 0 {name=p1 sig_type=std_logic lab=V_in}
C {devices/lab_pin.sym} 470 -660 1 0 {name=p2 sig_type=std_logic lab=en_p}
C {devices/lab_pin.sym} 310 -10 1 0 {name=p3 sig_type=std_logic lab=V_out1}
C {devices/lab_pin.sym} 110 -690 1 0 {name=p4 sig_type=std_logic lab=Vdd}
C {devices/vsource.sym} 470 -450 0 0 {name=Ven1 value=1.2}
C {devices/gnd.sym} 470 -400 0 0 {name=l7 lab=GND}
C {devices/lab_pin.sym} 470 -490 1 0 {name=p5 sig_type=std_logic lab=en_n}
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
