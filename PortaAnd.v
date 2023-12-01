module PortaAnd(
    input wire Zero,
    input wire Branch,
    output reg SaidaAND);

    always @(*) 
    begin
        SaidaAND = Zero && Branch;
    end
endmodule