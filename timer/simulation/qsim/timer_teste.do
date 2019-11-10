onerror {quit -f}
vlib work
vlog -work work timer_teste.vo
vlog -work work timer_teste.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.timer_teste_vlg_vec_tst
vcd file -direction timer_teste.msim.vcd
vcd add -internal timer_teste_vlg_vec_tst/*
vcd add -internal timer_teste_vlg_vec_tst/i1/*
add wave /*
run -all
