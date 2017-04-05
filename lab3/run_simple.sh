!/bin/bash
ghdl -a simple.vhd
ghdl -a simple_tb.vhd
ghdl -e simple_tb
ghdl -r simple_tb --vcd=vcd --stop-time=2800ns
sleep 1
gtkwave vcd
