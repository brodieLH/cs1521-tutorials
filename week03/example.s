    .text
main:
	li	$t1, 42
	la 	$t0, test # address of label
	#offset
	# i * size of value (int = 4, char = 1)
	# add address and offset 
	mul	$t3, $t2, 4 # i * 4
	add	$t4, $t0, $t3 #address + offset
		     #address
	sw	$t1, test($t3)
    .data
test: 	.word 1, 2, 3, 4