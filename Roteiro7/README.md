# Roteiro 7

## Observações

>Todas as recomendações para uso dos arquivos “inst1.s” e "inst2.s" estão disponíveis no AVA-LOAC;
>
>A atividade deverá ser enviada a partir do seguinte "ambiente":
>
>AVA-LOAC;
>
>Implementar o circuito utilizando um simulador de FPGA (Sugestão: [venus](https://venus.kvakil.me/)).
>
>Cada código deverá ser implementado e submetido em um arquivo. Deverão ser enviados dois arquivos. Um contendo o código em Assembly do problema 1 (**inst1.s**) e outro contendo o código Assembly do problema 2 (**inst2.s**).
>
>Enviar os 3 arquivos separadamente (não enviar um ZIP).
>
>Para cada problema, forneça "prints" da tela do simulador ao arquivo PDF. Esses "prints" deverão mostrar todo o ambiente, incluindo o código em Assembly que foi executado e os valores exibidos na interface após a execução de cada instrução (código de máquina armazenado na memória, dado escrito na memória (se houver), valores do PC e dos demais registradores envolvidos).
>
>Recomendação: Use o [CloudConverter](https://cloudconvert.com/) para transformar em *.pdf*. 

## Problema 1 - Código em Assembly (Fatorial de N)
Implementar em Assembly - RISC-V, um programa que calcula o fatorial de um número N. O arquivo submetido deverá ser nomeado como **inst1.s**.

>O valor de N deverá ser carregado em algum registrador de uso genérico no início da execução do programa.

## Problema 2 - Código em Assembly (Leitura e Escrita na Memória de Dados)
Implementar em Assembly - RISC-V, um programa que realiza as operações a seguir (IMPORTANTE: observar o uso das instruções "**li**" e "**lui**"). O arquivo submetido deverá ser nomeado como **inst2.s**.

>Escrever o valor **0xFE** no endereço da memória de dados **0x1000000C**.
>
>Ler o valor **0xFE** do endereço da memória de dados **0x1000000C** e escrever no registrador **x10**.