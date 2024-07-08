python3 /home/lucien/git/coco-alma/parse.py --log-yosys         --source         /home/lucien/git/coco-alma/examples/aes_sbox_TI/design/AES_TI_core.v        --top-module inversion_TI         --json tmp/circuit.json         --label tmp/labels.txt 
    
python3 /home/lucien/git/coco-alma/trace.py         --testbench /home/lucien/git/coco-alma/examples/aes_sbox_TI/verilator_tb.cpp         --netlist /home/lucien/git/coco-alma/examples/aes_sbox_TI/tmp/circuit.v        -d /home/lucien/git/coco-alma/examples/aes_sbox_TI/tmp/
    
