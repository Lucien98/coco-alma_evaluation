python3 /home/lucien/git/coco-alma/parse.py --log-yosys         --source         /home/lucien/git/coco-alma/examples/skinny_sbox_L2s_3stage/design/XOR_3.v    /home/lucien/git/coco-alma/examples/skinny_sbox_L2s_3stage/design/SKINNYAffines.v    /home/lucien/git/coco-alma/examples/skinny_sbox_L2s_3stage/design/SKINNY_Sbox.v    /home/lucien/git/coco-alma/examples/skinny_sbox_L2s_3stage/design/TwoSbox.v    /home/lucien/git/coco-alma/examples/skinny_sbox_L2s_3stage/design/Q294_2order.v    /home/lucien/git/coco-alma/examples/skinny_sbox_L2s_3stage/design/CF.v        --top-module TwoSbox         --json tmp/circuit.json         --label tmp/labels.txt 
    
python3 /home/lucien/git/coco-alma/trace.py         --testbench /home/lucien/git/coco-alma/examples/skinny_sbox_L2s_3stage/verilator_tb.cpp         --netlist /home/lucien/git/coco-alma/examples/skinny_sbox_L2s_3stage/tmp/circuit.v        -d /home/lucien/git/coco-alma/examples/skinny_sbox_L2s_3stage/tmp/
    
