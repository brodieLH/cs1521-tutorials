main:
main__prologue:

main__body:
	jal	function	# function()	
main__epilogue:
	li	$v0, 0		# return 0
	jr	$ra

function:
function__prologue:
	push	$s0		# push $s0
function__body:
	li	$s0, 2		
function__epilogue:
	pop	$s0		# restore $s0
    	jr 	$ra		# return