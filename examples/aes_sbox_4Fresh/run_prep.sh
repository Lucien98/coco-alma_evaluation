python3 /home/lucien/git/coco-alma/parse.py --log-yosys         --source         /home/lucien/git/coco-alma/examples/aes_sbox_4Fresh/design/GF4Mul_Unit.v    /home/lucien/git/coco-alma/examples/aes_sbox_4Fresh/design/GF4MulXorSqSc_Unit.v    /home/lucien/git/coco-alma/examples/aes_sbox_4Fresh/design/AffineInput_Unit.v    /home/lucien/git/coco-alma/examples/aes_sbox_4Fresh/design/GF16Mul_Unit.v    /home/lucien/git/coco-alma/examples/aes_sbox_4Fresh/design/GF16MulXorSqSc_Unit.v    /home/lucien/git/coco-alma/examples/aes_sbox_4Fresh/design/GF256Inv_Unit.v        --top-module GF256Inv_Unit         --json tmp/circuit.json         --label tmp/labels.txt 
    
python3 /home/lucien/git/coco-alma/trace.py         --testbench /home/lucien/git/coco-alma/examples/aes_sbox_4Fresh/verilator_tb.cpp         --netlist /home/lucien/git/coco-alma/examples/aes_sbox_4Fresh/tmp/circuit.v        -d /home/lucien/git/coco-alma/examples/aes_sbox_4Fresh/tmp/
    