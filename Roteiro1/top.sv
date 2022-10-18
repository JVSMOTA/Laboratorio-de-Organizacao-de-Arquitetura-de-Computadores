// João Vitor de Souza Mota
// Roteiro 1

parameter divide_by=100000000;  // divisor do clock de referência
// A frequencia do clock de referencia é 50 MHz.
// A frequencia de clk_2 será de  50 MHz / divide_by

parameter NBITS_INSTR = 32;
parameter NBITS_TOP = 8, NREGS_TOP = 32, NBITS_LCD = 64;
module top(input  logic clk_2,
           input  logic [NBITS_TOP-1:0] SWI,
           output logic [NBITS_TOP-1:0] LED,
           output logic [NBITS_TOP-1:0] SEG,
           output logic [NBITS_LCD-1:0] lcd_a, lcd_b,
           output logic [NBITS_INSTR-1:0] lcd_instruction,
           output logic [NBITS_TOP-1:0] lcd_registrador [0:NREGS_TOP-1],
           output logic [NBITS_TOP-1:0] lcd_pc, lcd_SrcA, lcd_SrcB,
             lcd_ALUResult, lcd_Result, lcd_WriteData, lcd_ReadData, 
           output logic lcd_MemWrite, lcd_Branch, lcd_MemtoReg, lcd_RegWrite);

  always_comb begin
    lcd_WriteData <= SWI;
    lcd_pc <= 'h12;
    lcd_instruction <= 'h34567890;
    lcd_SrcA <= 'hab;
    lcd_SrcB <= 'hcd;
    lcd_ALUResult <= 'hef;
    lcd_Result <= 'h11;
    lcd_ReadData <= 'h33;
    lcd_MemWrite <= SWI[0];
    lcd_Branch <= SWI[1];
    lcd_MemtoReg <= SWI[2];
    lcd_RegWrite <= SWI[3];
    for(int i=0; i<NREGS_TOP; i++)
       if(i != NREGS_TOP/2-1) lcd_registrador[i] <= i+i*16;
       else                   lcd_registrador[i] <= ~SWI;
    lcd_a <= {56'h1234567890ABCD, SWI};
    lcd_b <= {SWI, 56'hFEDCBA09876543};
  end

/*============ PROBLEMA 1 ============*/
parameter ALARME_ATIVADO = 'b1;
parameter ALARME_DESATIVADO = 'b0;

logic [1:0] porta;
logic [1:0] relogio;
logic [1:0] interruptor;

// Atribuição das entradas
always_comb porta <= SWI[0];
always_comb relogio <= SWI[1];
always_comb interruptor <= SWI[2];

// Cheguei na expressão: porta AND (interruptor OR relogio')), através da tabela verdade do sistema
always_comb LED[1] <= ((porta == 1) & ((interruptor == 1) | (relogio == 0)));

/*============ PROBLEMA 2 ============*/
logic [1:0] t1;
logic [1:0] t2;

// Atribuição de entradas
always_comb t1 <= SWI[7]; // Temperaturas iguais ou maiores que 15°C
always_comb t2 <= SWI[6]; // Temperaturas iguais ou maiores que 20°C

always_comb LED[7] <= ((t1 == 0) & (t2 == 0));
always_comb LED[6] <= ((t1 == 1) & (t2 == 1));
always_comb SEG[7] <= ((t1 == 0) & (t2 == 1));

endmodule
