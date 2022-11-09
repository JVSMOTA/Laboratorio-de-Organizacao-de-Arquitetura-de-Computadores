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
## Problema 1

Implementar um sistema de armazenamento que possa funcionar nos seguintes modos:

```
1. registrador paralelo/serial de 4 bits;
2. memória RAM R/W 4x4;
3. memória RAM ROM 4x4.
```
Para selecionar o modo de funcionamento, você deverá usar as switches 0 e 1 (`SWI[1:0]`) considerando a codificação a seguir.

| SWI[1:0] | Função |
| -- | -- |
| 00 | registrador paralelo/serial de 4 bits |
| 01 ou 11 | memória RAM R/W 4x4 |
| 10 | memória RAM ROM 4x4 |

### Registrador paralelo/serial de 4 bits
Esse registrador deverá realizar o armazenamento de forma serial ou paralela, conforme a descrição a seguir.

| Entrada | Função |
| -- | -- |
| SWI[2] | switch de reset para "zerar" o registrador; |
| SWI[3] | seleção da entrada serial (0) ou paralela (1); |
| SWI[7:4] | entrada paralela; |
| SWI[7] | entrada serial (caso a função entrada serial seja selecionada); |
| LED[7:4] | exibição da saída. |

### Memória RAM R/W 4x4
Esta memória deverá funcionar conforme a descrição a seguir.

| Entrada | Função |
| -- | -- |
| SWI[1] | seleção de escrita (1) ou leitura (0); |
| SWI[3:2] | endereço de entrada; |
| SWI[7:4] | dados de entrada; |
| LED[7:4] | exibição da saída. |

### Memória RAM ROM 4x4
Esta memória deverá funcionar conforme a descrição a seguir.

| Entrada | Função |
| -- | -- |
| SWI[3:2] | endereço de entrada; |
| LED[7:4] | exibição da saída. |


**_OBS: Os seguintes dados devem ser armazenados na memória._**

| Endereço | Dado armazenado |
| -- | -- |
| 00 | 0011 |
| 01 | 0110 |
| 10 | 1001 |
| 11 | 1100 |