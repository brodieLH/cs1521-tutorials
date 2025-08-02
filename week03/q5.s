# A simple program that will read 10 numbers into an array
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
	li	$v0, 5				# scanned value in $v0	syscall

	# offset will be i * 4 as it is an array of words (4 bytes)
	mul	$t1, $t0, 4			# offset = i * 4
	sw	$v0, numbers($t1)		# store value in $v0 at numbers[i]

main_loop_step:
	addi	$t0, 1				# i += 1
	b	main_loop_cond			# goto condition

main_loop_end:
	li	$v0, 0				# return 0
	jr	$ra

	.data
numbers: 
	.word 0:N_SIZE 			# array of N_SIZE init to 0	
#numbers: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 	# int numbers[10] = {0};