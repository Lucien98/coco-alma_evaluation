python3 /home/lucien/git/coco-alma/parse.py --log-yosys         --source         /home/lucien/git/coco-alma/examples/keccak_sbox_NF2/design/XOR_3.v    /home/lucien/git/coco-alma/examples/keccak_sbox_NF2/design/Chi_NoFresh.v    /home/lucien/git/coco-alma/examples/keccak_sbox_NF2/design/NF_CF.v        --top-module Chi_NoFresh         --json tmp/circuit.json         --label tmp/labels.txt 
    
python3 /home/lucien/git/coco-alma/trace.py         --testbench /home/lucien/git/coco-alma/examples/keccak_sbox_NF2/verilator_tb.cpp         --netlist /home/lucien/git/coco-alma/examples/keccak_sbox_NF2/tmp/circuit.v        -d /home/lucien/git/coco-alma/examples/keccak_sbox_NF2/tmp/
    
