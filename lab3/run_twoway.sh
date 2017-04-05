!/bin/bash
ghdl -a twoway.vhd
ghdl -a twoway_tb.vhd
ghdl -e twoway_tb
ghdl -r twoway_tb --vcd=vcd --stop-time=100ms
sleep 1
gtkwave vcd
