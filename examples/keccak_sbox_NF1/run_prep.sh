python3 /home/lucien/git/coco-alma/parse.py --log-yosys         --top-module top_module_d11         --source         /home/lucien/git/coco-alma/examples/keccak_sbox_NF1/design/XOR_2.v    /home/lucien/git/coco-alma/examples/keccak_sbox_NF1/design/NF_CF.v    /home/lucien/git/coco-alma/examples/keccak_sbox_NF1/design/Chi_NoFresh.v        --top-module Chi_NoFresh         --json tmp/circuit.json         --label tmp/labels.txt 
    
python3 /home/lucien/git/coco-alma/trace.py         --testbench /home/lucien/git/coco-alma/examples/keccak_sbox_NF1/verilator_tb.cpp         --netlist /home/lucien/git/coco-alma/examples/keccak_sbox_NF1/tmp/circuit.v        -d /home/lucien/git/coco-alma/examples/keccak_sbox_NF1/tmp/
    
