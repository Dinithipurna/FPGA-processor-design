transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/inesh/Documents/Singlecore-Hasini {C:/Users/inesh/Documents/Singlecore-Hasini/define.v}
vlog -vlog01compat -work work +incdir+C:/Users/inesh/Documents/Singlecore-Hasini {C:/Users/inesh/Documents/Singlecore-Hasini/Control_Unit.v}

vlog -vlog01compat -work work +incdir+C:/Users/inesh/Documents/Singlecore-Hasini {C:/Users/inesh/Documents/Singlecore-Hasini/Control_Unit_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  Control_Unit_tb

add wave *
view structure
view signals
run -all
