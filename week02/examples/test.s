# just a sample file for showing how to use Mipsy Editor Features
	.text
main:
	li	$t0, 40			# int x = 40

	la	$a0, hello		# printf("Hello World")
	li	$v0, 4
	syscall

	li	$a0, '\n'		# printf("\n")
	li	$v0, 11
	syscall

	addi	$t0, 2			# x += 2

	move	$a0, $t0
	li	$v0, 1			# printf("%d, x)
	syscall				

	li	$v0, 0
	jr	$ra


	.data
hello:	.asciiz "Hello World!"