# Sum 4 numbers using function calls.
# Note the use of the stack to save $ra in main, 
# and $ra $a0, $a1, $s0 in sum2.
# For simplicity we are not using a frame pointer
# Only push/pop are needed for this.

main:
main__prologue:
	push	$ra		# as main calls other functions we must preserve $ra

main__body:
	li	$a0, 11		# arg a
	li	$a1, 13		# arg b
	li	$a2, 17		# arg c
	li	$a3, 19		# arg d

	jal	sum4		# result = sum4(a,b,c,d)
	move	$a0, $v0	# result in $a0 for printing

	li	$v0, 1		# printf("%d", result)
	syscall

	li	$a0, '\n'	# printf("\n")
	li	$v0, 11
	syscall

main__epilogue:
	pop	$ra

	li	$v0, 0		# return 0
	jr	$ra

sum2:
sum2__prologue:
sum2__body:
	add	$v0, $a0, $a1
sum2__epilogue:
	jr	$ra

# sum4
	#
	# Args: 
	#    - $a0 - int a
	#    - $a1 - int b
	#    - $a2 - int c
	#    - $a3 - int d
	#
	# Returns:
	#    - $v0: int
	#
	# Frame:    [$ra, $s0, $s1, $s2, $s3]
	# Uses:     [$ra, $s0, $s1, $s2, $s3, $a0, $v0]
	# Clobbers: [$a0, $v0]
	#
	# Locals:
	#   - $s0: int c
	#   - $s1: int d
	#   - $s2: res1
	#   - $s3: res2
	#
	# Structure:
	#   sum4
	#   -> [prologue]
	#       -> body
	#   -> [epilogue]
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