set_global_assignment -entity "clock10m" -library "lib_clock10m" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "clock10m" -library "lib_clock10m" -name IP_TOOL_VERSION "16.1"
set_global_assignment -entity "clock10m" -library "lib_clock10m" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_clock10m" -name SPD_FILE [file join $::quartus(sip_path) "clock10m.spd"]

set_global_assignment -library "lib_clock10m" -name MISC_FILE [file join $::quartus(sip_path) "clock10m_sim/clock10m.vo"]
