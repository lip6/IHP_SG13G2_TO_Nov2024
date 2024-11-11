v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -90 130 -90 150 {
lab=GND}
N -20 130 -20 150 {
lab=GND}
N 120 120 120 150 {
lab=GND}
N -20 60 -20 70 {
lab=en_p}
N 50 130 50 150 {
lab=GND}
N 50 60 50 70 {
lab=en_n}
N 250 70 290 70 {
lab=V_in}
N 250 100 290 100 {
lab=en_n}
N 250 120 290 120 {
lab=en_p}
N 690 40 690 70 {
lab=V_out}
N 590 70 690 70 {
lab=V_out}
N 690 70 690 90 {
lab=V_out}
N 120 60 120 70 {
lab=V_in}
N -90 60 -90 70 {
lab=Vdd}
N 440 150 440 160 {
lab=GND}
N 690 150 690 160 {
lab=GND}
N 440 20 440 30 {
lab=#net1}
N 440 -50 440 -40 {
lab=Vdd}
C {devices/code_shown.sym} 170 -390 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt\\
.lib cornerRES.lib res_typ\\
"}
C {devices/code_shown.sym} -220 -380 0 0 {name=NGSPICE only_toplevel=true 
value="
.param temp=27
.control
save all 
noise V(V_out) Vin dec 1001 10 10G
setplot noise1
set hcopydevtype=svg
set color0=white
set color1=black
set color2=red
set color3=blue
set color4=green
hardcopy noise1.svg onoise_spectrum  title 'Output noise spectrum' xlabel 'frequency' ylabel 'Vout' xlog
setplot noise2
print onoise_total
.endc
"}
C {devices/vsource.sym} -90 100 0 0 {name=Vpow value=1.2}
C {devices/title.sym} -130 260 0 0 {name=l5 author="Copyright 2023 IHP PDK Authors"}
C {devices/gnd.sym} 440 160 0 0 {name=l2 lab=GND}
C {devices/ammeter.sym} 440 -10 0 0 {name=Vp}
C {devices/gnd.sym} -90 150 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} 120 100 0 0 {name=Vin value="dc 0 ac 1 "}
C {devices/vsource.sym} -20 100 0 0 {name=Ven value=1.2
}
C {devices/gnd.sym} -20 150 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 120 150 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 120 60 1 0 {name=p1 sig_type=std_logic lab=V_in}
C {devices/lab_pin.sym} -20 60 1 0 {name=p2 sig_type=std_logic lab=en_p}
C {devices/lab_pin.sym} 690 40 1 0 {name=p3 sig_type=std_logic lab=V_out}
C {devices/lab_pin.sym} -90 60 1 0 {name=p4 sig_type=std_logic lab=Vdd}
C {devices/vsource.sym} 50 100 0 0 {name=Ven1 value=0}
C {devices/gnd.sym} 50 150 0 0 {name=l7 lab=GND}
C {devices/lab_pin.sym} 50 60 1 0 {name=p5 sig_type=std_logic lab=en_n}
C {devices/lab_pin.sym} 440 -50 1 0 {name=p6 sig_type=std_logic lab=Vdd}
C {transmission_gate.sym} 440 90 0 0 {name=x1}
C {devices/lab_pin.sym} 250 70 0 0 {name=p7 sig_type=std_logic lab=V_in}
C {devices/lab_pin.sym} 250 120 0 0 {name=p8 sig_type=std_logic lab=en_p}
C {devices/lab_pin.sym} 250 100 0 0 {name=p9 sig_type=std_logic lab=en_n}
C {devices/gnd.sym} 690 160 0 0 {name=l8 lab=GND}
C {devices/res.sym} 690 120 0 0 {name=R1
value=50
footprint=1206
device=resistor
m=1}
