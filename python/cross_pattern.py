n = int(input("Enter rows: "))
char  = 65
for i in range(n):
	for j in range(n):
		if i == j or i + j == n - 1:
			print(chr(char), end=' ')
		else:
			print(' ', end=' ')
	char += 1
	print()
