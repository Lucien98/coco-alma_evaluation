lang=verilog
top_module=keccak_sbox
cycles=2
order=1
rst_name=RstxRBI
testbench=verilator_tb.cpp
rst_cycles=2
rst_phase=0

python ../pipeline.py --lang ${lang} --top-module ${top_module} --rst-name ${rst_name} --testbench ${testbench} --order ${order} --cycles ${cycles} --rst-cycles ${rst_cycles} --rst-phase ${rst_phase} > run_prep.sh 2> run_verify.sh
