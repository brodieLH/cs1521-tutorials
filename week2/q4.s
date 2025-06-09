# Prints the square of a number
# x,y in $t0, $t1
	.text
main:                           	
        la      $a0, prompt_str    	# printf("Enter a number: ");
        li      $v0, 4			# print string syscall
        syscall

        li      $v0, 5          	# scanf("%d", x);
        syscall
        move    $t0, $v0

        mul     $t1, $t0, $t0   	# y = x * x

        move    $a0, $t1                # printf("%d", y);
        li      $v0, 1
        syscall

        li      $a0, '\n'       	# printf("%c", '\n');
        li      $v0, 11
        syscall

	li	$v0, 0
        jr      $ra             	# return 0

        .data
prompt_str:
        .asciiz "Enter a number: "