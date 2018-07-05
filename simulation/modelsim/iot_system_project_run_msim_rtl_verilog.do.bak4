transcript on
if ![file isdirectory iot_system_project_iputf_libs] {
	file mkdir iot_system_project_iputf_libs
}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

###### Libraries for IPUTF cores 
###### End libraries for IPUTF cores 
###### MIF file copy and HDL compilation commands for IPUTF cores 


vlog "/home/masashi/2018/univ/IoT/iot-system-project/clock10m_sim/clock10m.vo"

vlog -vlog01compat -work work +incdir+/home/masashi/2018/univ/IoT/iot-system-project {/home/masashi/2018/univ/IoT/iot-system-project/game_clock.v}
vlog -vlog01compat -work work +incdir+/home/masashi/2018/univ/IoT/iot-system-project {/home/masashi/2018/univ/IoT/iot-system-project/pattern_manager.v}
vlog -vlog01compat -work work +incdir+/home/masashi/2018/univ/IoT/iot-system-project {/home/masashi/2018/univ/IoT/iot-system-project/iot_system_project.v}
vlog -vlog01compat -work work +incdir+/home/masashi/2018/univ/IoT/iot-system-project {/home/masashi/2018/univ/IoT/iot-system-project/input_manager.v}
vlog -vlog01compat -work work +incdir+/home/masashi/2018/univ/IoT/iot-system-project {/home/masashi/2018/univ/IoT/iot-system-project/score_calculator.v}
vlog -vlog01compat -work work +incdir+/home/masashi/2018/univ/IoT/iot-system-project {/home/masashi/2018/univ/IoT/iot-system-project/7seg_decoder.v}

