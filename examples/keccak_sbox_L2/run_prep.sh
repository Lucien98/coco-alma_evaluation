python3 /home/lucien/git/coco-alma/parse.py --log-yosys         --top-module top_module_d11         --source         /home/lucien/git/coco-alma/examples/keccak_sbox_L2/design/AND_XOR.v    /home/lucien/git/coco-alma/examples/keccak_sbox_L2/design/keccak_sbox.v        --top-module keccak_sbox         --json tmp/circuit.json         --label tmp/labels.txt 
    
python3 /home/lucien/git/coco-alma/trace.py         --testbench /home/lucien/git/coco-alma/examples/keccak_sbox_L2/verilator_tb.cpp         --netlist /home/lucien/git/coco-alma/examples/keccak_sbox_L2/tmp/circuit.v        -d /home/lucien/git/coco-alma/examples/keccak_sbox_L2/tmp/
    
