# A Short program that will load each element of an array, add 42 to it if 
# it is a negative number, and then store it back if it was modified.
N_SIZE = 10
	.text
main:

	.data
numbers: 
	.word 0, 1, 2, -3, 4, -5, 6, -7, 8, 9	# int numbers[N_SIZE] = 
						# {0, 1, 2, -3, 4, -5, 6, -7, 8, 9};