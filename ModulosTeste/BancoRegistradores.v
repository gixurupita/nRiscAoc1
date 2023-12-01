module BancoRegistradores(RegLido1, RegLido2, RegEscrito, DadoEscrito, EscReg, DadoLido1, DadoLido2, Dadoa0, clock);
    input wire [2:0] RegLido1, RegLido2, RegEscrito;    //Número dos registradores
    input wire [7:0] DadoEscrito;   //Valor de 8 bits a ser escrito
    input wire clock, EscReg;    //Sinal de controle e Clock
    output reg [7:0] DadoLido1, DadoLido2, Dadoa0;    //Valores lidos dos Registradores

    reg [7:0] REG [7:0];    //8 Registradores, cada um de 8 bits

    always @(posedge clock)
    begin   //Grava o dado no banco caso o sinal EscReg for 1;
        if (EscReg) REG[RegEscrito] <= DadoEscrito;
    end

    always @(negedge clock)
    begin
        //Saída dos registradores
        DadoLido1 <= REG[RegLido1];
        DadoLido2 <= REG[RegLido2];
        Dadoa0 <= REG[7];     //Saída dedicada do registrador a0;
    end
endmodule

module Teste_BancoRegistradores();
    reg [2:0] rs, rt, rd;  //Número dos registradores
    reg [7:0] dadoAEscrever;
    reg clock, EscReg;
    wire [7:0] DadoLido1, DadoLido2, Dadoa0;    //Dados lidos dos registradores

    //Instanciando o módulo de Banco de Registradores
    BancoRegistradores REG(rs, rt, rd, dadoAEscrever, EscReg, DadoLido1, DadoLido2, Dadoa0, clock);
    initial begin
        clock = 0;
        EscReg = 0;
        rs = 2; //Registrador $t0
        rt = 5; //Registrador $t1
        rd = 5; //Registrador $t3
        $display("1º Teste: Escrita de dados no Banco de Registradores");
        $display("Tempo  Clock  EscReg   rs    rt    rd   DadoAEscrever  DadoLido1  DadoLido2");
        $monitor(" %0d       %d       %d      %d     %d     %d      %d           %d       %d", $time, clock, EscReg, rs, rt, rd, dadoAEscrever, DadoLido1, DadoLido2);
    
        #1 dadoAEscrever = 8'b00101011; //Valor hipotético oriundo da ULA ou Memória

        #1; begin
            clock = 1;
            EscReg = 1;
        end
        #1 clock = 0;
    end



endmodule
	
	
