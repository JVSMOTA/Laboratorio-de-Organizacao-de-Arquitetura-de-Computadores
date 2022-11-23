// João Vitor de Souza Mota
// Roteiro 5

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

/*============ CONTADOR HEXADECIMAL ============*/

parameter ZERO   = 'b00111111;
parameter UM     = 'b00000110;
parameter DOIS   = 'b01011011;
parameter TRES   = 'b01001111;
parameter QUATRO = 'b01100110;
parameter CINCO  = 'b01101101;
parameter SEIS   = 'b01111101;
parameter SETE   = 'b00000111;
parameter OITO   = 'b01111111;
parameter NOVE   = 'b01101111;
parameter A      = 'b01110111;
parameter B      = 'b01111100;
parameter C      = 'b00111001;
parameter D      = 'b01011110;
parameter E      = 'b01111001;
parameter F      = 'b01110001;

parameter NBITS_COUNT = 4;
logic [NBITS_COUNT-1:0] Data_in, Count;
logic reset, load, counter;

always_comb reset   <= SWI[0];
always_comb counter <= SWI[1];
always_comb load    <= SWI[2];
always_comb Data_in <= SWI[7:4];

always_ff @(posedge reset or posedge clk_2) begin 
  if (reset)
    Count <= 0;
  else if (load)
    Count <= Data_in;
  else if (counter == 0)
    Count <= Count + 1;
  else if (counter == 1)
    Count <= Count - 1;
end

always_comb LED[7] <= clk_2;
always_comb case (Count)
  4'b0000 : SEG[7:0] <= ZERO;
  4'b0001 : SEG[7:0] <= UM;
  4'b0010 : SEG[7:0] <= DOIS;
  4'b0011 : SEG[7:0] <= TRES;
  4'b0100 : SEG[7:0] <= QUATRO;
  4'b0101 : SEG[7:0] <= CINCO;
  4'b0110 : SEG[7:0] <= SEIS;
  4'b0111 : SEG[7:0] <= SETE;
  4'b1000 : SEG[7:0] <= OITO;
  4'b1001 : SEG[7:0] <= NOVE;
  4'b1010 : SEG[7:0] <= A;
  4'b1011 : SEG[7:0] <= B;
  4'b1100 : SEG[7:0] <= C;
  4'b1101 : SEG[7:0] <= D;
  4'b1110 : SEG[7:0] <= E;
  default : SEG[7:0] <= F;
endcase

endmodule
