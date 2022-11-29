# Roteiro 6

## Observações

>Todas as recomendações para uso do arquivo “top.sv” estão disponíveis no AVA-LOAC;
>A atividade deverá ser enviada a partir dos seguintes "ambientes":
>
>[FPGA Remoto](http://lad.ufcg.edu.br/hdl/remote.php) e
>AVA-LOAC;
>
>Sugestão: testar o circuito utilizando o [simulador de FPGA](http://lad.ufcg.edu.br/hdl/simulate.php).
>
>Seu circuito deve funcionar no ambiente FPGA remoto.
>O simulador deve ser usado apenas para testar.
>
>Cada código deverá ser implementado e submetido em um arquivo. Deverão ser enviados dois arquivos. 
>Um contendo o código assembly (inst.s) e outro contendo o código de máquina (inst.101). 
>
>Código assembly: arquivo com nome inst.s.
>Código de máquina: arquivo com nome inst.101.
>
>Você deverá enviar um arquivo PDF com as respostas para cada uma das perguntas indicadas nos problemas.
>Envie os 3 arquivos separadamente (não envie um ZIP).

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

Responda as perguntas a seguir (as respostas deverão ser enviadas em um arquivo PDF).

>Qual é a operação realizada pelo código acima?
>
>Qual é o conteúdo (em decimal) dos registradores a0, a1 e a2 ao final da execução do programa?
>
>Quais são os valores de loop e fim?
>
>**_Adicione "prints" da tela do ambiente remoto ao arquivo PDF. Esses "prints" deverão mostrar todo o ambiente, incluindo o código em Assembly que foi executado e os valores exibidos na interface após a execução de cada instrução (código de máquina, pc e demais registradores envolvidos)._**

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

Responda as perguntas a seguir (as respostas deverão ser enviadas em um arquivo PDF).

>Qual é a operação realizada pelo código acima?
>
>Quais são os registradores utilizados no código?
>
>Quais são os conteúdos desses registradores ao final da execução do programa?
>
>Adicione "prints" da tela do ambiente remoto ao PDF. Esses "prints" deverão mostrar os valores exibidos na interface após a execução de cada instrução (código de máquina, pc e demais registradores envolvidos).
