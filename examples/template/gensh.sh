lang=vhdl # verilog
top_module=
cycles=
order=1
rst_name=rst_i
testbench=verilator_tb.cpp

python pipeline.py --lang ${lang} --top-module ${top_module} --rst-name ${rst_name} --testbench ${testbench} --order ${order} --cycles ${cycles} > run.sh