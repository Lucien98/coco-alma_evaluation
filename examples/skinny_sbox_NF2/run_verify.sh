python3 /home/lucien/git/coco-alma/verify.py         --top-module SkinnySbox         --json /home/lucien/git/coco-alma/examples/skinny_sbox_NF2/tmp/circuit.json         --vcd /home/lucien/git/coco-alma/examples/skinny_sbox_NF2/tmp/tmp.vcd        --label /home/lucien/git/coco-alma/examples/skinny_sbox_NF2/labels.txt         --rst-name rst_i        --rst-phase 1        --rst-cycles 0        --mode stable         --order 2        --cycles 5        --probing-model classic > result/stable.log 2>result/stable.txt    
python3 /home/lucien/git/coco-alma/verify.py         --top-module SkinnySbox         --json /home/lucien/git/coco-alma/examples/skinny_sbox_NF2/tmp/circuit.json         --vcd /home/lucien/git/coco-alma/examples/skinny_sbox_NF2/tmp/tmp.vcd        --label /home/lucien/git/coco-alma/examples/skinny_sbox_NF2/labels.txt         --rst-name rst_i        --rst-phase 1        --rst-cycles 0        --mode transient         --order 2        --cycles 5        --probing-model classic > result/transient.log 2>result/transient.txt    
