# This program prints out a danish flag, by
# looping through the rows and columns of the flag.
# Each element inside the flag is a single character.
# (i.e., 1 byte).
#
# (Dette program udskriver et dansk flag, ved at
# sløjfe gennem rækker og kolonner i flaget.)
#

# Constants
FLAG_ROWS = 6
FLAG_COLS = 12

# Registers:
# - row in $t0
# - col in $t1
# - offset in $t2

main:
main__loop_row_init:
	li	$t0, 0					# int row = 0

main__loop_row_cond:
	bge	$t0, FLAG_ROWS, main__loop_row_end	# if row >= FLAG_ROWS goto row_loop_end

main__loop_row_body:
main__loop_col_init:
	li	$t1, 0					# int col = 0

main__loop_col_cond:
	bge	$t1, FLAG_COLS, main__loop_col_end	# if col >= FLAG_COLS goto row_loop_end

main__loop_col_body:
	# row * number of cols * size of element +
	# col * size of element +
	# array address
	mul	$t3, $t0, FLAG_COLS			# row * num of cols
	add	$t3, $t3, $t1				# row offset + col offset
	mul	$t3, 1 					# offset * size of char
							# redundant but good to remember for sizes not 1

	lb	$a0, flag($t3)				# load byte at flag[row][col]
	li	$v0, 11					# printf("%c", flag[row][col]);
	syscall

main__loop_col_step:			
	addi	$t1, 1					# col++
	b	main__loop_col_cond			# goto col_loop_cond

main__loop_col_end:
	li	$a0, '\n'				# printf("\n");
	li	$v0, 11
	syscall

main__loop_row_step:
	addi	$t0, 1					# row++
	b 	main__loop_row_cond			# goto row_loop_cond

main__loop_row_end:
	li	$v0, 0                  		# return 0
	jr	$ra

.data
# This label inside the data region refers to the bytes of the flag.
# Note that even thought the bytes are listed on separate lines,
# they are actually stored as a single contiguous chunk or 'string' in memory.
flag:
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
	.byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'