module CTRL(Clock, OPcode,
MemToReg, 
EscMem, 
LerMem,
Branch,
ULAOp,
ULAFonte,
EscReg,
Jump,
EscPc,
moveReg,
RegDest);

input wire [2:0] OPcode;
input Clock;
output reg MemToReg, EscMem, LerMem, Branch, ULAFonte, EscReg, Jump, EscPc, moveReg, RegDest;
output reg[1:0] ULAOp;

always @ (posedge Clock) begin
casez(OPcode)

3'b000: begin //add
MemToReg = 1'b0;
EscMem = 1'b0;
LerMem = 1'b0;
Branch = 1'b0;
ULAOp = 2'b00;
ULAFonte = 1'b1;
EscReg = 1'b1;
Jump = 1'b0;
EscPc = 1'b1;
moveReg = 1'b0;
RegDest = 1'b1;
end

3'b001: begin //move
MemToReg = 1'bz;
EscMem = 1'b0;
LerMem = 1'b0;
Branch = 1'b0;
ULAOp = 2'bzz;
ULAFonte = 1'bz;
EscReg = 1'b1;
Jump = 1'b0;
EscPc = 1'b1;
moveReg = 1'b1;
RegDest = 1'b0;
end

3'b010: begin //slt
MemToReg = 1'b0;
EscMem = 1'b0;
LerMem = 1'b0;
Branch = 1'b0;
ULAOp = 2'b10;
ULAFonte = 1'b0;
EscReg = 1'b1;
Jump = 1'b0;
EscPc = 1'b1;
moveReg = 1'b0;
RegDest = 1'b1;
end

3'b011: begin //beq
MemToReg = 1'bz;
EscMem = 1'b0;
LerMem = 1'b0;
Branch = 1'b1;
ULAOp = 2'b01;
ULAFonte = 1'b0;
EscReg = 1'b0;
Jump = 1'b0;
EscPc = 1'b1;
moveReg = 1'bz;
RegDest = 1'bz;
end

3'b100: begin //jump
MemToReg = 1'bz;
EscMem = 1'b0;
LerMem = 1'b0;
Branch = 1'bz;
ULAOp = 2'bzz;
ULAFonte = 1'bz;
EscReg = 1'b0;
Jump = 1'b1;
EscPc = 1'b1;
moveReg = 1'bz;
RegDest = 1'bz;
end

3'b101: begin //sw
MemToReg = 1'b1;
EscMem = 1'b1;
LerMem = 1'b0;
Branch = 1'b0;
ULAOp = 2'bzz;
ULAFonte = 1'bz;
EscReg = 1'b0;
Jump = 1'b0;
EscPc = 1'b1;
moveReg = 1'bz;
RegDest = 1'bz;
end

3'b110: begin //lw
MemToReg = 1'b1;
EscMem = 1'b0;
LerMem = 1'b1;
Branch = 1'b0;
ULAOp = 2'bzz;
ULAFonte = 1'bz;
EscReg = 1'b1;
Jump = 1'b0;
EscPc = 1'b1;
moveReg = 1'b0;
RegDest = 1'b0;
end

3'b111: begin //halt
MemToReg = 1'bz;
EscMem = 1'b0;
LerMem = 1'b0;
Branch = 1'bz;
ULAOp = 2'bzz;
ULAFonte = 1'bz;
EscReg = 1'b0;
Jump = 1'bz;
EscPc = 1'b0;
moveReg = 1'bz;
RegDest = 1'bz;
end

endcase
end
endmodule
