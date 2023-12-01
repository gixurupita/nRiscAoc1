module ULA_Soma(
   input [7:0] Operando1,
   input signed [7:0] Operando2,
   output reg [7:0] SaidaSoma
);
    always@(*) 
        SaidaSoma = Operando1 + Operando2;

endmodule