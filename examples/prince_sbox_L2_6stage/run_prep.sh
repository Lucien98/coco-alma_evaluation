python3 /home/lucien/git/coco-alma/parse.py --log-yosys         --source         /home/lucien/git/coco-alma/examples/prince_sbox_L2_6stage/design/M2AffC.v    /home/lucien/git/coco-alma/examples/prince_sbox_L2_6stage/design/OutAff.v    /home/lucien/git/coco-alma/examples/prince_sbox_L2_6stage/design/M2Aff.v    /home/lucien/git/coco-alma/examples/prince_sbox_L2_6stage/design/CF.v    /home/lucien/git/coco-alma/examples/prince_sbox_L2_6stage/design/InAffC.v    /home/lucien/git/coco-alma/examples/prince_sbox_L2_6stage/design/InAff.v    /home/lucien/git/coco-alma/examples/prince_sbox_L2_6stage/design/M1AffC.v    /home/lucien/git/coco-alma/examples/prince_sbox_L2_6stage/design/M1Aff.v    /home/lucien/git/coco-alma/examples/prince_sbox_L2_6stage/design/XOR_3.v    /home/lucien/git/coco-alma/examples/prince_sbox_L2_6stage/design/PRINCE_Sbox_Inverse.v    /home/lucien/git/coco-alma/examples/prince_sbox_L2_6stage/design/Q294_2order.v    /home/lucien/git/coco-alma/examples/prince_sbox_L2_6stage/design/OutAffC.v        --top-module PRINCE_Sbox_Inverse         --json tmp/circuit.json         --label tmp/labels.txt 
    
python3 /home/lucien/git/coco-alma/trace.py         --testbench /home/lucien/git/coco-alma/examples/prince_sbox_L2_6stage/verilator_tb.cpp         --netlist /home/lucien/git/coco-alma/examples/prince_sbox_L2_6stage/tmp/circuit.v        -d /home/lucien/git/coco-alma/examples/prince_sbox_L2_6stage/tmp/
    
