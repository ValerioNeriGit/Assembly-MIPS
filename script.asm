.data
lung:    .word 8
vettore: .word 5, 2, 12, -4, 6, -1, 5, 4
.text

	#indirizzo vettore
	la $a0, vettore
	#lunghezza
	lw $a1, lung
	
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal min
	addi $sp, $sp, 4 
	jr $ra
	
	jal fine
	
	
min:	#primo elemento come minore
	
	move $t0, $a0
	move $t1, $a1

	lw $v0, 0($t0)
	addi $t1, $t1, -1


ciclo:	addi $t1, $t1, -1
	addi $t0, $t0, 4
	lw $t2, 0($t0)
	
	slt $t3, $t2, $zero
	beq $t3, 1, skip
	
	slt $t3, $t2, $v0
	beq $t3, 0, skip
	move $v0, $t2
	
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal print
	
skip:	bne $t1, $zero, ciclo

	jr $ra
	
print:	li $v0, 1
	syscall
	lw $ra, 0($sp)      # reload $ra so we can return to caller
	addi $sp, $sp, 4 
	jr $ra
	
fine:	li $v0, 10
	syscall
