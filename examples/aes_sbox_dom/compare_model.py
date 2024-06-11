import os, sys
import subprocess as sp

AES_DIR = os.path.dirname(os.path.realpath(__file__))
DESIGN_DIR = AES_DIR + "/design"
ALMA_DIR = "/".join(AES_DIR.split("/")[:-2])
TMP_DIR = ALMA_DIR + "/tmp"

##### VERIFICATION
top_module = "aes_sbox"

model = ["" for i in range(4)]

model[0] = """
    --mode stable 
    --probing-model classic
"""
model[1] = """
    --mode transient 
    --probing-model classic
"""
model[2] = """
    --mode stable 
    --probing-model time-constrained
"""
model[3] = """
    --mode transient 
    --probing-model time-constrained
"""

def gen_cmd(i):
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
	    %s
	""" % (ALMA_DIR, top_module, AES_DIR, AES_DIR, AES_DIR, model[i])
	return verify

def main():
    import argparse

    parser = argparse.ArgumentParser()
    parser.add_argument('--model', metavar='model', required=False, default = 0,
                        help='Choose a model to verify:', type=int)
    args = parser.parse_args()
    cmd = gen_cmd(args.model)
    print(cmd)
    res = sp.call(cmd.split())

if __name__ == '__main__':
	main()
    # --mode stable 
    # --probing-model classic

    # --mode transient 
    # --probing-model classic

    # --mode stable 
    # --probing-model time-constrained

    # --mode transient 
    # --probing-model time-constrained

