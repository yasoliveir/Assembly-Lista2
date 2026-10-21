.data 
	msg1: .asciiz "\nDigite um numero: "
	msg2: .asciiz "\nO maior numero é: "
	msg3: .asciiz "\nO menor numero é: "
	msgerro: .asciiz "\nValor invalido, O numero não pode ser 0 ou negativo."
.text
main:
#chama mensagem 1
li $v0, 4
la $a0, msg1
syscall

li $v0, 5
syscall

move $t0, $v0 #maior
move $t1, $v0 #menor
ble $t1, 0, erro2 #verifica se é menor ou igual a 0

li $t2, 9 #define o contador para 9 numeros restantes

contador:
beq $t2, 0, fim #verifica se o contador é 0

#chama mensagem 1 dnv
li $v0, 4
la $a0, msg1
syscall

li $v0, 5
syscall
move $t3, $v0 #regista o novo numero
ble $t3, 0, erro #verifica se é menor ou igual a 0

#verifica se é maior que a altura anterior
ble $t3, $t0, menor #compara com a maior altura atual
move $t0, $t3 #se não pular é a nova maior
j continua

erro: 
#mensagem de erro
li $v0, 4
la $a0, msgerro
syscall
j contador

erro2: 
#mensagem de erro
li $v0, 4
la $a0, msgerro
syscall
j main

menor:
#verifica a menor altura
bge $t3, $t1, continua #se foi maior que a menor altura continua
move $t1, $t3 #se não é a nova menor

continua:
addi $t2, $t2, -1 #diminui 1 no contador
j contador

li $v0, 1
move $a0, $t0
syscall

fim:
#chama a maior altura
li $v0, 4
la $a0, msg2
syscall

li $v0, 1
move $a0, $t0
syscall

#chama a menor altura
li $v0, 4
la $a0, msg3
syscall

li $v0, 1
move $a0, $t1
syscall