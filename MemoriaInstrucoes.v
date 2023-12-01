module MemoriaInstrucoes (Endereco, Instrucao, clock);
    input wire clock;   //Sinal de clock
    input wire [7:0] Endereco;
    output reg [7:0] Instrucao; //Instrução de saída

    reg [7:0] MemInstrucoes [0:255];
    initial begin
        //Instruções salvas na memória
        MemInstrucoes[11] = 8'b00111000;
        MemInstrucoes[12] = 8'b00011011;
    end

    always @(negedge clock)
    begin
        //Atribui a respectiva instrução à saída
        Instrucao = MemInstrucoes[Endereco];    
    end
endmodule
