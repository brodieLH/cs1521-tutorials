# A short program that reverses an array by swapping elements.
# Note that since we end up using more registers, we need more documentation. 

# Constants
N_SIZE = 10
N_SIZE_M_1 = N_SIZE - 1
N_SIZE_D_2 = N_SIZE / 2

        .text
	# $t0 = int i
	# $t1 = i offset 
	# $t2 = numbers[i] temp
	# $t3 = N_SIZE_M_1 - i offset
	# $t4 = numbers[N_SIZE_M_1 - i] temp
main:
init:
	li	$t0, 0			#int i = 0
cond:
	bge	$t0, N_SIZE_D_2, end	# if (i >- N_SIZE_D_2) goto end;
body:
	mul	$t1, $t0, 4		# Offset for numbers[i]
	lw	$t2, numbers($t1)	# $t2 = numbers[i]

	sub	$t3, N_SIZE_M_1, $t0 	# N_SIZE_M_1 - i
	mul	$t3, $t3, 4		# Offset for numbers[N_SIZE_M_1 - i]

	lw	$t4, numbers($t3)	# $t4 = numbers[N_SIZE_M_1 - i]

	sw	$t2, numbers($t3) 	# numbers[i] = y;
	sw	$t4, numbers($t1) 	# numbers[N_SIZE_M_1 - i] = x;
step:
	addi	$t0, 1
	b	cond
end:
        jr      $ra                     # return

        .data

numbers:
        .word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9      # int numbers[N_SIZE] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}