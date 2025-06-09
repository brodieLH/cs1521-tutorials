# Prints the square of a number
# x,y in $t0, $t1
	.text
main:                           	

	li	$v0, 0
        jr      $ra             	# return from main

        .data
prompt_str:
        .asciiz "Enter a number: "