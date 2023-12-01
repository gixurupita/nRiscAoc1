module MemoriaInstrucoes (Endereco, Instrucao, Clock);
    input wire Clock;   //Sinal de Clock
    input wire [7:0] Endereco;
    output reg [7:0] Instrucao; //Instrução de saída

    reg [7:0] memInstrucoes [0:255];    //Declaração o reg da Memória

    integer i;
    initial begin
        //Lê o arquivo e grava as instruções na memória
        $readmemb("instrucoes.dat", memInstrucoes, 0, 255);

        //  ===== INÍCIO: Prints de teste =====
        $display("Valores binarios lidos e gravados na Memória de Instruções:");
        for(i = 0; i < 71; i =  i + 1)
            $display("memInst[%0d] %b", i, memInstrucoes[i]);
        //  ===== FIM: Prints de teste =====
    end

    always @(negedge Clock)
    begin
        //Atribui a respectiva instrução à saída
        Instrucao = memInstrucoes[Endereco];  
    end
endmodule

