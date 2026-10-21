#Receba os valores do comprimento, largura e altura de um paralelepípedo. Calcule e mostre seu volume
.data
	comp: .asciiz "Comprimento: "
	largura: .asciiz "Largura: "
	altura: .asciiz "Altura: "
	vol: .asciiz "Volume: "
.text
.globl main
main:
	li $v0, 4
	la $a0, comp
	syscall
	li $v0, 5 #num inteiro
	syscall
	move $t0, $v0 # $t0 = valor comprimento 
	
	li $v0, 4
	la $a0, largura
	syscall
	li $v0, 5
	syscall
	move $t1, $v0 # $t1 = valor largura
	
	li $v0, 4
	la $a0, altura
	syscall
	li $v0, 5
	syscall
	move $t2, $v0 # $t2 = valor altura
	
	mul $t3, $t0, $t1
	mul $t4, $t3, $t2
	
	li $v0, 4
	la $a0, vol
	syscall
	li $v0, 1
	move $a0, $t4
	syscall
	
	li $v0, 10
	syscall