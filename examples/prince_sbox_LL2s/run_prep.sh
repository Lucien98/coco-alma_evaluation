python3 /home/lucien/git/coco-alma/parse.py --log-yosys         --source         /home/lucien/git/coco-alma/examples/prince_sbox_LL2s/design/NF_CF_1.v    /home/lucien/git/coco-alma/examples/prince_sbox_LL2s/design/XOR_n.v    /home/lucien/git/coco-alma/examples/prince_sbox_LL2s/design/TwoSboxes.v    /home/lucien/git/coco-alma/examples/prince_sbox_LL2s/design/PRINCE_Sbox_inv.v        --top-module TwoSboxes         --json tmp/circuit.json         --label tmp/labels.txt 
    
python3 /home/lucien/git/coco-alma/trace.py         --testbench /home/lucien/git/coco-alma/examples/prince_sbox_LL2s/verilator_tb.cpp         --netlist /home/lucien/git/coco-alma/examples/prince_sbox_LL2s/tmp/circuit.v        -d /home/lucien/git/coco-alma/examples/prince_sbox_LL2s/tmp/
    
