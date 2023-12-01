`include "MemoriaDados.v"
`include "MemoriaInstrucoes.v"
`include "nRisc.v"

module Simulacao_nRisc;
    reg Clock;
    wire[7:0] SaidaPC,  //Saída do registrador PC
    Instrucao,      //Campo da instrução lida
    EndMemDados,    //Endereço de entrada da Memória de Dados
    DadoEscritoMem,     //Dado a ser escrito na Memória de Dados
    DadoLidoMem;    //Dado que foi lido da Memória
    wire EscReg, EscMem, LerMem;    //Sinais leitura e escrita

    // Instância do nRisc
    nRisc nrisc(.Clock(Clock), .SaidaPC(SaidaPC), .Instrucao(Instrucao), .EndMemDados(EndMemDados), .DadoEscritoMem(DadoEscritoMem), .DadoLidoMem(DadoLidoMem), .out_EscReg(EscReg), .out_EscMem(EscMem), .out_LerMem(LerMem));

    // Instância da Memória de Instruções
    MemoriaInstrucoes MemoriaInstrucoes(.Clock(Clock), .Endereco(SaidaPC), .Instrucao(Instrucao));
    // Instância das Memória de Dados
    MemoriaDados MemoriaDados(.Clock(Clock), .Endereco(EndMemDados), .DadoEscritoMem(DadoEscritoMem), .DadoLidoMem(DadoLidoMem), .EscMem(EscMem), .LerMem(LerMem));

    initial begin
        Clock = 0;
        forever begin       
            #1;	Clock = ~Clock;
        end
    end  

    initial begin
        forever begin
            $display();
        end
    end 

endmodule


