python3 /home/lucien/git/coco-alma/verify.py         --top-module sharedSbox         --json /home/lucien/git/coco-alma/examples/present_sbox_tiu1prime/tmp/circuit.json         --vcd /home/lucien/git/coco-alma/examples/present_sbox_tiu1prime/tmp/tmp.vcd        --label /home/lucien/git/coco-alma/examples/present_sbox_tiu1prime/labels.txt         --rst-name rst_i        --rst-phase 1        --rst-cycles 0        --mode stable         --order 1        --cycles 3        --probing-model classic > result/stable.log 2>result/stable.txt    
python3 /home/lucien/git/coco-alma/verify.py         --top-module sharedSbox         --json /home/lucien/git/coco-alma/examples/present_sbox_tiu1prime/tmp/circuit.json         --vcd /home/lucien/git/coco-alma/examples/present_sbox_tiu1prime/tmp/tmp.vcd        --label /home/lucien/git/coco-alma/examples/present_sbox_tiu1prime/labels.txt         --rst-name rst_i        --rst-phase 1        --rst-cycles 0        --mode transient         --order 1        --cycles 3        --probing-model classic > result/transient.log 2>result/transient.txt    
