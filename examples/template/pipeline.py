import os, sys
import subprocess as sp

AES_DIR = os.path.dirname(os.path.realpath(__file__))
DESIGN_DIR = AES_DIR + "/design"
ALMA_DIR = "/".join(AES_DIR.split("/")[:-2])
TMP_DIR = ALMA_DIR + "/tmp"
TEMPLATE_DIR = ALMA_DIR + "/templates/"

SYNTH_FILE_PATH = TMP_DIR + "/yosys_synth.ys"
TEMPLATE_FILE_PATH = TEMPLATE_DIR + "/yosys_synth_template.txt"

# vpython3 = "%s/dev/bin/python3" % ALMA_DIR
vpython3 = "python3"

##### PARSING
def parse(top_module):
    design_files = set(os.listdir(DESIGN_DIR))
        
    file_list = "    ".join([DESIGN_DIR + "/" + x for x in design_files])

    parse_cmd = \
    """python3 %s/parse.py --log-yosys \
        --top-module top_module_d11 \
        --source \
        %s\
        --top-module %s \
        --json tmp/circuit.json \
        --label tmp/labels.txt 
    """ % (ALMA_DIR, file_list, top_module)
    # """ % (ALMA_DIR, file_list)

    print(parse_cmd)
    return parse_cmd


    
##### TRACING

def trace():
    trace_cmd = \
    """python3 %s/trace.py \
        --testbench %s/verilator_tb.cpp \
        --netlist %s/tmp/circuit.v\
        -d %s/tmp/
    """ % (ALMA_DIR, AES_DIR, AES_DIR, AES_DIR)

    print(trace_cmd)
    return trace_cmd

##### VERIFICATION

def verify(args):
    # top_module = "aes_sbox"

    verify_cmd = \
    """%s %s/verify.py \
        --top-module %s \
        --json %s/tmp/circuit.json \
        --vcd %s/tmp/tmp.vcd\
        --label %s/labels.txt \
        --rst-name rst_i\
        --rst-phase 1\
        --rst-cycles 0\
        --cycles 8\
        --mode stable \
        --order %d\
        --cycles %d\
        --probing-model classic > result/stable.txt\
    """ % (vpython3, ALMA_DIR, args.top_module, AES_DIR, AES_DIR, AES_DIR, args.order, args.cycles)

    print(verify_cmd)
    verify_cmd = verify_cmd.replace("stable", "transient")
    print(verify_cmd)
    return verify_cmd

def main():

    import argparse

    parser = argparse.ArgumentParser()
    parser.add_argument('--top-module', metavar='top_module', required=False, default = "aes_sbox",
                        help='The top-module name of the design', type=str)
    parser.add_argument('--testbench', metavar='testbench', required=False, default = "verilator_tb.cpp",
                        help='The file path of c++ testbench file', type=str)
    parser.add_argument('--rst-name', metavar='rst_name', required=False, default = "rst_i",
                        help='The name of reset signal', type=str)
    parser.add_argument('--order', metavar='order', required=False, default = 1,
                        help='Security order', type=int)
    parser.add_argument('--cycles', metavar='cycles', required=False, default = 1,
                        help='How many cycles to check', type=int)
    parser.add_argument('--lang', metavar='lang', required=False, default = "vhdl",
                        help='Which language are the design files written', type=str)
    args = parser.parse_args()
    top_module = args.top_module

    if args.lang == "verilog":
        parse(top_module)
    else:
        yosys_exec(top_module)
        create_labels(top_module)


    trace()

    verify(args)

if __name__ == "__main__":
    main()
