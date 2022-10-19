// João Vitor de Souza Mota
// Roteiro 2

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
parameter            ADEQUADA = 'b00000000;
parameter     BAIXA_UMIDADE_0 = 'b00111111;
parameter     BAIXA_UMIDADE_1 = 'b00000110;
parameter BAIXA_UMIDADE_0_E_1 = 'b01011011;

logic [1:0] entrada_1;
logic [1:0] entrada_2;

// Atribuição de Entradas
always_comb entrada_1 <= SWI[0];
always_comb entrada_2 <= SWI[1];

always_comb begin
       if ((entrada_1 == 0) & (entrada_2 == 0)) SEG <= ADEQUADA;
  else if ((entrada_1 == 0) & (entrada_2 == 1)) SEG <= BAIXA_UMIDADE_1;
  else if ((entrada_1 == 1) & (entrada_2 == 0)) SEG <= BAIXA_UMIDADE_0;
  else                                          SEG <= BAIXA_UMIDADE_0_E_1;
end

/*============ PROBLEMA 2 ============*/
endmodule
