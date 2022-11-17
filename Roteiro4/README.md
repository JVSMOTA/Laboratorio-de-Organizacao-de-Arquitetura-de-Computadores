# Roteiro 4

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

Implementar um sistema de armazenamento que possa funcionar nos seguintes modos:

## Problema 1 - Registrador paralelo/serial de 4 bits
Esse registrador deverá realizar o armazenamento de forma serial ou paralela, conforme a descrição a seguir.

| Entrada | Função |
| -- | -- |
| SWI[1] | switch de reset para "zerar" o registrador |
| SWI[2] | seleção da entrada serial (0) ou paralela (1) |
| SWI[3] | entrada serial (caso a função entrada serial seja selecionada) |
| SWI[7:4] | entrada paralela |
| LED[7:4] | exibição da saída |

## Problema 2 - Memória RAM R/W 4x4
Esta memória deverá funcionar conforme a descrição a seguir.

| Entrada | Função |
| -- | -- |
| SWI[1] | seleção de escrita (1) ou leitura (0) |
| SWI[3:2] | endereço de entrada |
| SWI[7:4] | dados de entrada |
| LED[7:4] | exibição da saída |

## Problema 3 - Memória RAM ROM 4x4
Esta memória deverá funcionar conforme a descrição a seguir.

| Entrada | Função |
| -- | -- |
| SWI[3:2] | endereço de entrada |
| LED[7:4] | exibição da saída |


**_OBS: Os seguintes dados devem ser armazenados na memória._**

| Endereço | Dado armazenado |
| -- | -- |
| 00 | 0011 |
| 01 | 0110 |
| 10 | 1001 |
| 11 | 1100 |