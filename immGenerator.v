`include "opcodes.v"

module immGenerator(clk, reset_n, instruction, imm) ;
    input clk, reset_n;
    input [`WORD_SIZE-1:0] instruction;
    output [`WORD_SIZE-1:0]imm;

    reg [`WORD_SIZE-1:0] imm;

    wire [3:0] opcode;
    assign opcode = instruction[`WORD_SIZE-1:12];

    initial begin
      imm <= 0;
    end


    always @(*) begin
      case(opcode)
        `JMP_OP : imm <= instruction[11:0];
      	`JAL_OP : imm <= instruction[11:0];
        `ADI_OP : imm <= $signed(instruction[7:0]);
        `ORI_OP : imm <= $signed(instruction[7:0]);
        `LHI_OP : imm <= $signed(instruction[7:0]);
        `LWD_OP : imm <= $signed(instruction[7:0]);
        `SWD_OP : imm <= $signed(instruction[7:0]);
        `BNE_OP : imm <= $signed(instruction[7:0]);
        `BEQ_OP	: imm <= $signed(instruction[7:0]);
        `BGZ_OP	: imm <= $signed(instruction[7:0]);
        `BLZ_OP : imm <= $signed(instruction[7:0]);
        default : imm <= 0;
      endcase
    end
endmodule