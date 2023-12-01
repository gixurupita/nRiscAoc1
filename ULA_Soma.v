module ULA_Soma(
   input [7:0] Num1,
   input signed [7:0] Num2,
   output reg [7:0] SaidaIncrementa
);
    always@(*) 
        SaidaIncrementa = Num1 + Num2;

endmodule