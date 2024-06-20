def sbox(X):
	# a = X & 0x01
	# b = (X & 0x02) >> 1
	# c = (X & 0x04) >> 2
	# d = (X & 0x08) >> 3
	# e = (X & 0x10) >> 4

	e = X & 0x01
	d = (X & 0x02) >> 1
	c = (X & 0x04) >> 2
	b = (X & 0x08) >> 3
	a = (X & 0x10) >> 4

	x = d*e + a + d
	y = a*e + b + e
	z = a*b + a + c
	t = b*c + b + d
	w = c*d + c + e

	x %= 2
	y %= 2
	z %= 2
	t %= 2
	w %= 2
	# return x+2*y+4*z+t*8+w*16
	return 16*x+8*y+4*z+t*2+w*1

def main():
	for i in range(32):
		print("0x%X, " % sbox(i), end="")
	print()

if __name__ == '__main__':
	main()
