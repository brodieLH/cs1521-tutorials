	.text
main:
		li	$v0, 5
		syscall
 	.data
one: 	.byte 'a'
two: 	.word 3
three: 	.byte 'b'
four: 	.half 5
one_d: .word 1, 2, 3, 4, 5, 6
two_d: .word 1, 2, 3
	   .word 4, 5, 6
