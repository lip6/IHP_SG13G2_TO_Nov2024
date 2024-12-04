v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 30 70 140 70 {
lab=inout_2}
N 30 -80 140 -80 {
lab=inout_2}
N 140 0 140 70 {
lab=inout_2}
N 140 0 180 0 {
lab=inout_2}
N 140 -80 140 0 {
lab=inout_2}
N -100 -80 -30 -80 {
lab=inout_1}
N -100 70 -30 70 {
lab=inout_1}
N -100 -0 -100 70 {
lab=inout_1}
N -0 110 0 140 {
lab=en_p}
N 0 -150 -0 -120 {
lab=en_n}
N 0 40 0 70 {
lab=#net1}
N 0 40 70 40 {
lab=#net1}
N 0 -50 70 -50 {
lab=#net2}
N 0 -80 0 -50 {
lab=#net2}
N -150 -0 -100 -0 {
lab=inout_1}
N -100 -80 -100 -0 {
lab=inout_1}
N -150 -150 0 -150 {
lab=en_n}
N -150 140 -0 140 {
lab=en_p}
N 70 -140 70 -50 {
lab=#net2}
N 70 -300 70 -200 {
lab=vdd}
N 70 40 70 130 {
lab=#net1}
N 70 190 70 260 {
lab=vss}
C {devices/iopin.sym} -150 0 2 0 {name=p1 lab=inout_1
}
C {devices/iopin.sym} 180 0 0 0 {name=p6 lab=inout_2

}
C {devices/ipin.sym} -150 140 0 0 {name=p2 lab=en_p}
C {devices/iopin.sym} 70 -300 3 0 {name=p3 lab=vdd
}
C {devices/iopin.sym} 70 260 1 0 {name=p4 lab=vss
}
C {sg13g2_pr/sg13_lv_nmos.sym} 0 90 3 0 {name=M1
l=0.130u
w=200.0u
ng=20
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 0 -100 1 0 {name=M2
l=0.130u
w=200.0u
ng=20
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {devices/ipin.sym} -150 -150 0 0 {name=p5 lab=en_n}
C {sg13g2_pr/ntap1.sym} 70 -170 0 0 {name=R1
model=ntap1
spiceprefix=X
R=262.847.0
Imax=0.3e-6
}
C {sg13g2_pr/ptap1.sym} 70 160 2 0 {name=R2
model=ptap1
spiceprefix=X
R=262.847.0
Imax=0.3e-6
}
