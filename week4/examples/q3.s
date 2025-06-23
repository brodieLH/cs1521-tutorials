# Sum 4 numbers using function calls.
# Note the use of the stack to save $ra in main, 
# and $ra $a0, $a1, $s0 in sum2.
# For simplicity we are not using a frame pointer
# Only push/pop are needed for this.

main:
main__prologue:
main__body:
main__epilogue:


sum2:
sum2__prologue:
sum2__body:
sum2__epilogue:
	jr	$ra

sum4:
sum4__prologue:
	push 	$ra
	push	$s0
	push	$s1
	push 	$s2
	push 	$s3

sum4__body:
	move	$s0, $a2		# saving c in $s0
	move	$s1, $a3		# saving d in $s1	

	jal	sum2			# sum2(a, b)
	move	$s2, $v0		# res1 = sum2(a, b)

	move	$a0, $s0
	move	$a1, $s1		
	jal	sum2			# sum(c, d)
	move	$s3, $v0		# res2 = sum2(c, d)

	move	$a0, $s2		
	move	$a1, $s3
	jal	sum2			# sum2(res1, res2)

sum4__epilogue:
	pop	$s3
	pop	$s2
	pop	$s1
	pop	$s0
	pop	$ra
	
	jr	$ra			# return sum2(res1, res2)