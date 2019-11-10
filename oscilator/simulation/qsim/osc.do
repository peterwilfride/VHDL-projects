onerror {quit -f}
vlib work
vlog -work work osc.vo
vlog -work work osc.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.wait_statement_vlg_vec_tst
vcd file -direction osc.msim.vcd
vcd add -internal wait_statement_vlg_vec_tst/*
vcd add -internal wait_statement_vlg_vec_tst/i1/*
add wave /*
run -all
