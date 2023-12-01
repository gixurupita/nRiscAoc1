`include "BancoRegistradores.v"
`include "ConcatenaBit.v"
`include "CTRL.v"
`include "Extensor.v"
`include "Mux2Para1_3Bits.v"
`include "Mux2Para1.v"
`include "Mux4Para1.v"
`include "PortaAnd.v"
`include "ProgramCounter.v"
`include "ULA_Soma.v"
`include "ULA.v"


module nRisc(Clock, SaidaPC, Instrucao, EndMemDados, DadoEscritoMem, DadoLidoMem);
    // Associação de portas da entrada e saída do nRisc
    input wire Clock;
    input wire[7:0] Instrucao, DadoLidoMem;
    output reg[7:0] SaidaPC, EndMemDados, DadoEscritoMem;

    // Wires associados às saídas do nRisc
    wire[7:0] w_SaidaPC, w_EndMemDados, w_DadoEscritoMem;


    // Instância do módulo Program Counter
    ProgramCounter PC(.Clock(Clock), .EscPC(EscPC), .EntradaPC(SaidaMux4), .SaidaPC(w_SaidaPC));

    // Instância do módulo da ULA_Soma que incrementa PC em 1
    wire[7:0] PCIncrementado;
    ULA_Soma Incrementa(.Operando1(SaidaPC), .Operando2(8'b00000001), .SaidaSoma(PCIncrementado));

    // Instância do módulo do Mux4Para1 que determina qual será a entrada de PC
    wire[7:0] SaidaMux4;
    Mux4Para1 Mux4Para1(.Porta1(PCIncrementado), .Porta2(Dadoa0), .Porta3(DadoLido2), .Porta4(DadoLido2), .Bit1Selecao(Branch), .Bit2Selecao(Jump), .SaidaMux4(SaidaMux4));

    // A instrução é buscada na memória fora deste módulo por meio do endereço dado por SaidaPC e retorna em Instrucao[7:0]

    // Fios associados à Unidade de Controle
    wire[1:0] ULAOp;
    wire MemToReg, EscMem, LerMem, Branch, ULAFonte, EscReg, Jump, EscPc, MoveReg, RegDest;
    // Instância do módulo CTRL
    CTRL controle(
.Clock(Clock),
.OPcode(Instrucao[7:5]),
.MemToReg(MemToReg), 
.EscMem(EscMem), 
.LerMem(LerMem),
.Branch(Branch),
.ULAOp(ULAOp),
.ULAFonte(ULAFonte),
.EscReg(EscReg),
.Jump(Jump),
.EscPc(EscPC),
.MoveReg(MoveReg),
.RegDest(RegDest));

    // Conectando o fio do n° do reg de 2 bits da instrução até o unidade de concatenação
    wire [2:0] RegLido1;
    ConcatenaBit ConcatenaBit(.Entrada2Bits(Instrucao[4:3]), .Saida3Bits(RegLido1));

    // Conectando o fio concatenado até a porta 1 do mux RegDest
    wire [2:0] RegEscrito;
    Mux2Para1_3Bits Mux2Para1_RegDest(.Porta1(RegLido1), .Porta2(3'b001), .Selecao(RegDest), .SaidaMux2(RegEscrito)); //porta 2 = 1 (r0)

    // Conectando a saída do mux MemToReg à porta 1 do mux MoveReg
    wire [7:0] DadoEscritoReg, SaidaMux2_MemToReg;
    Mux2Para1 Mux2Para1_MoveReg(.Porta1(SaidaMux2_MemToReg), .Porta2(DadoLido2), .Selecao(MoveReg), .SaidaMux2(DadoEscritoReg));

    // Fios associados ao Banco de Registradores
    wire [7:0] DadoLido1, DadoLido2, Dadoa0;
    // Instância do módulo BancoRegistradores
    BancoRegistradores BancoInst(
        .RegLido1(RegLido1),
        .RegLido2(Instrucao[2:0]),
        .RegEscrito(RegEscrito),
        .DadoEscritoReg(DadoEscritoReg),
        .DadoLido1(DadoLido1),
        .DadoLido2(DadoLido2),
        .Dadoa0(Dadoa0),
        .Clock(Clock),
        .EscReg(EscReg)
    );
    
    // Extende o sinal dos 3 últimos bits referentes ao imediato da instrução
    wire[7:0] Imediato;
    Extensor Extensor(.Entrada3Bits(Instrucao[2:0]), .Saida8Bits(Imediato));

    // Soma o imediato com o registrador lido 2
    wire[7:0] SaidaSoma;
    ULA_Soma ULAImediato(.Operando1(Dadoa0), .Operando2(Imediato), .SaidaSoma(SaidaSoma));

    // Conecta o Mux ULAFonte à porta 2 da ULA
    wire[7:0] SaidaMux2_ULA;
    Mux2Para1 Mux2Para1_ULAFonte(.Porta1(DadoLido2), .Porta2(SaidaSoma), .Selecao(ULAFonte), .SaidaMux2(SaidaMux2_ULA));

    // Conecta a saída Zero da ULA na porta AND
    wire Zero;
    ULA ULA(.ULAOp(ULAOp), .Operando1(DadoLido1), .Operando2(SaidaMux2_ULA), .Zero(Zero), .SaidaULA(ResultadoULA));

    // Conecta a saída da porta AND ao 1° bit do sinal de seleção do Mux da entrada de PC
    wire SaidaBranch;
    PortaAnd And(.Zero(Zero), .Branch(Branch), .SaidaAND(SaidaBranch));

    // Conecta o resultado da ULA principal à porta 1 do Mux MemToReg
    wire[7:0] ResultadoULA;
    Mux2Para1 Mux2Para1_MemToReg(.Porta1(ResultadoULA), .Porta2(DadoLidoMem), .Selecao(MemToReg), .SaidaMux2(SaidaMux2_MemToReg));
    

    initial begin
        SaidaPC = w_SaidaPC;
        $display ("bom dia");
    end

endmodule