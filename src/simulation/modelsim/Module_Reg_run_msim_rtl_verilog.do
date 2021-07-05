transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/inesh/Documents/FPGA-processor-design-dev/FPGA-processor-design-dev/src {C:/Users/inesh/Documents/FPGA-processor-design-dev/FPGA-processor-design-dev/src/Module_Reg.v}

vlog -vlog01compat -work work +incdir+C:/Users/inesh/Documents/FPGA-processor-design-dev/FPGA-processor-design-dev/src/../../../FPGA_Reg_tb {C:/Users/inesh/Documents/FPGA-processor-design-dev/FPGA-processor-design-dev/src/../../../FPGA_Reg_tb/Module_Reg_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  Module_Reg_tb

add wave *
view structure
view signals
run -all
