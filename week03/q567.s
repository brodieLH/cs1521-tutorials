# A program that mixes q5/6/7 from this weeks tutorial, we will scan in 10 digits, positive
# and negative, print them and then add 42 to any positive numbers and print them again
N_SIZE = 10
	.text
main:
	# $t0: int i
	# $t1: offset calculation
	# $t2: numbers[i] that we may add to

read_loop_init:
	li	$t0, 0				# int i = 0

read_loop_cond:
	bge	$t0, N_SIZE, read_loop_end	# if (i >= N_SIZE) goto end

read_loop_body:
	li	$v0, 5				# scanned value in $v0	syscall
	syscall

	# offset will be i * 4 as it is an array of words (4 bytes)
	mul	$t1, $t0, 4			# offset = i * 4
	sw	$v0, numbers($t1)		# store value in $v0 at numbers[i]

read_loop_step:
	addi	$t0, 1				# i += 1
	b	read_loop_cond			# goto condition

read_loop_end:
print_loop_init:
	li	$t0, 0
print_loop_cond:
	bge	$t0, N_SIZE, print_loop_end	# if (i >= N_SIZE) goto end
print_loop_body:
	# ADD 42 FUNCTIONALITY
	mul	$t1, $t0, 4			# offset = i * 4
	lw	$t2, numbers($t1)		# load value at numbers[i] to $a0

	bge	$t2, 0, print_loop_body_print	# if numbers[i] >= 0 goto print

	add	$t2, $t2, 42			# numbers[i] += 42
	sw	$t2, numbers($t1)

print_loop_body_print:
	# PRINT FUNCTIONALITY
	# offset will be i * 4 as it is an array of words (4 bytes)
	lw	$a0, numbers($t1)		# load value at numbers[i] to $a0


	li	$v0, 1				#printf("%d\n", numbers[i])
	syscall

	li	$a0, '\n'
	li	$v0, 11
	syscall
print_loop_step:
	addi	$t0, 1				# i += 1
	b	print_loop_cond			# goto condition
print_loop_end:
	li	$v0, 0				# return 0
	jr	$ra
	.data
numbers: 
	.word 0:N_SIZE 			# array of N_SIZE init to 0	
#numbers: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 	# int numbers[10] = {0};