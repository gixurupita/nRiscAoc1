module Mux4Para1 (Porta1, Porta2, Porta3, Porta4, Selecao, SaidaMUX4);
    input wire [7:0] Porta1, Porta2, Porta3, Porta4; 
    input wire [1:0] Selecao;
    output reg [7:0] SaidaMUX4;
    
    always @(*) begin
        case (Selecao)
            2'b00: SaidaMUX4 = Porta1;
            2'b01: SaidaMUX4 = Porta2;
            2'b10: SaidaMUX4 = Porta3;
            2'b11: SaidaMUX4 = Porta4;
        endcase
    end
endmodule
