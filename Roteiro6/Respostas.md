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

### 1) Qual é a operação realizada pelo código acima?

>Uma operação de Loop com Range de tamanho igual a 5 (hexadecimal) de passo tamanho igual a 1 (hexadecimal), enquanto no registrador a1 ocorre o slli (Shift Left Logical by Immediate), que acaba dobrando o valor até atingir o tamanho igual a 20 (hexadecimal).  

### 2) Qual é o conteúdo (em decimal) dos registradores a0, a1 e a2 ao final da execução do programa?

>a0 : 5
>
>a1 : 32
>
>a2 : 5


### 3) Quais são os valores de loop e fim?

>loop : -12
>
>fim  : 16

### 4) Adicione "prints" da tela do ambiente remoto ao arquivo PDF. Esses "prints" deverão mostrar todo o ambiente, incluindo o código em Assembly que foi executado e os valores exibidos na interface após a execução de cada instrução (código de máquina, pc e demais registradores envolvidos).

>

## Problema 2 - Código de Máquina

Implementar, a partir do arquivo inst.101, o trecho de código abaixo para RISC-V.

```
0x00200513
0x00400593
0x00b50663
0x00a50633
0x0080006f
0x00b58633
0x00000013
```

### 1) Qual é o código em Assembly correspondente?

```
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
```

### 2) Qual é a operação realizada pelo código acima?

> No PC = 00, adiciona o valor 2 ao registrador a0; no PC = 04, adiciona o valor 4 ao registrador a1; no PC = 0C, faz o beq (Bench if equal) entre a0 e a1, caso seja verdadeiro pula para o fim do código; no PC = 10, adiciona o valor do registrador a0 (2) somado mais a0 (2) em a2, resultando a2 = 4; no PC = 14, faz-se o jal (Jump and link) para o local chamado 'pulo' que representa um acréscimo de 8 instruções, caindo diretamente em nop, encerrando o código.    

### 3) Quais são os registradores utilizados no código?

>x10
>
>x11
>
>x12

### 4) Quais são os conteúdos desses registradores ao final da execução do programa?

>x10 = 0x00000002
>
>x11 = 0x00000004
>
>x12 = 0x00000004

### 5) Adicione "prints" da tela do ambiente remoto ao arquivo PDF. Esses "prints" deverão mostrar todo o ambiente, incluindo o código em Assembly que foi executado e os valores exibidos na interface após a execução de cada instrução (código de máquina, pc e demais registradores envolvidos).

>
