## Program to add two plus three 
       .text
	.globl  main

main:
	ori	   $8,$0,0x2   	# put two's comp. two into register 8
    ori    $9,$0,0x3    # put two's comp. three into register 9
    addu   $10,$8,$9    # add register 8 and 9, put result in 10

	# Afisam =
	la 	$a0, egal	 	# load the addr of hello_msg into $a0.
	li 	$v0, 4 			# 4 is the print_string syscall.
	syscall 			# do the syscall.

	## Print out $t2.
	move 	$a0, $t2 	# move the number to print into $a0.
	li  	$v0, 1 			# load syscall print_int into $v0.
	syscall 			# make the syscall.

	# Trecem la linie noua
	la 	$a0, linie_noua # load the addr of hello_msg into $a0.
	li 	$v0, 4 			# 4 is the print_string syscall.
	syscall 			# do the syscall.

	li 	$v0, 10 		# syscall code 10 is for exit.
	syscall 			# make the syscall.

	.data
egal:		.asciiz	"="
linie_noua:	.asciiz	"\n"

## End of file
