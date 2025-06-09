# Print every third number from 24 to 42.
# Locals:
# x in $t0
	.text
main:            
        li	$t0, 24			# int x = 24;
main_loop_cond:
	bge	$t0, 42, main_loop_end	# if (x >= 42) goto loop_end;

	move	$a0, $t0		# printf("%d", x);
	li	$v0, 1
	syscall

	li	$a0, '\n'		# printf("\n");
	li	$v0, 11
	syscall

	addi	$t0, 3			# x += 3;

	b	main_loop_cond 		# goto loop_cond;

main_loop_end:
	li	$v0, 0			# return 0;
	jr	$ra
