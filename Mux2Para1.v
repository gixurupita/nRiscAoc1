module Mux2Para1 (porta1, porta2, selecao, saida);
    input wire [7:0] porta1, porta2; 
    input wire selecao;
    output reg [7:0] saida;
    
    always @(*) begin
        case (selecao)
            1'b0: saida = porta1;
            1'b1: saida = porta2;
        endcase
    end
endmodule
