import os, sys
import subprocess as sp

AES_DIR = os.getcwd()#os.path.dirname(os.path.realpath(__file__))
DESIGN_DIR = AES_DIR + "/design"
ALMA_DIR = "/".join(AES_DIR.split("/")[:-2])
TMP_DIR = ALMA_DIR + "/tmp"
TEMPLATE_DIR = ALMA_DIR + "/templates/"

SYNTH_FILE_PATH = TMP_DIR + "/yosys_synth.ys"
TEMPLATE_FILE_PATH = TEMPLATE_DIR + "/yosys_synth_template.txt"

# vpython3 = "%s/dev/bin/python3" % ALMA_DIR
vpython3 = "python3"


def create_labels(top_module):

    create_labels_cmd = \
    """%s %s/create_labels.py \
        --top-module %s \
        --source tmp/circuit.v \
        --json tmp/circuit.json \
        --label tmp/labels.txt 
    """ % (vpython3, ALMA_DIR, top_module)

    print(create_labels_cmd)
    return create_labels_cmd


    
def create_yosys_script(top_module):
    design_files = os.listdir(DESIGN_DIR)
    design_files = [d for d in design_files if d.endswith(".vhdl")]

    # print(design_files)

    yosys_script = ""
    with open(TEMPLATE_FILE_PATH) as template_file:
        yosys_script += template_file.read()
    assert("{READ_FILES}" in yosys_script)
    read_verilog_commands = "ghdl %s -e %s ;\n\n" % (" ".join(design_files),top_module)
    yosys_script = yosys_script.replace("{READ_FILES}", read_verilog_commands)
    assert("{TOP_MODULE}" in yosys_script)
    yosys_script = yosys_script.replace("{TOP_MODULE}", top_module)
    assert("{JSON_FILE_PATH}" in yosys_script)
    yosys_script = yosys_script.replace("{JSON_FILE_PATH}", "/tmp/circuit.json")
    assert("{NETLIST_FILE_PATH}" in yosys_script)
    yosys_script = yosys_script.replace("{NETLIST_FILE_PATH}", "/tmp/circuit.v")
    with open(SYNTH_FILE_PATH, "w") as f:
        f.write(yosys_script)

def cmd_exec(cmd):
    # print(cmd)
    _cmd = cmd
    cmd = cmd.split()
    print(cmd)
    res = sp.run(args=cmd, capture_output=True)
    print("returncode: ",res.returncode)
    if res.returncode:
        
        error_text = "\nParsing failed, Error command:"
        # colored_text =termcolor.colored(error_text,color='red')
        # print("")
        print("\n%s %s" % (error_text,_cmd))
        print(res.stdout.decode("utf-8"))

        sys.exit(res.returncode)
    

def yosys_exec(top_module):
    create_yosys_script(top_module)
    yosys_cmd = \
    """sudo docker run --rm -t \
      -v %s:/src \
      -v %s:/tmp \
      -w /src \
      hdlc/ghdl:yosys \
      yosys -m ghdl /tmp/yosys_synth.ys
    """ % (DESIGN_DIR, TMP_DIR)
    # cmd_exec(yosys_cmd)
    print(yosys_cmd)
    return yosys_cmd

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
