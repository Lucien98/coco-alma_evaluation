lang=vhdl
top_module=aes_sbox
order=1
cycles=7
rst_name=rst_i
testbench=verilator_tb.cpp

python ../pipeline.py --lang ${lang} --top-module ${top_module} --rst-name ${rst_name} --testbench ${testbench} --order ${order} --cycles ${cycles} > run_prep.sh 2> run_verify.sh
