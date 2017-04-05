ghdl -a lfsr.vhd
ghdl -a lfsr_tb.vhd
ghdl -e lfsr_tb
ghdl -r lfsr_tb --vcd=vcd --stop-time=2800ns
sleep 1
gtkwave vcd
