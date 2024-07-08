python3 /home/lucien/git/coco-alma/parse.py --log-yosys         --source         /home/lucien/git/coco-alma/examples/prince_sbox_LL2/design/XOR_n.v    /home/lucien/git/coco-alma/examples/prince_sbox_LL2/design/NF_CF_1.v    /home/lucien/git/coco-alma/examples/prince_sbox_LL2/design/PRINCE_Sbox_inv.v    /home/lucien/git/coco-alma/examples/prince_sbox_LL2/design/TwoSboxes.v        --top-module PRINCE_Sbox_inv         --json tmp/circuit.json         --label tmp/labels.txt 
    
python3 /home/lucien/git/coco-alma/trace.py         --testbench /home/lucien/git/coco-alma/examples/prince_sbox_LL2/verilator_tb.cpp         --netlist /home/lucien/git/coco-alma/examples/prince_sbox_LL2/tmp/circuit.v        -d /home/lucien/git/coco-alma/examples/prince_sbox_LL2/tmp/
    
