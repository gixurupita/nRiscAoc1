`include "BancoRegistradores.v"
/*`include "CTRL.v"
`include "Ext.v"
`include "Incrementa.v"
`include "Mux2Para1.v"
`include "Mux4Para1.v"
`include "PortaAnd.v"
`include "ProgramCouter.v"
`include "ULAAOC.v"
`include "Ext.v"
`include "Mux2Para1.v"*/


module nRisc(Clock, SaidaPC, Instrucao, EndMemDados, DadoEscritoMem, DadoLidoMem);
    // Associação de portas da entrada e saída do nRisc
    input wire Clock;
    input reg[7:0] Instrucao, DadoLidoMem;
    output reg[7:0] SaidaPC, EndMemDados, DadoEscritoMem;


    // Instância do módulo Program Counter
    ProgramCouter PC(.Clock(Clock), .EscPC(EscPC), .EntradaPC(SaidaULA_Soma), .SaidaPC(SaidaPC));

    // A instrução é buscada na memória pelo endereço dado por SaidaPC e retorna em Instrucao[7:0]

    // Conectando o fio de parte da instrução até o unidade de concatenação
    wire [2:0] RegLido1;
    ConcatenaBit ConcatenaBit(Instrucao[4:3], RegLido1);

    // Conectando o fio concatenado até a porta 1 do mux RegDest
    wire [2:0] RegEscrito;
    Mux2Para1 Mux2Para1_RegDest(RegLido1, 3'b001, RegDest, RegEscrito); //porta 2 = 1 (r0)

    // Conectando a saída do mux MemToReg à porta 1 do mux MoveReg
    wire [2:0] SaidaMuxMemToReg;
    wire [7:0] DadoEscrito;
    Mux2Para1 Mux2Para1_MoveReg(SaidaMuxMemToReg, DadoLido2,MoveReg, DadoEscrito); //porta 2 = 1 (r0)


    // Fios associados ao Banco de Registradores
    reg [2:0] RegLido2;
    wire [7:0] DadoLido1, DadoLido2, Dadoa0;
    reg Clock, EscReg;
    // Instância do módulo BancoRegistradores
    BancoRegistradores BancoInst(
        .RegLido1(RegLido1),
        .RegLido2(Instrucao[2:0]),
        .RegEscrito(RegEscrito),
        .DadoEscrito(DadoEscrito),
        .DadoLido1(DadoLido1),
        .DadoLido2(DadoLido2),
        .Dadoa0(Dadoa0),
        .Clock(Clock),
        .EscReg(EscReg)
    );

    // Fios associados à Unidade de Controle
    wire MemToReg, EscMem, LerMem, Branch, ULAOp, ULAFonte, EscReg, Jump, EscPc, MoveReg, RegDest;
    // Instância do módulo CTRL
    CTRL controle(
.Clock(Clock),
.OPcode(Instrucao[6:4]),
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
.RegDest(RegDest))
    

    // Fios associados a ULA_Soma
    wire [7:0] ;
    

    // Fios associados ao Mux2Para1
    wire [7:0] SaidaMUX2;
    // Instância do módulo Mux2Para1
    Mux2Para1(U)


    initial begin
        $display ("bom dia");
    end

endmodule