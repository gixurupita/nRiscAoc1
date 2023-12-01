module ULAAOC(ULAOp, dado1, dado2, zero, saidaULA) ;
input wire signed [1:0] ULAOp;
input wire signed [7:0] dado1,dado2;
output reg zero;
output reg [7:0] saidaULA;

//definido a partir do documento do roteiro 9

always @(*)
    begin
        case (ULAOp)
        2'b00: begin // soma
            saidaULA = dado2 + dado1;
            zero = 1'b0;
        end

        2'b01: begin //subtracao
            saidaULA = dado1 - dado2;
            if (saidaULA == 8'b00000000)
                zero = 1'b1;
            else
                zero = 1'b0;
        end

        2'b10: begin //set on less than
            if (dado1 < dado2) // tem que comparar com sinal >:
            begin //dado 1 < dado2
                saidaULA = 1;
                zero = 0;
            end
            else
            begin
                saidaULA = 0;
                zero = 0;
            end
        end
        2'b11:begin  //impossivel
            saidaULA = 8'b00000000;
            zero = 1'b0;
        end
        endcase
    end
endmodule


module testeULA ();
reg[1:0] ULAOp;
reg signed [7:0] dado1 , dado2;
wire zero;
wire signed [7:0] saidaULA;

    // Instanciando o modulo da ULA
ULAAOC ULA_inst (
    .ULAOp(ULAOp),
    .dado1(dado1),
    .dado2(dado2),
    .zero(zero),
    .saidaULA(saidaULA)
);

initial begin: testeULA
        ULAOp = 2'b00;
        dado1 =  2;
        dado2 =  3;
        $display("Teste positivos");
        $display("Tempo  ULAOp   dado1    dado2    saidaULA      zero");
        $monitor(" %0d      %b       %d      %d      %d        %d", $time, ULAOp, dado1, dado2, saidaULA, zero);
        #1 ULAOp = 2'b01;
        #1 ULAOp = 2'b10;
        #1 ULAOp = 2'b00;
        dado1 =  -3;
        dado2 =  -3;
        $display("\nTeste negativos");
        $display("Tempo  ULAOp   dado1    dado2    saidaULA      zero");
        $monitor(" %0d      %b       %d      %d      %d        %d", $time, ULAOp, dado1, dado2, saidaULA, zero);
        #1 ULAOp = 2'b01;
        #1 ULAOp = 2'b10;
        end

endmodule
