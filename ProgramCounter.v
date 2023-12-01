module ProgramCouter (Endereco, EscPC, SaidaPCPC, Clock);
    input wire EscPC, Clock;
    input wire [7:0] Endereco;
    output reg [7:0] SaidaPC;
    
    reg[7:0] MemoriaPC;

    always @(posedge Clock)
    begin
        //Grava o endereço da entrada na subida do Clock
        if(EscPC) MemoriaPC = Endereco;
    end
    always @(negedge Clock)
    begin
        //Atribui o endereço à saída na descida do Clock
        SaidaPC = MemoriaPC;
    end
endmodule
