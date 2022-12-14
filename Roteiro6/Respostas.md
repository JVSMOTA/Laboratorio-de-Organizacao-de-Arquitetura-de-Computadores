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

>a0 = 5, a1 = 32 e a2 = 5.


### 3) Quais são os valores de loop e fim?

>loop = -12 e fim = 16.

### 4) Adicione "prints" da tela do ambiente remoto ao arquivo PDF. Esses "prints" deverão mostrar todo o ambiente, incluindo o código em Assembly que foi executado e os valores exibidos na interface após a execução de cada instrução (código de máquina, pc e demais registradores envolvidos).

| PC | Valores Exibidos |
| -- | -- |
| 00 | ![00](/imagens/Questao1PC00.png) |
| 04 | ![04](/imagens/Questao1PC04.png) |
| 08 | ![08](/imagens/Questao1PC08.png) |
| 0C | ![0C](/imagens/Questao1PC0C.png) |
| 10 | ![10](/imagens/Questao1PC10.png) |
| 14 | ![14](/imagens/Questao1PC14.png) |
| 18 | ![18](/imagens/Questao1PC18.png) |
| 1C | ![1C](/imagens/Questao1PC1C.png) |
| 20 | ![20](/imagens/Questao1PC20.png) |
| 24 | ![24](/imagens/Questao1PC24.png) |
| 28 | ![28](/imagens/Questao1PC28.png) |
| 2C | ![2C](/imagens/Questao1PC2C.png) |
| 30 | ![30](/imagens/Questao1PC30.png) |
| 34 | ![34](/imagens/Questao1PC34.png) |
| 38 | ![38](/imagens/Questao1PC38.png) |
| 3C | ![3C](/imagens/Questao1PC3C.png) |
| 40 | ![40](/imagens/Questao1PC40.png) |
| 44 | ![44](/imagens/Questao1PC44.png) |
| 48 | ![48](/imagens/Questao1PC48.png) |
| 4C | ![4C](/imagens/Questao1PC4C.png) |
| 50 | ![50](/imagens/Questao1PC50.png) |
| 54 | ![54](/imagens/Questao1PC54.png) |

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

> No PC = 00, adiciona o valor 2 ao registrador a0; no PC = 04, adiciona o valor 4 ao registrador a1; no PC = 08, faz o beq (Bench if equal) entre a0 e a1, caso seja verdadeiro pula para o fim do código; no PC = 0C, adiciona o valor do registrador a0 (2) somado mais a0 (2) em a2, resultando a2 = 4; no PC = 10, faz-se o jal (Jump and link) para o local chamado 'pulo' que representa um acréscimo de 8 instruções, caindo diretamente em nop, com PC = 18, encerrando o código.

### 3) Quais são os registradores utilizados no código?

>x10, x11 e x12.

### 4) Quais são os conteúdos desses registradores ao final da execução do programa?

>x10 = 0x00000002, x11 = 0x00000004 e x12 = 0x00000004.

### 5) Adicione "prints" da tela do ambiente remoto ao arquivo PDF. Esses "prints" deverão mostrar todo o ambiente, incluindo o código em Assembly que foi executado e os valores exibidos na interface após a execução de cada instrução (código de máquina, pc e demais registradores envolvidos).

| PC | Valores Exibidos |
| -- | -- |
| 00 | ![00](/imagens/Questao2PC00.png) |
| 04 | ![04](/imagens/Questao2PC04.png) |
| 08 | ![08](/imagens/Questao2PC08.png) |
| 0C | ![0C](/imagens/Questao2PC0C.png) |
| 10 | ![10](/imagens/Questao2PC10.png) |
| 14 | ![14](/imagens/Questao2PC14.png) |
| 18 | ![18](/imagens/Questao2PC18.png) |