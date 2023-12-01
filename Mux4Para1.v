module Mux4Para1 (porta1, porta2, porta3, porta4, selecao, saida);
    input wire [7:0] porta1, porta2, porta3, porta4; 
    input wire [1:0] selecao;
    output reg [7:0] saida;
    
    always @(*) begin
        case (selecao)
            2'b00: saida = porta1;
            2'b01: saida = porta2;
            2'b10: saida = porta3;
            2'b11: saida = porta4;
        endcase
    end
endmodule
