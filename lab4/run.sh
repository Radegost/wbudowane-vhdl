ghdl -a crc8.vhd
ghdl -a crc8_tb.vhdl
ghdl -e crc8_tb
ghdl -r crc8_tb --vcd=vcd --stop-time=4000ns
