module MemoriaDados (Endereco, DadoEscrito, DadoLido, EscMem, LerMem, Clock);
    input wire Clock, EscMem, LerMem;   //Sinais de Controle e Clock
    input wire [7:0] Endereco, DadoEscrito;
    output reg [7:0] DadoLido;   //Dado lido da Memória
    
    reg [7:0] MemDados [0:255];    //Declaração o reg da Memória

    integer i;
    initial begin
        //Lê o arquivo e grava as instruções na memória
        $readmemb("dados.dat", MemDados, 0, 255);

          ===== INÍCIO: Prints de teste =====
        $display("Valores binarios lidos e gravados na Memória de Dados:");
        for(i = 0; i < 15; i =  i + 1)
            $display("memDados[%0d] %d", i, MemDados[i]);
          ===== FIM: Prints de teste =====
    end


    always @(posedge Clock)
    begin
        //Escrita na borda de subida dependendo do sinal de controle
        if (EscMem) MemDados[Endereco] = DadoEscrito;
    end

    always @(negedge Clock)
    begin
        //Leitura na borda de descida dependendo do sinal de controle
        if (LerMem) DadoLido = MemDados[Endereco];
    end
endmodule



module Teste_MemoriaDados  ();
    reg Clock, EscMem, LerMem;
    reg [7:0]Endereco, DadoAEscrever;
    wire [7:0] DadoLido;

    //Instanciando o módulo da Memória de Dados
    MemoriaDados Memoria (Endereco, DadoAEscrever, DadoLido, EscMem, LerMem, Clock);
    initial
    begin
        Clock = 1;
        EscMem = 0;
        LerMem = 1;
        Endereco = 8;
        DadoAEscrever = 15;   //Valor hipotético a ser escrito na Memória
        $display("TESTE: Escrita e Leitura na Memória de Dados");
        $display("Tempo  Clock  EscMem  LerMem  Endereco  DadoAEscrever  DadoLido");
        $monitor(" %0d       %d       %d      %d       %d         %d         %d", $time, Clock, EscMem, LerMem, Endereco, DadoAEscrever, DadoLido);
        #1; begin
            Clock = 0;
        end
        #1; begin
            Clock = 1;
            EscMem = 1;
            LerMem = 0;
        end
        #1; begin
            Clock = 0;
            LerMem = 1;
            EscMem = 0;
        end
    end
endmodule
