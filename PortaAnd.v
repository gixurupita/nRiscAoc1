module PortaAnd(
    input wire Zero,
    input wire Branch,
    output reg resultado);

    always @(*) 
    begin
        resultado = Zero && Branch;
    end
endmodule