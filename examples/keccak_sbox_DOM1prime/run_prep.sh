python3 /home/lucien/git/coco-alma/parse.py --log-yosys         --source         /home/lucien/git/coco-alma/examples/keccak_sbox_DOM1prime/design/keccak_sbox_wo.v        --top-module keccak_sbox         --json tmp/circuit.json         --label tmp/labels.txt 
    
python3 /home/lucien/git/coco-alma/trace.py         --testbench /home/lucien/git/coco-alma/examples/keccak_sbox_DOM1prime/verilator_tb.cpp         --netlist /home/lucien/git/coco-alma/examples/keccak_sbox_DOM1prime/tmp/circuit.v        -d /home/lucien/git/coco-alma/examples/keccak_sbox_DOM1prime/tmp/
    
