       .text
	.globl  main
main:
	li	   $t1, 4
    li	   $t2, 5
    addu   $t3,$t1,$t2

	# Afisam =
	la 	$a0, egal	 	# load the addr of hello_msg into $a0.
	li 	$v0, 4 			# 4 is the print_string syscall.
	syscall 			# do the syscall.

	## Afisam $t3
	move 	$a0, $t3 	# move the number to print into $a0.
	li 	$v0, 1 			# load syscall print_int into $v0.
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
