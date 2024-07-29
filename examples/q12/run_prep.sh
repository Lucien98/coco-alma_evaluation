python3 /home/lucien/git/coco-alma/parse.py --log-yosys         --source         /home/lucien/git/coco-alma/examples/q12/design/q12.v        --top-module q12         --json tmp/circuit.json         --label tmp/labels.txt 
    
python3 /home/lucien/git/coco-alma/trace.py         --testbench /home/lucien/git/coco-alma/examples/q12/verilator_tb.cpp         --netlist /home/lucien/git/coco-alma/examples/q12/tmp/circuit.v        -d /home/lucien/git/coco-alma/examples/q12/tmp/
    
