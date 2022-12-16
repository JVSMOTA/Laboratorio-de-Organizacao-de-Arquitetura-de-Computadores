# Problema 2 - Código em Assembly (Leitura e Escrita na Memória de Dados)

.text
main:  
	addi a1, zero, 0xFE
    li x12, 0x000
    lui x12, 0x10000
    sw a1, 0xC (x12)
    lw a0, 0xC (x12)
    