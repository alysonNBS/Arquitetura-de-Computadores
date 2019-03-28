.data
c: .word 0

.text
la $s0, c


li $t0, 0
CARREGA_NUMEROS_ALEATORIOS:
	# gerar numero aleatorio armazenado em a0
	li $v0, 41
	xor $a0, $a0, $a0
	syscall

	add $t1, $t0, $t0
	add $t1, $t1, $t1
	add $t1, $t1, $s0

	sw $a0, 0 ($t1)

	add $t0, $t0, 1
bne $t0, 10, CARREGA_NUMEROS_ALEATORIOS

# Ordena as dez primeiras posicoes de memoria apartir de s0
# Selection Sort
li $t0, 0
LOOP1:
	add $t1,$t0, 1
	
	LOOP2:
		add $t2, $t0, $t0
		add $t2, $t2, $t2
		add $s1, $t2, $s0
		
		add $t3, $t1, $t1
		add $t3, $t3, $t3
		add $s2, $t3, $s0
		
		lw $t2, 0 ($s1)
		lw $t3, 0 ($s2)
		
		slt $t4, $t3, $t2
		
	
		beq $t4, $zero, END_LOOP2
		
		add $t4, $t2, $zero
		add $t2, $t3, $zero
		add $t3, $t4, $zero
		
		sw $t2, 0 ($s1)
		sw $t3, 0 ($s2)
		
		END_LOOP2:
		add $t1, $t1, 1
	bne $t1, 10, LOOP2

	END_LOOP1:
	add $t0, $t0, 1
bne $t0, 9, LOOP1
		