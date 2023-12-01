module ProgramCounter (Clock, EscPC, EntradaPC, SaidaPC);
    input wire Clock, EscPC;
    input wire [7:0] EntradaPC;
    output reg [7:0] SaidaPC;
    
    reg[7:0] MemoriaPC;

    always @(posedge Clock)
    begin
        //Grava o endereço da entrada na subida do Clock
        if(EscPC) MemoriaPC = EntradaPC;
    end
    always @(negedge Clock)
    begin
        //Atribui o endereço à saída na descida do Clock
        SaidaPC = MemoriaPC;
    end
endmodule
