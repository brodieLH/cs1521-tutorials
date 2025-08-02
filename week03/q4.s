	.text
main:
	li	$v0, 5			# just a read from stdin syscall to stall
	syscall				# while we look at the memory segment

	.data
aa: 	.word 42
bb: 	.word 666
cc: 	.word 1
	.word 3
	.word 5
	.word 7