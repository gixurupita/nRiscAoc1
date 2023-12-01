module ULAAOC(ULAOp,dado1, dado2,zero, resultado) ;
input wire signed [1:0] ULAOp;
input wire signed [7:0] dado1,dado2;
output reg zero;
output reg [7:0] resultado;

//definido a partir do documento do roteiro 9 

  always @(*)
    begin
      case (ULAOp)
        2'b00: begin // soma
          resultado = dado2 + dado1;
          zero = 1'b0;
        end

        2'b01: begin //subtracao
          resultado = dado1 - dado2;
          if (resultado == 8'b00000000)
          zero = 1'b1;
          else
          zero = 1'b0;
        end

        2'b10: begin //set on less than
          if (dado1 < dado2) // tem que comparar com sinal >:
            begin //dado 1 < dado2
               resultado = 1;
              zero = 0;
            end
          else 
            begin
              resultado = 0;
              zero = 0;
            end
        end
	2'b11:begin  //impossivel
	resultado = 8'b00000000;
	zero = 1'b0;
	end
      endcase
    end
endmodule