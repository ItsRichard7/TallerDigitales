transcript on
if ![file isdirectory Prueba_iputf_libs] {
	file mkdir Prueba_iputf_libs
}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

###### Libraries for IPUTF cores 
###### End libraries for IPUTF cores 
###### MIF file copy and HDL compilation commands for IPUTF cores 


vlog "C:/Users/User/Desktop/VGA_Draw/pll_sim/pll.vo"

vlog -vlog01compat -work work +incdir+C:/Users/User/Desktop/VGA_Draw {C:/Users/User/Desktop/VGA_Draw/Ram1.v}
vlog -sv -work work +incdir+C:/Users/User/Desktop/VGA_Draw {C:/Users/User/Desktop/VGA_Draw/vga.sv}

vlog -sv -work work +incdir+C:/Users/User/Desktop/VGA_Draw {C:/Users/User/Desktop/VGA_Draw/testbench.sv}
vlog -vlog01compat -work work +incdir+C:/Users/User/Desktop/VGA_Draw {C:/Users/User/Desktop/VGA_Draw/pll.v}
vlog -sv -work work +incdir+C:/Users/User/Desktop/VGA_Draw {C:/Users/User/Desktop/VGA_Draw/vga.sv}
vlog -vlog01compat -work work +incdir+C:/Users/User/Desktop/VGA_Draw {C:/Users/User/Desktop/VGA_Draw/Ram1.v}
vlog -vlog01compat -work work +incdir+C:/Users/User/Desktop/VGA_Draw {C:/Users/User/Desktop/VGA_Draw/Ram1_bb.v}
vlog -vlog01compat -work work +incdir+C:/Users/User/Desktop/VGA_Draw/pll {C:/Users/User/Desktop/VGA_Draw/pll/pll_0002.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run -all
