lang=verilog
top_module=keccak_sbox
cycles=3
order=3
rst_name=RstxRBI
rst_phase=0
rst_cycles=2
testbench=verilator_tb.cpp

python ../pipeline.py --lang ${lang} --top-module ${top_module} --rst-name ${rst_name} --rst-phase ${rst_phase} --rst-cycles ${rst_cycles} --testbench ${testbench} --order ${order} --cycles ${cycles} > run_prep.sh 2> run_verify.sh
