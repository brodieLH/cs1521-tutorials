SIZE_OF_INT = 4
SIZE_OF_EMPLOYEE =  SIZE_OF_INT * 2
EMPLOYEE_ID_OFFSET = 0
EMPLOYEE_WAGE_OFFSET = 4
	

# struct Employee {
#   int id;
#   int	wage;
# }

	.data
employee:
	.word 	1234567			# id (4 bytes)
	.word 	100100			# wage (4 bytes)

employees: 
	.word	1234567, 100100		# employees[0]		
	.word	7654321, 40012		# employees[1]
	.word   2135123, 0		# employees[2]

# what if we wanted to give employees[2] a wage?
# SIZE_OF_EMPLOYEE * 2 to find our desired struct
# then add EMPLOYEE_WAGE_OFFSET we find
# employees + SIZE_OF_EMPLOYEE * 2 + EMPLOYEE_WAGE_OFFSET is our address

	.text
main:
	li	$t0, 2			
	mul	$t0, SIZE_OF_EMPLOYEE		
	add	$t0, EMPLOYEE_WAGE_OFFSET	# SIZE_OF_EMPLOYEE * 2 + WAGE_OFFSET

	li	$t1, 111111
	sw	$t1, employees($t0)		# employees[2].wage = 111111

	lw	$a0, employees($t0)		# printf("%d", employees[2].wage);
	li	$v0, 1
	syscall

	li	$v0, 0
	jr	$ra
	