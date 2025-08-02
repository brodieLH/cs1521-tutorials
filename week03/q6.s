# A simple program that will print 10 number from an array
N_SIZE = 10
	.text
main:
	# $t0: int i
	# $t1: offset calculation
main_loop_init:
	li	$t0, 0				# int i = 0

main_loop_cond:
	bge	$t0, N_SIZE, main_loop_end	# if (i >= N_SIZE) goto end

main_loop_body:

	# offset will be i * 4 as it is an array of words (4 bytes)
	mul	$t1, $t0, 4			# offset = i * 4
	lw	$a0, numbers($t1)		# load value at numbers[i] to $a0

	li	$v0, 1
	syscall

main_loop_step:
	addi	$t0, 1				# i += 1
	b	main_loop_cond			# goto condition

main_loop_end:
	li	$v0, 0				# return 0
	jr	$ra

	.data
numbers: 
	.word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9	# int numbers[N_SIZE] = {0 -> 9};