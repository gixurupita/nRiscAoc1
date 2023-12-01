module Mux2Para1 (Porta1, Porta2, Selecao, SaidaMux2);
    input wire [7:0] Porta1, Porta2; 
    input wire Selecao;
    output reg [7:0] SaidaMux2;
    
    always @(*) begin
        case (Selecao)
            1'b0: SaidaMux2 = Porta1;
            1'b1: SaidaMux2 = Porta2;
        endcase
    end
endmodule
