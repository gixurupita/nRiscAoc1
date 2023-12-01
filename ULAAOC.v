module ULAAOC(ULAOp, Dado1, Dado2, Zero, SaidaULA) ;
input wire signed [1:0] ULAOp;
input wire signed [7:0] Dado1,Dado2;
output reg Zero;
output reg [7:0] SaidaULA;

//definido a partir do documento do roteiro 9

always @(*)
    begin
        case (ULAOp)
        2'b00: begin // soma
            SaidaULA = Dado2 + Dado1;
            Zero = 1'b0;
        end

        2'b01: begin //subtracao
            SaidaULA = Dado1 - Dado2;
            if (SaidaULA == 8'b00000000)
                Zero = 1'b1;
            else
                Zero = 1'b0;
        end

        2'b10: begin //set on less than
            if (Dado1 < Dado2) // tem que comparar com sinal >:
            begin //Dado 1 < Dado2
                SaidaULA = 1;
                Zero = 0;
            end
            else
            begin
                SaidaULA = 0;
                Zero = 0;
            end
        end
        
        2'b11:begin  //impossivel
            SaidaULA = 8'b00000000;
            Zero = 1'b0;
        end
        endcase
    end
endmodule