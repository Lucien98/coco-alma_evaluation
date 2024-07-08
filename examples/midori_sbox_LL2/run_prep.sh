python3 /home/lucien/git/coco-alma/parse.py --log-yosys         --source         /home/lucien/git/coco-alma/examples/midori_sbox_LL2/design/MyRotation.v    /home/lucien/git/coco-alma/examples/midori_sbox_LL2/design/Midori_Sbox.v    /home/lucien/git/coco-alma/examples/midori_sbox_LL2/design/NF_CF_1.v    /home/lucien/git/coco-alma/examples/midori_sbox_LL2/design/XOR_n.v        --top-module Midori_Sbox         --json tmp/circuit.json         --label tmp/labels.txt 
    
python3 /home/lucien/git/coco-alma/trace.py         --testbench /home/lucien/git/coco-alma/examples/midori_sbox_LL2/verilator_tb.cpp         --netlist /home/lucien/git/coco-alma/examples/midori_sbox_LL2/tmp/circuit.v        -d /home/lucien/git/coco-alma/examples/midori_sbox_LL2/tmp/
    
