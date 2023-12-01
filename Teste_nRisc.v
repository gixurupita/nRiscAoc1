`include "MemoriaDados.v"
`include "MemoriaInstrucoes.v"
`include "nRisc.v"

module Teste_nRisc;
    reg Clock;
    wire[7:0] SaidaPc,  //Saída do registrador PC
    Instrucao,      //Campo da instrução lida
    EndMemDados,    //Endereço de entrada da Memória de Dados
    DadoEscritoMem,     //Dado a ser escrito na Memória de Dados
    DadoLidoMem;    //Dado que foi lido da Memória

    // Instância do nRisc
    nRisc nrisc(Clock, SaidaPc, Instrucao, EndMemDados, DadoEscritoMem, DadoLidoMem);
    //Instância das Memórias de Dados e de Instrução
    //MemoriaDados MemoriaDados(Clock, );
    //MemoriaInstrucoes MemoriaInstrucoes();

endmodule


