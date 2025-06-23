	.text
main:
	li	$v0, 5
	syscall
	
	.data

# struct Student {
#   char[20] name;
#   char[9] zid;
#   int program;
#   double wam;
# }

student:
    .space 20      	# char[20] name; (20 bytes)

    .asciiz "z1234567"  # char[9] zid; (9 bytes)
    
    .align 2       	# Pad to the next word boundary (multiple of 4) 2^2.
                   	# As 29 is not multiple of 4 (32 is next)
    
    .word  42       	# int program; (4 bytes)
                   
    .align 3       	# Pad to the next double-word boundary (multiple of 8) 3^2.
                   	# as 36 is not multiple of 8 (40 is next)

    .double 42.0    	# double wam; (8 bytes)

# Consider how a change of the order of this struct could avoid extra padding