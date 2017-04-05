ghdl -a vhdl_txt.vhd
ghdl -a statemachine.vhd
ghdl -a statemachine_tb.vhd
ghdl -e statemachine_tb
ghdl -r statemachine_tb --vcd=vcd --stop-time=4800ns
