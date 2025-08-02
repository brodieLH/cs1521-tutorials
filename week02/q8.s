# Triangle of *
# the style of this code, regarding labels is what would be expected
# when writing loops for your assignment
	.text
main:                           		# i,j in $t0, $t1
main_loop_one_init:
	li	$t0, 1				# int i = 1

main_loop_one_cond:
	bgt	$t0, 10, main_loop_one_end	# if (i > 10) goto loop_one_end

main_loop_one_body:
main_loop_two_init:
	li	$t1, 0				# int j = 0

main_loop_two_cond:
	bge	$t1, $t0, main_loop_two_end	# if (j >= i) goto loop_two_end

main_loop_two_body:
	li	$a0, '*'			# printf("*")
	li	$v0, 11
	syscall

main_loop_two_step:
	addi	$t1, 1				# j += 1
	b	main_loop_two_cond		# goto loop_two_cond

main_loop_two_end:
	li	$a0, '\n'			# printf("\n")
	li	$v0, 11
	syscall

main_loop_one_step:
	addi	$t0, 1				# i += 1
	b	main_loop_one_cond		# goto loop_one_cond

main_loop_one_end:
	li	$v0, 0				# return 0
	jr	$ra
