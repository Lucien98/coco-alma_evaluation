python3 /home/lucien/git/coco-alma/verify.py         --top-module sbox         --json /home/lucien/git/coco-alma/examples/aes_sbox_cms/tmp/circuit.json         --vcd /home/lucien/git/coco-alma/examples/aes_sbox_cms/tmp/tmp.vcd        --label /home/lucien/git/coco-alma/examples/aes_sbox_cms/labels.txt         --rst-name rst_i        --rst-phase 1        --rst-cycles 0        --mode stable         --order 1        --cycles 7        --probing-model classic > result/stable.log 2>result/stable.txt    
python3 /home/lucien/git/coco-alma/verify.py         --top-module sbox         --json /home/lucien/git/coco-alma/examples/aes_sbox_cms/tmp/circuit.json         --vcd /home/lucien/git/coco-alma/examples/aes_sbox_cms/tmp/tmp.vcd        --label /home/lucien/git/coco-alma/examples/aes_sbox_cms/labels.txt         --rst-name rst_i        --rst-phase 1        --rst-cycles 0        --mode transient         --order 1        --cycles 7        --probing-model classic > result/transient.log 2>result/transient.txt    
