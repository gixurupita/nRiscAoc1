module Incrementa(
   input [7:0] num1,
   input signed [7:0] num2,
   output reg [7:0] resultado
);
    always@(*) 
        resultado = num1 + num2;

endmodule