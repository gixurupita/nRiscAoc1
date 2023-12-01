module MemoriaDados (Clock, Endereco, DadoEscritoMem, DadoLidoMem, EscMem, LerMem);
    input wire Clock, EscMem, LerMem;   //Sinais de Controle e Clock
    input wire [7:0] Endereco, DadoEscritoMem;
    output reg [7:0] DadoLidoMem;   //Dado lido da Memória
    
    reg [7:0] MemDados [0:255];    //Declaração o reg da Memória

    integer i;
    initial begin
        //Lê o arquivo e grava as instruções na memória
        $readmemb("dados.dat", MemDados, 0, 255);

        //  ===== INÍCIO: Prints de teste =====
        $display("Valores binarios lidos e gravados na Memória de Dados:");
        for(i = 0; i < 15; i =  i + 1)
            $display("memDados[%0d] %d", i, MemDados[i]);
        //  ===== FIM: Prints de teste =====
    end


    always @(posedge Clock)
    begin
        //Escrita na borda de subida dependendo do sinal de controle
        if (EscMem) MemDados[Endereco] = DadoEscritoMem;
    end

    always @(negedge Clock)
    begin
        //Leitura na borda de descida dependendo do sinal de controle
        if (LerMem) DadoLidoMem = MemDados[Endereco];
    end
endmodule
