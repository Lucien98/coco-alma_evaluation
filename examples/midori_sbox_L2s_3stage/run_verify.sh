python3 /home/lucien/git/coco-alma/verify.py         --top-module TwoSbox         --json /home/lucien/git/coco-alma/examples/midori_sbox_L2s_3stage/tmp/circuit.json         --vcd /home/lucien/git/coco-alma/examples/midori_sbox_L2s_3stage/tmp/tmp.vcd        --label /home/lucien/git/coco-alma/examples/midori_sbox_L2s_3stage/labels.txt         --rst-name rst_i        --rst-phase 1        --rst-cycles 0        --mode stable         --order 2        --cycles 5        --probing-model classic > result/stable.log 2>result/stable.txt    
python3 /home/lucien/git/coco-alma/verify.py         --top-module TwoSbox         --json /home/lucien/git/coco-alma/examples/midori_sbox_L2s_3stage/tmp/circuit.json         --vcd /home/lucien/git/coco-alma/examples/midori_sbox_L2s_3stage/tmp/tmp.vcd        --label /home/lucien/git/coco-alma/examples/midori_sbox_L2s_3stage/labels.txt         --rst-name rst_i        --rst-phase 1        --rst-cycles 0        --mode transient         --order 2        --cycles 5        --probing-model classic > result/transient.log 2>result/transient.txt    
