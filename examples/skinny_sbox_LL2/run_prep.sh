python3 /home/lucien/git/coco-alma/parse.py --log-yosys         --top-module top_module_d11         --source         /home/lucien/git/coco-alma/examples/skinny_sbox_LL2/design/NF_CF_1.v    /home/lucien/git/coco-alma/examples/skinny_sbox_LL2/design/SKINNY_SBOX.v    /home/lucien/git/coco-alma/examples/skinny_sbox_LL2/design/XOR_n.v        --top-module SKINNY_SBOX         --json tmp/circuit.json         --label tmp/labels.txt 
    
python3 /home/lucien/git/coco-alma/trace.py         --testbench /home/lucien/git/coco-alma/examples/skinny_sbox_LL2/verilator_tb.cpp         --netlist /home/lucien/git/coco-alma/examples/skinny_sbox_LL2/tmp/circuit.v        -d /home/lucien/git/coco-alma/examples/skinny_sbox_LL2/tmp/
    
