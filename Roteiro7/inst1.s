# Problema 1 - Código em Assembly (Fatorial de N)

.text
main:
	addi a0, x0, 1                 # 1 - Print Int
    addi a1, zero, 5               # Variável N
    li a4, 2                       # a4 = 2
    add a2, zero, a1               # aux = N  
loop:
    beq a2, zero, fimIgualZeroOuUm # if (N == 0) {fim()}
    beq a2, a4, fim                # if (N == 2) {fim()}
    addi a2, a2, -1                # aux -= 1
    mul a3, a1, a2                 # a3 = N * aux
    add a1, zero, a3               # a0 = a3
	j loop                         # loop()

fimIgualZeroOuUm:
	addi a1, zero, 1
    nop
fim:
    nop
    ecall
