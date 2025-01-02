vlib work
vlog functional_simulator.sv +acc
vlog pipeline_without_forward.sv +acc
vlog pipeline_with_forward.sv +acc
vlog top.sv  +acc
vsim work.top
add wave -r *
run -all