module Extensor(
   input signed [2:0] Entrada3Bits,
   output reg [7:0] Saida8Bits 
);

   always @(Entrada3Bits) begin
      if (Entrada3Bits[2] == 1) // Número negativo
         Saida8Bits = {5'b11111, Entrada3Bits};
      else // Número positivo
         Saida8Bits = {5'b00000, Entrada3Bits};
   end

endmodule