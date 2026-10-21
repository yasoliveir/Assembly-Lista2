# Receba 2 números inteiros, verifique qual o maior entre eles. Calcule e mostre o resultado da somatória 
#dos números ímpares entre esses valores
.data
	x1: .asciiz "Primeiro numero: "
	x2: .asciiz "Segundo numero: "
	maior: .asciiz "Maior numero: "
	igual: .asciiz "os números são iguais.\n"
	soma:  .asciiz "\n A soma dos impares entre eles são: "
.text
.globl main
main:
	li $v0, 4
	la $a0, x1
	syscall
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $v0, 4
	la $a0, x2
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	
	beq $t0, $t1, iguais
	blt $t0, $t1, maior_x1


maior_x1: 
	move $t2, $t0
	move $t3, $t1
	syscall 
	li $v0, 4
	la $a0, maior
	syscall 
	li $v0, 1
	move $a0, $t2
	syscall
	j  calc_impares

iguais:
	li $t4, 0
	addi $t5, $t3, 1 
calc_impares:
	li $t4, 0
	addi $t5, $t3, 1
loop:
	bge $t5, $t2, fim_loop
	li $t6, 2
	rem $t7, $t5, $t6
	beqz $t7, proximo
	add $t4, $t4, $t5
 
proximo:
 	addi $t5, $t5, 1
 	j loop
fim_loop:
 	li $v0, 4
 	la $a0, soma
	syscall
 	li $v0, 1 
 	move $a0, $t4
 	syscall
 	li $v0, 10
 	syscall