main:
sum2:

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