def sbox_inverse(X):
	a = X & 0x01
	b = (X & 0x02) >> 1
	c = (X & 0x04) >> 2
	d = (X & 0x08) >> 3
	x = 1 + d + a*b + b*c + c*d + a*b*d + a*c*d
	y = 1 + a*c + b*c + b*d + c*d + a*b*c
	z = a + c + a*b + a*c + b*c + b*d + a*b*c + a*b*d
	t = 1 + a + b + a*b + a*c + b*c + c*d + a*b*c + a*c*d + b*c*d
	x %= 2
	y %= 2
	z %= 2
	t %= 2
	return x+2*y+4*z+t*8

def sbox(X):
	a = X & 0x01
	b = (X & 0x02) >> 1
	c = (X & 0x04) >> 2
	d = (X & 0x08) >> 3
	x = 1 + c + d + a*b + b*c + a*d + c*d + a*b*c
	y = 1 + a*c + b*c + b*d + a*b*c + b*c*d
	z = a + d + a*b + a*d + b*d + a*b*d + b*c*d
	t = 1 + b + d + b*c + c*d + a*b*c + a*b*d + a*c*d	
	x %= 2
	y %= 2
	z %= 2
	t %= 2
	return x+2*y+4*z+t*8

def main():
	for i in range(16):
		print("0x%X ," % sbox_inverse(i), end="")
	print()
	for i in range(16):
		print("0x%X ," % sbox(i), end="")
	print()

if __name__ == '__main__':
	main()
