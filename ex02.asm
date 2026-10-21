#Receba o raio de uma circunferência. Calcule e mostre o comprimento da circunferência. Considere PI = 3
.data
	raio: .asciiz "Raio: "
	comp: .asciiz "Comprimento: "
.text
.globl main
main:
	li $v0, 4
	la $a0, raio
	syscall
	li $v0, 5
	syscall
	move $t0, $v0
	
	mul $t1, $t0, 6 #Pi = 3. Comprimento da circunferencia é 2 * Pi * raio.. ou seja: raio * 6
	
	li $v0, 4
	la $a0, comp
	syscall
	li $v0, 1
	move $a0, $t1
	syscall
	
	li $v0, 10
	syscall
	