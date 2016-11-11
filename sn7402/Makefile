# Makefile to drive cew testing of verilog
# P Walsh Feb 2010
# Revised June 2013 for sn74** modules

# Targets
#   behaviour --- make batch test for behaviour description
#   btiming   --- display behaviour timing diagram
#   clean

# directory where CEW scripts are located and temp files
SD=../../Cew
# code beautifier
INDENT=cat

behaviour: mybehaviour
	vvp mybehaviour

test_bench.vcd: tb.cew behaviour.v
	make behaviour

btiming: test_bench.vcd
	gtkwave test_bench.vcd

tb.v: tb.cew
	rm -f $(SD)/tmp/tb.v
	awk -f $(SD)/bin/addLineNums.awk tb.cew > $(SD)/tmp/tb.num
	m4  -I $(SD)/bin $(SD)/tmp/tb.num | $(INDENT)  > tb.v

clean:
	rm -f  $(SD)/tmp/* mybehaviour tb.v test_bench.vcd

mybehaviour: tb.v  behaviour.v
	iverilog -Wall -o mybehaviour tb.v behaviour.v

