	.text
main:
	# $t0 will store x
	la 	$a0, enter_num_prompt		# printf("Enter a number: ");
	li	$v0, 4
	syscall

	li	$v0, 5				# scanf("%d", &x);
	syscall
	move 	$t0, $v0			# store scanned value in $t0

	ble 	$t0, 100, small_big_case	# if (x <= 100) goto small_big_case;
	bge	$t0, 1000, small_big_case	# if (x >= 1000) goto small_big_case;

	la	$a0, medium_string		# printf("medium");
	li	$v0, 4
	syscall

	li	$a0, '\n'			# printf("\n")
	li	$v0, 11
	syscall

	b	epilogue			# goto epilogue

small_big_case: 
	la	$a0, small_big_string		# printf("small/big");
	li	$v0, 4
	syscall

	li	$a0, '\n'			# printf("\n")
	li	$v0, 11
	syscall

epilogue:
	li	$v0, 0				# return 0
	jr	$ra

	.data
enter_num_prompt: .asciiz "Enter a number: "
medium_string: .asciiz "medium"
small_big_string: .asciiz "small/big"