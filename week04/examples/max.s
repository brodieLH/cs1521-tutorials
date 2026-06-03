max:
    # Frame:    [...]   <-- FILL THESE OUT!
    # Uses:     [...]
    # Clobbers: [...]
    #
    # Locals:           <-- FILL THIS OUT!
    #   - ...
    #
    # Structure:        <-- FILL THIS OUT!
    #   max
    #   -> [prologue]
    #       -> body
    #   -> [epilogue]
max__prologue:
max__epilogue:

	jr	$ra			# return;


main:
main__prologue:
main__body:
main__epilogue:
	jr	$ra			# return 0;


.data
array:
	.word 1, 2, 3, 4, 5, 6, 4, 3, 2, 1
