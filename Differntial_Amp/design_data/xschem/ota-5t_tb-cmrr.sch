v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 0 -160 0 -140 {lab=GND}
N -160 160 -160 200 {lab=GND}
N -160 10 -160 100 {lab=#net1}
N -160 10 -80 10 {lab=#net1}
N 10 10 40 10 {lab=#net2}
N 10 10 10 140 {lab=#net2}
N -20 10 10 10 {lab=#net2}
N 10 140 100 140 {lab=#net2}
N 160 140 260 140 {lab=ac}
N 260 -20 260 140 {lab=ac}
N 220 -20 260 -20 {lab=ac}
N 260 -20 300 -20 {lab=ac}
N 0 -230 0 -220 {lab=#net3}
N 0 -290 40 -290 {lab=#net3}
N -160 -50 -160 10 {lab=#net1}
N -160 -350 40 -350 {lab=#net1}
N 260 -320 300 -320 {lab=ad}
N 0 -230 60 -230 {lab=#net3}
N 0 -290 0 -230 {lab=#net3}
N 60 -230 60 -180 {lab=#net3}
N 60 -180 100 -180 {lab=#net3}
N 160 -180 260 -180 {lab=ad}
N 260 -320 260 -180 {lab=ad}
N 220 -320 260 -320 {lab=ad}
N -240 160 -240 200 {lab=GND}
N -240 80 -240 100 {lab=#net4}
N -240 -440 120 -440 {lab=#net4}
N 120 -440 120 -400 {lab=#net4}
N 160 -240 160 -210 {lab=#net4}
N -240 -210 160 -210 {lab=#net4}
N -240 -440 -240 -210 {lab=#net4}
N 160 60 160 80 {lab=#net4}
N -240 80 160 80 {lab=#net4}
N -240 -110 -240 80 {lab=#net4}
N 120 -110 120 -100 {lab=#net4}
N -240 -110 120 -110 {lab=#net4}
N -240 -210 -240 -110 {lab=#net4}
N 80 70 80 200 {lab=GND}
N 80 70 120 70 {lab=GND}
N 120 60 120 70 {lab=GND}
N 80 -230 80 -150 {lab=GND}
N 80 -230 120 -230 {lab=GND}
N 120 -240 120 -230 {lab=GND}
N 120 -110 150 -110 {lab=#net4}
N 150 -150 150 -110 {lab=#net4}
N 150 -150 180 -150 {lab=#net4}
N 240 -150 240 -110 {lab=#net5}
N 160 -110 240 -110 {lab=#net5}
N 160 -110 160 -100 {lab=#net5}
N 160 -440 160 -400 {lab=#net6}
N 120 -520 120 -440 {lab=#net4}
N 120 -520 160 -520 {lab=#net4}
N 160 -520 160 -500 {lab=#net4}
N -160 -50 40 -50 {lab=#net1}
N -160 -350 -160 -50 {lab=#net1}
C {/home/aidas93/Downloads/TO_Nov2024-main/Differntial_Amp/design_data/xschem/ota.sym} 120 -20 0 0 {name=x1}
C {vsource.sym} -160 130 0 0 {name=V1 value="dc 1.65 ac 1" savecurrent=false}
C {/home/aidas93/Downloads/TO_Nov2024-main/Differntial_Amp/design_data/xschem/ota.sym} 120 -320 0 0 {name=x2}
C {res.sym} 130 140 1 0 {name=R1
value=1G
footprint=1206
device=resistor
m=1}
C {res.sym} 130 -180 1 0 {name=R2
value=1G
footprint=1206
device=resistor
m=1}
C {capa.sym} 0 -190 0 0 {name=C1
m=1
value=10u
footprint=1206
device="ceramic capacitor"}
C {capa.sym} -50 10 3 1 {name=C2
m=1
value=10u
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} -160 200 0 0 {name=l1 lab=GND}
C {gnd.sym} 0 -140 0 0 {name=l2 lab=GND}
C {vsource.sym} -240 130 0 0 {name=Venable value=3.3 savecurrent=false}
C {gnd.sym} -240 200 0 0 {name=l3 lab=GND}
C {gnd.sym} 80 200 0 0 {name=l4 lab=GND}
C {gnd.sym} 80 -150 0 0 {name=l5 lab=GND}
C {isource.sym} 160 -470 0 0 {name=I0 value=20u}
C {isource.sym} 210 -150 3 1 {name=I1 value=20u}
C {devices/code_shown.sym} 470 -430 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value=".lib cornerMOShv.lib mos_tt
"}
C {devices/code_shown.sym} 840 50 2 0 {name=NGSPICE only_toplevel=true 
value="
.temp 27
.control
option sparse
save all
op
write ota-5t_tb-CMRR.raw
set appendwrite

ac dec 101 1k 200MEG
write ota-5t_tb-CMRR.raw

let CMRR = ad/ac
plot 20*log10(CMRR)
print 20*log10(CMRR)


.endc
"}
C {lab_wire.sym} 290 -320 0 0 {name=p3 sig_type=std_logic lab=ad}
C {lab_wire.sym} 290 -20 0 0 {name=p4 sig_type=std_logic lab=ac}
