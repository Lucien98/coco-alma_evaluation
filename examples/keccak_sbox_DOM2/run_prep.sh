python3 /home/lucien/git/coco-alma/parse.py --log-yosys         --source         /home/lucien/git/coco-alma/examples/keccak_sbox_DOM2/design/keccak_sbox_wo.v        --top-module keccak_sbox         --json tmp/circuit.json         --label tmp/labels.txt 
    
python3 /home/lucien/git/coco-alma/trace.py         --testbench /home/lucien/git/coco-alma/examples/keccak_sbox_DOM2/verilator_tb.cpp         --netlist /home/lucien/git/coco-alma/examples/keccak_sbox_DOM2/tmp/circuit.v        -d /home/lucien/git/coco-alma/examples/keccak_sbox_DOM2/tmp/
    
