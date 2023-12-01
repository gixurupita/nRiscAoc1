module ConcatenaBit(Entrada2Bits, Saida3Bits);//(Entrada2Bits, Saida3Bits);
    input wire [1:0] Entrada2Bits;
    output reg [2:0] Saida3Bits;

    initial begin
        // Concatena 1 à esqierda do valor da entrada
        Saida3Bits = {1'b1, Entrada2Bits[1:0]};
    end
endmodule