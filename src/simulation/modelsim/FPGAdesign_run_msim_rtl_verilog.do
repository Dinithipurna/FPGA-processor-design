transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/inesh/Documents/FPGA-processor-design-dev/FPGA-processor-design-dev/src {C:/Users/inesh/Documents/FPGA-processor-design-dev/FPGA-processor-design-dev/src/Pointer_MUX.v}
vlog -vlog01compat -work work +incdir+C:/Users/inesh/Documents/FPGA-processor-design-dev/FPGA-processor-design-dev/src {C:/Users/inesh/Documents/FPGA-processor-design-dev/FPGA-processor-design-dev/src/IRAM.v}
vlog -vlog01compat -work work +incdir+C:/Users/inesh/Documents/FPGA-processor-design-dev/FPGA-processor-design-dev/src {C:/Users/inesh/Documents/FPGA-processor-design-dev/FPGA-processor-design-dev/src/DRAM.v}
vlog -vlog01compat -work work +incdir+C:/Users/inesh/Documents/FPGA-processor-design-dev/FPGA-processor-design-dev/src {C:/Users/inesh/Documents/FPGA-processor-design-dev/FPGA-processor-design-dev/src/BUS_MUX.v}
vlog -vlog01compat -work work +incdir+C:/Users/inesh/Documents/FPGA-processor-design-dev/FPGA-processor-design-dev/src {C:/Users/inesh/Documents/FPGA-processor-design-dev/FPGA-processor-design-dev/src/Module_RP_CP.v}
vlog -vlog01compat -work work +incdir+C:/Users/inesh/Documents/FPGA-processor-design-dev/FPGA-processor-design-dev/src {C:/Users/inesh/Documents/FPGA-processor-design-dev/FPGA-processor-design-dev/src/Module_RegF.v}
vlog -vlog01compat -work work +incdir+C:/Users/inesh/Documents/FPGA-processor-design-dev/FPGA-processor-design-dev/src {C:/Users/inesh/Documents/FPGA-processor-design-dev/FPGA-processor-design-dev/src/Module_Reg.v}
vlog -vlog01compat -work work +incdir+C:/Users/inesh/Documents/FPGA-processor-design-dev/FPGA-processor-design-dev/src {C:/Users/inesh/Documents/FPGA-processor-design-dev/FPGA-processor-design-dev/src/MemController.v}
vlog -vlog01compat -work work +incdir+C:/Users/inesh/Documents/FPGA-processor-design-dev/FPGA-processor-design-dev/src {C:/Users/inesh/Documents/FPGA-processor-design-dev/FPGA-processor-design-dev/src/define.v}
vlog -vlog01compat -work work +incdir+C:/Users/inesh/Documents/FPGA-processor-design-dev/FPGA-processor-design-dev/src {C:/Users/inesh/Documents/FPGA-processor-design-dev/FPGA-processor-design-dev/src/clkdiv.v}
vlog -vlog01compat -work work +incdir+C:/Users/inesh/Documents/FPGA-processor-design-dev/FPGA-processor-design-dev/src {C:/Users/inesh/Documents/FPGA-processor-design-dev/FPGA-processor-design-dev/src/Modified.v}
vlog -vlog01compat -work work +incdir+C:/Users/inesh/Documents/FPGA-processor-design-dev/FPGA-processor-design-dev/src {C:/Users/inesh/Documents/FPGA-processor-design-dev/FPGA-processor-design-dev/src/core.v}
vlog -vlog01compat -work work +incdir+C:/Users/inesh/Documents/FPGA-processor-design-dev/FPGA-processor-design-dev/src {C:/Users/inesh/Documents/FPGA-processor-design-dev/FPGA-processor-design-dev/src/Control_Unit.v}
vlog -vlog01compat -work work +incdir+C:/Users/inesh/Documents/FPGA-processor-design-dev/FPGA-processor-design-dev/src {C:/Users/inesh/Documents/FPGA-processor-design-dev/FPGA-processor-design-dev/src/ALU.v}
vlog -vlog01compat -work work +incdir+C:/Users/inesh/Documents/FPGA-processor-design-dev/FPGA-processor-design-dev/src/db {C:/Users/inesh/Documents/FPGA-processor-design-dev/FPGA-processor-design-dev/src/db/pll_altpll.v}

vlog -vlog01compat -work work +incdir+C:/Users/inesh/Documents/FPGA-processor-design-dev/FPGA-processor-design-dev/src {C:/Users/inesh/Documents/FPGA-processor-design-dev/FPGA-processor-design-dev/src/testbench.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneiv_hssi_ver -L cycloneiv_pcie_hip_ver -L cycloneiv_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run -all
