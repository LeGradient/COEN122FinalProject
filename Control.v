`timescale 1ns / 1ps

module Control (
        input [3:0] in_opcode,
        output reg out_regwrt,
        output reg out_memrd,
        output reg out_memwrt,
        output reg out_alusrc,
        output reg [2:0] out_aluop,
        output reg out_memtoreg,
        output reg out_branch,
        output reg out_btype,
        output reg out_jump
    );

    always @(in_opcode) begin
        out_memrd = !in_opcode[3] && !in_opcode[2] && !in_opcode[1] && in_opcode[0]
                    || in_opcode[3] && in_opcode[1] && !in_opcode[0];

        out_memwrt = !in_opcode[3] && !in_opcode[2] && in_opcode[1];

        out_alusrc = in_opcode[3] && in_opcode[2];

        out_jump = in_opcode[3] && !in_opcode[2] && !in_opcode[0];

        out_regwrt = in_opcode[2]
                    || !in_opcode[3] && !in_opcode[1] && in_opcode[0];

        out_memtoreg = in_opcode[3] && !in_opcode[0];

        // ALUOp
        // add
        if (in_opcode == 4'b1111 || in_opcode == 4'b0100)
            out_aluop = 3'b100;
        // increment
        else if (in_opcode == 4'b0101)
            out_aluop = 3'b010;
        // negate
        else if (in_opcode == 4'b0110)
            out_aluop = 3'b001;
        // subtract
        else if (in_opcode == 4'b0111)
            out_aluop = 3'b000;
        // pass
        if (in_opcode == 4'b1000 || in_opcode == 4'b1001 || in_opcode == 4'b1011)
            out_aluop = 3'b111;
        // nop
        else
            out_aluop = 3'b011;
    end

endmodule // Control
