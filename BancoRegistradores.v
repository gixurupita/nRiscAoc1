module BancoRegistradores(Clock, RegLido1, RegLido2, RegEscrito, DadoEscrito, EscReg, DadoLido1, DadoLido2, Dadoa0);
    input [2:0] RegLido1, RegLido2, RegEscrito;    //Número dos registradores
    input [7:0] DadoEscrito;   //Valor de 8 bits a ser escrito
    input Clock, EscReg;    //Sinal de controle e Clock
    output [7:0] DadoLido1, DadoLido2;    //Valores lidos dos Registradores

    reg [7:0] REG [7:0];    //8 Registradores, cada um de 8 bits

    //Saída dos registradores
    assign DadoLido1 = REG[RegLido1];
    assign DadoLido2 = REG[RegLido2];
    assign Dadoa0 = REG[7];     //Saída dedicada do registrador a0

    always @(posedge Clock)
    begin  //Grava o dado no banco caso o sinal EscReg for 1
        if (EscReg) REG[RegEscrito] <= DadoEscrito;
    end
endmodule
