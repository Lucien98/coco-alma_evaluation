python3 /home/lucien/git/coco-alma/verify.py         --top-module GF256Inv_Unit         --json /home/lucien/git/coco-alma/examples/aes_sbox_4Fresh/tmp/circuit.json         --vcd /home/lucien/git/coco-alma/examples/aes_sbox_4Fresh/tmp/tmp.vcd        --label /home/lucien/git/coco-alma/examples/aes_sbox_4Fresh/labels.txt         --rst-name rst_i        --rst-phase 1        --rst-cycles 0        --mode stable         --order 1        --cycles 5        --probing-model classic > result/stable.log 2>result/stable.txt    
python3 /home/lucien/git/coco-alma/verify.py         --top-module GF256Inv_Unit         --json /home/lucien/git/coco-alma/examples/aes_sbox_4Fresh/tmp/circuit.json         --vcd /home/lucien/git/coco-alma/examples/aes_sbox_4Fresh/tmp/tmp.vcd        --label /home/lucien/git/coco-alma/examples/aes_sbox_4Fresh/labels.txt         --rst-name rst_i        --rst-phase 1        --rst-cycles 0        --mode transient         --order 1        --cycles 5        --probing-model classic > result/transient.log 2>result/transient.txt    
