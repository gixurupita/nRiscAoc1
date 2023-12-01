module Ext(
   input signed [2:0] entrada,
   output reg [7:0] saida 
);

   always @(entrada) begin
      if (entrada[2] == 1) // Número negativo
         saida = {5'b11111, entrada};
      else // Número positivo
         saida = {5'b00000, entrada};
   end

//iverilog -o Ext.vvp Ext.v

endmodule