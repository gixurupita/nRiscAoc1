module Mux4Para1 (Porta1, Porta2, Porta3, Porta4, Bit1Selecao, Bit2Selecao, SaidaMux4);
    input wire [7:0] Porta1, Porta2, Porta3, Porta4; 
    input wire Bit1Selecao, Bit2Selecao;
    output reg [7:0] SaidaMux4;
    
    reg[1:0] Selecao;    //Barramento de 2 bits

    initial begin
        //Concatena os 2 sinais de seleção de 1 bit em 2 bits
        Selecao = {Bit2Selecao, Bit1Selecao};
    end

    always @(*) begin
        case (Selecao)
            2'b00: SaidaMux4 = Porta1;
            2'b01: SaidaMux4 = Porta2;
            2'b10: SaidaMux4 = Porta3;
            2'b11: SaidaMux4 = Porta4;
        endcase
    end
endmodule
