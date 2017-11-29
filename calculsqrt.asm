.text 
main :	li $v0, 6
	syscall
	mov.s $f1,$f0 #On met le float saisie dans $f1 qui deviendra l'argument de la fonction sqrt pour lequel on calcule la racine
	j sqrt

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
