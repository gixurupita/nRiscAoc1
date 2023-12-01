module MemoriaDados (Endereco, DadoEscrito, DadoLido, EscMem, LerMem, Clock);
    input wire Clock, EscMem, LerMem;   //Sinais de Controle e Clock
    input wire [7:0] Endereco, DadoEscrito;
    output reg [7:0] DadoLido;   //Dado lido da Memória
    
<<<<<<< HEAD
    reg [7:0] MemDados [0:255];    //Declaração o reg da Memória

    integer i;
    initial begin
        //Lê o arquivo e grava as instruções na memória
        $readmemb("Dados.dat", MemDados, 0, 255);

        //  ===== INÍCIO: Prints de teste =====
        //$display("Valores binarios lidos e gravados na Memória de Dados:");
        //for(i = 0; i < 15; i =  i + 1)
        //    $display("memDados[%0d] %d", i, MemDados[i]);
        //  ===== FIM: Prints de teste =====
    end

=======
    reg [7:0] Dados [0:255];
>>>>>>> testeGiovanni

    always @(posedge Clock)
    begin
        //Escrita na borda de subida dependendo do sinal de controle
<<<<<<< HEAD
        if (escMem) MemDados[endereco] = dadoEscrito;
=======
        if (EscMem) Dados[Endereco] = DadoEscrito;
>>>>>>> testeGiovanni
    end

    always @(negedge Clock)
    begin
        //Leitura na borda de descida dependendo do sinal de controle
<<<<<<< HEAD
        if (lerMem) dadoLido = MemDados[endereco];
=======
        if (LerMem) DadoLido = Dados[Endereco];
>>>>>>> testeGiovanni
    end
endmodule
