sudo docker run --rm -t       -v /home/lucien/git/coco-alma/examples/aes_sbox_dom/design:/src       -v /home/lucien/git/coco-alma/tmp:/tmp       -w /src       hdlc/ghdl:yosys       yosys -m ghdl /tmp/yosys_synth.ys
    
python3 /home/lucien/git/coco-alma/create_labels.py         --top-module aes_sbox         --source tmp/circuit.v         --json tmp/circuit.json         --label tmp/labels.txt 
    
python3 /home/lucien/git/coco-alma/trace.py         --testbench /home/lucien/git/coco-alma/examples/aes_sbox_dom/verilator_tb.cpp         --netlist /home/lucien/git/coco-alma/examples/aes_sbox_dom/tmp/circuit.v        -d /home/lucien/git/coco-alma/examples/aes_sbox_dom/tmp/
    
