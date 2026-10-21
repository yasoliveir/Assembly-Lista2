#Receba 2 valores inteiros. Calcule e mostre o resultado da diferença do maior pelo menor valor.
.data
	x1: .asciiz "Primeiro valor: "
	x2: .asciiz "Segundo valor: "
	dif: .asciiz "Diferença: "
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
	
	bgt $t0, $t1, maior #Se o $t0 > $t1 vá para maior
	sub $t2, $t1, $t0
	j mostrar
	
maior:
	sub $t2, $t0, $t1
	
mostrar:
	li $v0, 4
	la $a0, dif
	syscall
	li $v0, 1
	move $a0, $t2
	syscall
	
	li $v0, 10
	syscall
	
	