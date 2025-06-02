.text

main: 
	li      $t0, 12
	li      $t1, 30

	add     $t2, $t0, $t1 # Add the two numbers

	li      $v0, 1        # Syscall value for print integer

	move    $a0, $t2      # place result in a0 
                          # as print int syscall expects it there
	syscall	    	      # execute syscall, that is in $v0

    li      $a0, '\n'
    li      $v0, 11       # Syscall value for print character
    syscall             

	li      $v0, 0
	jr      $ra      	   # return 0 from main
