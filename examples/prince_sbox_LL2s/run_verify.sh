python3 /home/lucien/git/coco-alma/verify.py         --top-module TwoSboxes         --json /home/lucien/git/coco-alma/examples/prince_sbox_LL2s/tmp/circuit.json         --vcd /home/lucien/git/coco-alma/examples/prince_sbox_LL2s/tmp/tmp.vcd        --label /home/lucien/git/coco-alma/examples/prince_sbox_LL2s/labels.txt         --rst-name rst_i        --rst-phase 1        --rst-cycles 0        --cycles 8        --mode stable         --order 2        --cycles 3        --probing-model classic > result/stable.log 2>result/stable.txt    
python3 /home/lucien/git/coco-alma/verify.py         --top-module TwoSboxes         --json /home/lucien/git/coco-alma/examples/prince_sbox_LL2s/tmp/circuit.json         --vcd /home/lucien/git/coco-alma/examples/prince_sbox_LL2s/tmp/tmp.vcd        --label /home/lucien/git/coco-alma/examples/prince_sbox_LL2s/labels.txt         --rst-name rst_i        --rst-phase 1        --rst-cycles 0        --cycles 8        --mode transient         --order 2        --cycles 3        --probing-model classic > result/transient.log 2>result/transient.txt    
