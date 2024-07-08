python3 /home/lucien/git/coco-alma/parse.py --log-yosys         --source         /home/lucien/git/coco-alma/examples/cms_and_1bit/design/cms3_and_1bit.v        --top-module cms_and_3rdorder         --json tmp/circuit.json         --label tmp/labels.txt 
    
python3 /home/lucien/git/coco-alma/trace.py         --testbench /home/lucien/git/coco-alma/examples/cms_and_1bit/verilator_tb.cpp         --netlist /home/lucien/git/coco-alma/examples/cms_and_1bit/tmp/circuit.v        -d /home/lucien/git/coco-alma/examples/cms_and_1bit/tmp/
    
