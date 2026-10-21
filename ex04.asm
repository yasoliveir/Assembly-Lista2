# Receba 4 notas bimestrais de um aluno. Calcule e mostre a média aritmética. Mostre a mensagem de acordo com a média:
# a. Se a média for >= 6,0 exibir “APROVADO”;
# b. Se a média for >= 3,0 ou < 6,0 exibir “EXAME”;
# c. Se a média for < 3,0 exibir “RETIDO”.
.data
	n1: .asciiz "Primeira Nota: "
	n2: .asciiz "Segunda Nota: "
	n3: .asciiz "Terceira Nota: "
	n4: .asciiz "Quarta Nota: "
	media: .asciiz "\nMédia: "
	msg1: .asciiz "\nSituação: Aprovado"
	msg2: .asciiz "\nSituação: Exame"
	msg3: .asciiz "\nSituação: Retido"
.text
.globl main
main: 
	li $v0, 4
	la $a0, n1
	syscall
	li $v0, 5
	syscall
	move $t1, $v0 # t1 = nota 1
	
	li $v0, 4
	la $a0, n2
	syscall
	li $v0, 5
	syscall
	move $t2, $v0 # t2 = nota 2
	
	li $v0, 4
	la $a0, n3
	syscall
	li $v0, 5
	syscall
	move $t3, $v0 # t3 = nota 3
	
	li $v0, 4
	la $a0, n4
	syscall
	li $v0, 5
	syscall
	move $t4, $v0 # t4 = nota 4
	
	add $t5, $t1, $t2 # t5 = nota 1 + nota 2
	add $t6, $t5, $t4 # t6 = nota 3 + nota 4
	add $t5, $t5, $t6 # t5 = t6 + t5
	
	div $t7, $t5, 4 #dividir a soma das notas / 4

	bge $t7, 6, aprovado
	bge $t7, 3, exame
	blt $t7, 3, retido
	
aprovado:
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 1
	move $a0, $t8
	syscall
	j fim

exame:
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0, 1
	move $a0, $t8
	syscall
	j fim

retido:
	li $v0, 4
	la $a0, msg3
	syscall
	li $v0, 1
	move $a0, $t8
	syscall
	j fim
	
fim:
	li $v0, 4
	la $a0, media
	syscall
	li $v0, 1
	move $a0, $t7
	syscall
	
	li $v0, 10
	syscall