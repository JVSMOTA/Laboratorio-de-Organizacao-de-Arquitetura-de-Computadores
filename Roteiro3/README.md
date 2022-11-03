# Roteiro 3

## Observações
```
    Todas as recomendações para uso do arquivo “top.sv” estão disponíveis no AVA-LOAC;
    A atividade deverá ser enviada a partir dos seguintes "ambientes":
        
        FPGA Remoto (http://lad.ufcg.edu.br/hdl/remote.php); e
        AVA-LOAC;
    
    Sugestão: testar o circuito utilizando o simulador de FPGA (http://lad.ufcg.edu.br/hdl/simulate.php).
    
        Seu circuito deve funcionar no ambiente FPGA remoto.
        O simulador deve ser usado apenas para testar.
    
    Todos os circuitos devem coexistir, ou seja, quando for mostrar o segundo circuito, o primeiro deverá se manter em funcionamento.
        Você deve enviar apenas um arquivo com o nome top.sv.
```
## Problema 1

Construir em SystemVerylog, utilizando o ambiente FPGA remoto, a ULA descrita a seguir.

### Código das operações 

| F[1:0] | Operação |
| -- | -- |
| 00 | A + B |
| 01 | A - B |
| 10 | A AND B |
| 11 | A OR B |

![índice.png](https://github.com/JVSMOTA/LOAC/blob/Roteiro3/imagens/%C3%ADndice.png?raw=true)

## Entradas

Dois valores **A** e **B** (inteiros com sinal), com tamanho de 3 bits cada, são os operadores. Para **A**, usar as chaves `SWI[7:5]` e para **B**, as chaves `SWI[2:0]`.

Um vetor `F[1:0]` de 2 bits, que representa o seletor das operações da ULA, conforme a tabela. Utilizar as `SWI[4:3]` para **F**.

## Saídas

O resultado da operação **Y**, com 3 bits, deverá ser apresentado nos `LED[2:0]`. Visualizar o resultado também em base decimal no Display de 7 segmentos (`SEG[7:0]`).

Para as operações aritméticas, indicar a ocorrência de overflow ou underflow no `LED[7]`. No caso de overflow ou underflow não importa o que estiver no Display de 7 segmentos.

_Você deverá usar a representação de complemento de 2_.