.text
main:
    addi a0, zero, 2
    addi a1, zero, 4
    beq a0, a1, fim
    add a2, a0, a0
    jal zero, pulo
fim:
    add a2, a1, a1
pulo:
	nop
