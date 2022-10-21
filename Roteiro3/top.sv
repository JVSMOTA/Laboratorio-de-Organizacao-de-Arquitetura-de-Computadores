// João Vitor de Souza Mota
// Roteiro 3

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
parameter MENOS_QUATRO = 'b11100110;
parameter MENOS_TRES =   'b11001111;
parameter MENOS_DOIS =   'b11011011;
parameter MENOS_UM =     'b10000110;
parameter ZERO =         'b00111111;
parameter UM =           'b00000110;
parameter DOIS =         'b01011011;
parameter TRES =         'b01001111;
parameter QUATRO =       'b01100110;
parameter OVERFLOW =     'b10111111;
parameter UNDERFLOW =    'b10111110;

logic [2:0] a;
logic [2:0] b;
logic [1:0] f;

// Atribuição de Entradas
always_comb a <= SWI[7:5];
always_comb b <= SWI[2:0];

// Variável de Seleção do MUX 4:1
always_comb f <= SWI[4:3];

// Implementação do IF para MUX 4:1
always_comb begin
       if (f == 'b00) begin
        LED[2:0] <= (a + b);
             if (a + b == 'b111) SEG[7:0] <= MENOS_QUATRO;
        else if (a + b == 'b110) SEG[7:0] <= MENOS_TRES;
        else if (a + b == 'b101) SEG[7:0] <= MENOS_DOIS;
        else if (a + b == 'b100) SEG[7:0] <= MENOS_UM;
        else if (a + b == 'b000) SEG[7:0] <= ZERO;
        else if (a + b == 'b001) SEG[7:0] <= UM;
        else if (a + b == 'b010) SEG[7:0] <= DOIS;
        else                     SEG[7:0] <= TRES;
       end

  else if (f == 'b01) begin
        LED[2:0] <= (a - b);
             if (a - b == 'b111) SEG[7:0] <= MENOS_QUATRO;
        else if (a - b == 'b110) SEG[7:0] <= MENOS_TRES;
        else if (a - b == 'b101) SEG[7:0] <= MENOS_DOIS;
        else if (a - b == 'b100) SEG[7:0] <= MENOS_UM;
        else if (a - b == 'b000) SEG[7:0] <= ZERO;
        else if (a - b == 'b001) SEG[7:0] <= UM;
        else if (a - b == 'b010) SEG[7:0] <= DOIS;
        else                     SEG[7:0] <= TRES; 
       end

  else if (f == 'b10) LED[2:0] <= (a & b);
  else                LED[2:0] <= (a | b);
end

always_comb begin
     if ((a + b) > 3)    SEG[7:0] <= OVERFLOW;
else                     SEG[7:0] <= UNDERFLOW;
end 

endmodule
