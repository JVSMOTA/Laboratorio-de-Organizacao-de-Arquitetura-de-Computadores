# Problema 1 - Código em Assembly (Fatorial de N)

.text
main:
    addi a0, zero, 4               # Variável N
    li a4, 1
    add a4, a4, a4                 # a4 = 2
    add a1, zero, a0               # aux = N  
loop:
    beq a1, zero, fimIgualZeroOuUm # if (N == 0) {fim()}
    beq a1, a4, fim                # if (N == 2) {fim()}
    addi a1, a1, -1                # aux -= 1
    mul a3, a0, a1                 # a3 = N * aux
    add a0, zero, a3               # a0 = a3
	j loop                         # loop()

fimIgualZeroOuUm:
	addi a0, zero, 1
    nop
fim:
    nop