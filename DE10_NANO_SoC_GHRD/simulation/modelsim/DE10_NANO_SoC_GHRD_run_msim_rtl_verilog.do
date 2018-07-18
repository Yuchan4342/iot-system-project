transcript on
if ![file isdirectory DE10_NANO_SoC_GHRD_iputf_libs] {
	file mkdir DE10_NANO_SoC_GHRD_iputf_libs
}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

###### Libraries for IPUTF cores 
###### End libraries for IPUTF cores 
###### MIF file copy and HDL compilation commands for IPUTF cores 


vlog "/home/masashi/2018/univ/IoT/iot-system-project/DE10_NANO_SoC_GHRD/clock10m_sim/clock10m.vo"

vlog -vlog01compat -work work +incdir+/home/masashi/2018/univ/IoT/iot-system-project {/home/masashi/2018/univ/IoT/iot-system-project/score_calculator.v}
vlog -vlog01compat -work work +incdir+/home/masashi/2018/univ/IoT/iot-system-project {/home/masashi/2018/univ/IoT/iot-system-project/pattern_manager.v}
vlog -vlog01compat -work work +incdir+/home/masashi/2018/univ/IoT/iot-system-project {/home/masashi/2018/univ/IoT/iot-system-project/iot_system_project.v}
vlog -vlog01compat -work work +incdir+/home/masashi/2018/univ/IoT/iot-system-project {/home/masashi/2018/univ/IoT/iot-system-project/input_manager.v}
vlog -vlog01compat -work work +incdir+/home/masashi/2018/univ/IoT/iot-system-project {/home/masashi/2018/univ/IoT/iot-system-project/game_clock.v}
vlog -vlog01compat -work work +incdir+/home/masashi/2018/univ/IoT/iot-system-project {/home/masashi/2018/univ/IoT/iot-system-project/7seg_decoder.v}
vlog -vlog01compat -work work +incdir+/home/masashi/2018/univ/IoT/iot-system-project/DE10_NANO_SoC_GHRD/ip/edge_detect {/home/masashi/2018/univ/IoT/iot-system-project/DE10_NANO_SoC_GHRD/ip/edge_detect/altera_edge_detector.v}
vlog -vlog01compat -work work +incdir+/home/masashi/2018/univ/IoT/iot-system-project/DE10_NANO_SoC_GHRD/ip/debounce {/home/masashi/2018/univ/IoT/iot-system-project/DE10_NANO_SoC_GHRD/ip/debounce/debounce.v}
vlog -vlog01compat -work work +incdir+/home/masashi/2018/univ/IoT/iot-system-project/DE10_NANO_SoC_GHRD/ip/altsource_probe {/home/masashi/2018/univ/IoT/iot-system-project/DE10_NANO_SoC_GHRD/ip/altsource_probe/hps_reset.v}
vlog -vlog01compat -work work +incdir+/home/masashi/2018/univ/IoT/iot-system-project/DE10_NANO_SoC_GHRD {/home/masashi/2018/univ/IoT/iot-system-project/DE10_NANO_SoC_GHRD/DE10_NANO_SoC_GHRD.v}

