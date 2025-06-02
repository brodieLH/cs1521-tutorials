.text

main: 
	li $t0, 12
	li $t1, 30

	add $t2, $t0, $t1  # Add the two numbers

	li $v0, 1          # Syscall value for print integer

	move $a0, $t2      # Move the result to $a0 as print int syscall expects it there
	syscall	    	   # Run syscall, that currently exists in $v0

	li $v0, 0
	jr $ra      	   # return 0 from main
