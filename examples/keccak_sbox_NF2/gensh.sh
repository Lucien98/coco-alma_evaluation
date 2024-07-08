lang=verilog
top_module=Chi_NoFresh
cycles=2
order=2
rst_name=rst_i
rst_phase=1
rst_cycles=0
testbench=verilator_tb.cpp

python ../pipeline.py --lang ${lang} --top-module ${top_module} --rst-name ${rst_name} --rst-phase ${rst_phase} --rst-cycles ${rst_cycles} --testbench ${testbench} --order ${order} --cycles ${cycles} > run_prep.sh 2> run_verify.sh
