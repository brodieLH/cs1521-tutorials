main:
main__prologue:
	push	$ra		# as not a leaf function push $ra

main__body:
	jal	function	# function()	
main__epilogue:
	pop 	$ra		# pop return address off stack
	li	$v0, 0		# return 0
	jr	$ra

function:
function__prologue:
	# no $ra as this is a leaf function (no jal instructions)
	push	$s0		# push $s0
function__body:
	li	$s0, 2		
function__epilogue:
	pop	$s0		# restore $s0
    	jr 	$ra		# return


# If we don't push $ra to the stack, we get an infinite loop in main, as
# we lost the return address main is meant to return to
# main:
# main__prologue:

# main__body:
# 	jal	function	# function()	
# main__epilogue:
# 	li	$v0, 0		# return 0
# 	jr	$ra

# function:
# function__prologue:
# 	push	$s0		# push $s0
# function__body:
# 	li	$s0, 2		
# function__epilogue:
# 	pop	$s0		# restore $s0
#     	jr 	$ra		# return



	






