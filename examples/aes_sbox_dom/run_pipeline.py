import os, sys
import subprocess as sp

AES_DIR = os.path.dirname(os.path.realpath(__file__))
DESIGN_DIR = AES_DIR + "/design"
ALMA_DIR = "/".join(AES_DIR.split("/")[:-2])
TMP_DIR = ALMA_DIR + "/tmp"


##### TRACING

# trace = \
# """
# python3 %s/trace.py 
#     --testbench %s/verilator_tb.cpp 
#     --netlist %s/tmp/circuit.v
#     -d %s/tmp/
# """ % (ALMA_DIR, AES_DIR, AES_DIR, AES_DIR)

# print(trace)
# res = sp.call(trace.split())

# if res:
#     print("Tracing failed")
#     sys.exit(res)

##### VERIFICATION
top_module = "aes_sbox"

verify = \
"""
python3 %s/verify.py 
    --top-module %s 
    --json %s/tmp/circuit.json 
    --vcd %s/tmp/tmp.vcd
    --label %s/labels.txt 
    --rst-name rst_i
    --rst-phase 1
    --rst-cycles 0
    --cycles 8
    --mode transient 
    --probing-model time-constrained
""" % (ALMA_DIR, top_module, AES_DIR, AES_DIR, AES_DIR)

print(verify)
res = sp.call(verify.split())

    # --mode transient 
    # --probing-model classic

    # --mode stable 
    # --probing-model time-constrained

    # --mode transient 
    # --probing-model time-constrained

    # --mode stable 
    # --probing-model classic
