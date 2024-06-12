type=vhdl
top_module=aes_sbox
order=1
cycles=8
rst_name=rst_i
testbench=verilator_tb.cpp

python pipeline_${type}.py --top-module ${top_module} --rst-name ${rst_name} --testbench ${testbench} --order ${order} --cycles ${cycles} > run.sh
