module Ext(
   input signed [2:0] Entrada,
   output reg [7:0] Saida 
);

   always @(Entrada) begin
      if (Entrada[2] == 1) // Número negativo
         Saida = {5'b11111, Entrada};
      else // Número positivo
         Saida = {5'b00000, Entrada};
   end

//iverilog -o Ext.vvp Ext.v

endmodule