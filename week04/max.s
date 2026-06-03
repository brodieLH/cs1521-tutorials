# Recursive maximum of array function

	# $s0 used for first_element because it needs
	# to keep its value across recursive call
max:
	# Frame:    [$ra, $s0]
	# Uses:     [$a0, $a1, $v1, $s0, $t0]
	# Clobbers: [$a0, $a1, $t0]
	#
	# Locals:
	#   - $a0: array
	#   - $a1: length
	#   - $s0: first_element
	#   - $t0: max_so_far (after function call)
	# Structure:
	#   max
	#   -> [prologue]
	#       -> body
	#           -> base_case
	#           -> length_gt_1
	#           -> ret_max_so_far
	#   -> [epilogue]

max__prologue:
	begin
	push	$ra
	push	$s0			# push $s0 to the stack to save its original value

max__body:
	lw	$s0, ($a0)		# load the value of array[0] into $s0

	bne	$a1, 1, max__length_gt_1	# if (length != 1), go to the recursive case

max__base_case:				# base case of recursion
	move    $v0, $s0		# return first_element
	b	max__epilogue

max__length_gt_1:			# recursive case
	addi	$a0, $a0, 4		# Get the address of array[1] by adding 4 to array
					# Works because each element is 4 bytes in size
	addi	$a1, $a1, -1		# length = length - 1;
	jal	max			# recursive call:
	move	$t0, $v0		# max_so_far = max(&array[1], length - 1);

	ble	$s0, $t0, max__ret_max_so_far	# if (first_element <= max_so_far), goto max__ret_max_so_far
	move	$t0, $s0			# max_so_far = first_element

max__ret_max_so_far:
	move	$v0, $t0		# return value is max_so_far

max__epilogue:
	pop	$s0			# pop $s0 from the stack
	pop	$ra			# pop $ra from the stack
	end

	jr	$ra			# return;


	# some simple test code which calls max
main:
main__prologue:
	push	$ra

main__body:
	la	$a0, array
	li	$a1, 10
	jal	max			# result = max(array, 10)

	move	$a0, $v0
	li	$v0, 1			# syscall 1: print_int
	syscall				# printf("%d", result)

	li	$a0, '\n'
	li	$v0, 11			# syscall 11: print_char
	syscall				# printf("%c", '\n');

	li	$v0, 0

main__epilogue:
	pop	$ra
	jr	$ra			# return 0;


.data
array:
	.word 1, 2, 3, 4, 5, 6, 4, 3, 2, 1