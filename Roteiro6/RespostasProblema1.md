# Respostas do Roteiro 6 

>**Aluno:** João Vitor de Souza Mota - 120111057

>**Professora:** Joseana Macêdo Fechine

## Problema 1 - Código em Assembly

Implementar, a partir do arquivo inst.s, o trecho de código abaixo para RISC-V.

```
.text
main:
        addi a0, zero, 1
        add a1, a0, a0
        addi a2, zero, 5
loop:   
        beq a0, a2, fim
        slli a1, a1, 1
        addi a0, a0, 1
        j loop
fim:
        nop
```

>1) Qual é a operação realizada pelo código acima?

```

``` 
>2) Qual é o conteúdo (em decimal) dos registradores a0, a1 e a2 ao final da execução do programa?

```
a0 : 0x00000005
a1 : 0x00000020
a2 : 0x00000005
```

>3) Quais são os valores de loop e fim?

```
loop : -12
fim  : 16
```

>4) Adicione "prints" da tela do ambiente remoto ao arquivo PDF. Esses "prints" deverão mostrar todo o ambiente, incluindo o código em Assembly que foi executado e os valores exibidos na interface após a execução de cada instrução (código de máquina, pc e demais registradores envolvidos).
