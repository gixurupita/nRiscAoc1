module MemoriaDados (Endereco, DadoEscrito, DadoLido, EscMem, LerMem, Clock);
    input wire Clock, EscMem, LerMem;   //Sinais de Controle e Clock
    input wire [7:0] Endereco, DadoEscrito;
    output reg [7:0] DadoLido;   //Dado lido da Memória
    
    reg [7:0] Dados [0:255];

    always @(posedge Clock)
    begin
        //Escrita na borda de subida dependendo do sinal de controle
        if (EscMem) Dados[Endereco] = DadoEscrito;
    end

    always @(negedge Clock)
    begin
        //Leitura na borda de descida dependendo do sinal de controle
        if (LerMem) DadoLido = Dados[Endereco];
    end
endmodule
