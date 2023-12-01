module ProgramCouter (Endereco, EscPC, Saida, clock);
    input wire EscPC, clock;
    input wire [7:0] Endereco;
    output reg [7:0] Saida;
    
    reg[7:0] MemoriaPC;

    always @(posedge clock)
    begin
        //Grava o endereço da entrada na subida do clock
        if(EscPC) MemoriaPC = Endereco;
    end
    always @(negedge clock)
    begin
        //Atribui o endereço à saída na descida do clock
        Saida = MemoriaPC;
    end
endmodule
