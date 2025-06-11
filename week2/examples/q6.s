	.text
main:

       	li	$v0, 0				# return 0
	jr	$ra

	.data
enter_num_prompt: .asciiz "Enter a number: "
medium_string: .asciiz "medium"
small_big_string: .asciiz "small/big"
