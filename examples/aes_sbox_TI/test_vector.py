def reverse_bits():
	return int("{:08d}".format(int(bin(n)[2:]))[::-1], 2)

def main():
	a = 161^198
	print("%2x" % a)
	b = 41^163^139^105
	print("%2x" % b)

if __name__ == '__main__':
	main()
