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


module nRisc;
    reg [3:0] RegLido1, RegLido2, RegEscrito;
    reg [7:0] DadoEscrito, DadoLido1, DadoLido2, Dadoa0;
    reg Clock, EscReg;
    
    // Instância do módulo BancoRegistradores
    BancoRegistradores BancoInst(
        .RegLido1(RegLido1),
        .RegLido2(RegLido2),
        .RegEscrito(RegEscrito),
        .DadoEscrito(DadoEscrito),
        .DadoLido1(DadoLido1),
        .DadoLido2(DadoLido2),
        .Dadoa0(Dadoa0),
        .Clock(Clock),
        .EscReg(EscReg)
    );

    // Instância do módulo CTRL
    

    initial begin
        $display ("bom dia");
    end

endmodule