# A short program that reverses an array by swapping elements.
# Note that since we end up using more registers, we need more documentation. 

# Constants
N_SIZE = 10
N_SIZE_M_1 = N_SIZE - 1
N_SIZE_D_2 = N_SIZE / 2

        .text
	# $t0 = int i
	# $t1 = i offset 
	# $t2 = numbers[i] temp
	# $t3 = N_SIZE_M_1 - i offset
	# $t4 = numbers[N_SIZE_M_1 - i] temp
main:
init:
cond:
body:
step:
end:
        jr      $ra                     # return

        .data

numbers:
        .word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9      # int numbers[N_SIZE] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}