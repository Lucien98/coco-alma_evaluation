python3 /home/lucien/git/coco-alma/parse.py --log-yosys         --top-module top_module_d11         --source         /home/lucien/git/coco-alma/examples/midori_sbox_NF2/design/NF_CF_1.v    /home/lucien/git/coco-alma/examples/midori_sbox_NF2/design/Affine.v    /home/lucien/git/coco-alma/examples/midori_sbox_NF2/design/MidoriSbox.v    /home/lucien/git/coco-alma/examples/midori_sbox_NF2/design/Q12_2_2order_NoFresh.v    /home/lucien/git/coco-alma/examples/midori_sbox_NF2/design/Q12_1_2order_8r.v    /home/lucien/git/coco-alma/examples/midori_sbox_NF2/design/NF_CF_2.v    /home/lucien/git/coco-alma/examples/midori_sbox_NF2/design/XOR_3.v        --top-module MidoriSbox         --json tmp/circuit.json         --label tmp/labels.txt 
    
python3 /home/lucien/git/coco-alma/trace.py         --testbench /home/lucien/git/coco-alma/examples/midori_sbox_NF2/verilator_tb.cpp         --netlist /home/lucien/git/coco-alma/examples/midori_sbox_NF2/tmp/circuit.v        -d /home/lucien/git/coco-alma/examples/midori_sbox_NF2/tmp/
    
