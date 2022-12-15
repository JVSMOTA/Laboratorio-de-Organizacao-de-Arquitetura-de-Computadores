# Problema 2 - Código em Assembly (Leitura e Escrita na Memória de Dados)

.text
    addi a0, x0, 4             # 4 = Print string
    la a1, teste               # a1 - endereco que aponta para string
    ecall                      # Call para saida - string

.data                          # memoria de dados (0x10000000)
teste:
    .asciiz "RISC-V!\n"        # string
