

.text 
main :	li $v0, 6
	syscall
 #On met le float saisie dans $f1 qui deviendra l'argument de la fonction bn
	jal bn

#bn.asm
.data
two : .float 2.0
one : .float 1.0

.text
bn : 	
	#$f1 = nbCote
	#$f0 = sqrt(2)
	#$f1 = $t0/2 = sqrt(2)/2
	#$f2 = $a0/2 = nbCote/2
	#$f3 = longueur($t2) = longueur(nbCote/2)
	#$f4 = $t3^2 = longueur(nbCote/2)^2
	#$f5 = 1-$t4 = 1 - longueur(nbCote/2)^2
	#$f6 = sqrt($t5) = sqrt(1-longueur(nbCote/2)^)
	#$f7 = 1 + $t6
	#$f8 = sqrt($t7)
	#$f9 = 
	l.s $f2, two
	l.s $f3, one
	subi $sp, $sp, 8
	sw $ra, 4($sp)
	mov.s $f1, $f0
	s.s $f1, 0($sp)

exit_bn:
	lw $ra, 4($sp)
	l.s $f1, 0($sp)
	addi $sp, $sp, 8
	jr $ra

bn2 :	
	
	

if_nbcote2 : 
	blt $t1, $t2 
then_nbcote2:
	li $t3, 1
else_nbcote2:



# sqrt.asm

.data

eps:	.float 0.0001
init:	.float 1.0
two:	.float 2.0

.text
sqrt:	
	l.s $f0, init
	l.s $f4, eps
	
test:	mul.s $f2, $f0, $f0
	sub.s $f2, $f1, $f2
	abs.s $f2, $f2
	c.le.s $f2, $f4
	bc1t end
	div.s $f2, $f1, $f0
	add.s $f2, $f0, $f2
	l.s $f3, two
	div.s $f2, $f2, $f3
	mov.s $f0, $f2
	j test
	
end:	
	mov.s $f12, $f0
	li $v0, 2
	syscall
	# Exits the program
	li $v0, 10
	syscall


			
