python3 /home/lucien/git/coco-alma/parse.py --log-yosys         --source         /home/lucien/git/coco-alma/examples/midori_sbox_L2_4stage/design/MidoriAffines.v    /home/lucien/git/coco-alma/examples/midori_sbox_L2_4stage/design/XOR_3.v    /home/lucien/git/coco-alma/examples/midori_sbox_L2_4stage/design/Q12_2order.v    /home/lucien/git/coco-alma/examples/midori_sbox_L2_4stage/design/Midori_Sbox.v    /home/lucien/git/coco-alma/examples/midori_sbox_L2_4stage/design/CF.v        --top-module Midori_Sbox         --json tmp/circuit.json         --label tmp/labels.txt 
    
python3 /home/lucien/git/coco-alma/trace.py         --testbench /home/lucien/git/coco-alma/examples/midori_sbox_L2_4stage/verilator_tb.cpp         --netlist /home/lucien/git/coco-alma/examples/midori_sbox_L2_4stage/tmp/circuit.v        -d /home/lucien/git/coco-alma/examples/midori_sbox_L2_4stage/tmp/
    
