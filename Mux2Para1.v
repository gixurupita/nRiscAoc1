module Mux2Para1 (Porta1, Porta2, Selecao, SaidaMUX2);
    input wire [7:0] Porta1, Porta2; 
    input wire Selecao;
    output reg [7:0] SaidaMUX2;
    
    always @(*) begin
        case (Selecao)
            1'b0: SaidaMUX2 = Porta1;
            1'b1: SaidaMUX2 = Porta2;
        endcase
    end
endmodule
