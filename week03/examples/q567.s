# A program that mixes q5/6/7 from this weeks tutorial, we will scan in 10 digits, positive
# and negative, print them and then add 42 to any positive numbers and print them again
N_SIZE = 10
	.text
main:
	# $t0: int i
	# $t1: offset calculation
	# $t2: numbers[i] that we may add to

read_loop_init:
read_loop_cond:
read_loop_body:
read_loop_step:
read_loop_end:
print_loop_init:
print_loop_cond:
print_loop_body:
print_loop_body_print:
print_loop_step:
print_loop_end:
	li	$v0, 0				# return 0
	jr	$ra

	.data
numbers: 
	.word 0:N_SIZE 			# array of N_SIZE init to 0	
#numbers: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 	# int numbers[10] = {0};