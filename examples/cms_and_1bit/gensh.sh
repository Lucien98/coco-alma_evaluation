lang=verilog
top_module=cms_and_3rdorder
order=3
cycles=10
rst_name=rst_i
testbench=verilator_tb.cpp

python pipeline.py --lang ${lang} --top-module ${top_module} --rst-name ${rst_name} --testbench ${testbench} --order ${order} --cycles ${cycles} > run.sh
