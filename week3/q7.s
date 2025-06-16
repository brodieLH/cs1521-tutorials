# A Short program that will load each element of an array, add 42 to it if 
# it is a negative number, and then store it back if it was modified.
N_SIZE = 10
	.text
main:
	# $t0: int i
	# $t1: offset calculation
	# $t2: numbers[i] that we may add to
main_loop_init:
	li	$t0, 0				# int i = 0

main_loop_cond:
	bge	$t0, N_SIZE, main_loop_end	# if (i >= N_SIZE) goto end

main_loop_body:
	mul	$t1, $t0, 4			# offset = i * 4
	lw	$t2, numbers($t1)		# load value at numbers[i] to $a0

	bge	$t2, 0, main_loop_step		# if numbers[i] >= 0 goto step

	add	$t2, $t2, 42			# numbers[i] += 42
	sw	$t2, numbers($t1)		

main_loop_step:
	addi	$t0, 1				# i += 1
	b	main_loop_cond			# goto condition

main_loop_end:
	li	$v0, 0				# return 0
	jr	$ra

	.data
numbers: 
	.word 0, 1, 2, -3, 4, -5, 6, -7, 8, 9	# int numbers[N_SIZE] = 
						# {0, 1, 2, -3, 4, -5, 6, -7, 8, 9};