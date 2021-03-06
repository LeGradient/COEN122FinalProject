`timescale 1ns / 1ps

module Control (
        input [3:0] in_opcode,
        output reg out_ctrl_regwrt,
        output reg out_ctrl_memrd,
        output reg out_ctrl_memwrt,
        output reg out_ctrl_alusrc,
        output reg [2:0] out_ctrl_aluop,
        output reg out_ctrl_memtoreg,
        output reg out_ctrl_branch,
        output reg out_ctrl_btype,
        output reg out_ctrl_jump
    );

    initial begin
        out_ctrl_regwrt = 0;
        out_ctrl_memrd = 0;
        out_ctrl_memwrt = 0;
        out_ctrl_alusrc = 0;
        out_ctrl_aluop = 3'b011;    // NOP
        out_ctrl_memtoreg = 0;
        out_ctrl_branch = 0;
        out_ctrl_btype = 0;
        out_ctrl_jump = 0;
    end

    always @(in_opcode) begin
        out_ctrl_memrd = !in_opcode[3] && !in_opcode[2] && !in_opcode[1] && in_opcode[0]
                    || in_opcode[3] && in_opcode[1] && !in_opcode[0];

        out_ctrl_memwrt = in_opcode == 4'b0011;

        out_ctrl_alusrc = in_opcode == 4'b1111;

        out_ctrl_jump = in_opcode[3] && !in_opcode[2] && !in_opcode[0];

        out_ctrl_regwrt = in_opcode[2]
                    || !in_opcode[3] && !in_opcode[1] && in_opcode[0];

        out_ctrl_memtoreg = in_opcode == 4'b1110;

        out_ctrl_branch = in_opcode == 4'b1001 || in_opcode == 4'b1011;

        out_ctrl_btype = in_opcode == 4'b1011;

        // ALUop
        begin
            case (in_opcode)
            // add
                4'b1111: out_ctrl_aluop = 3'b100;
                4'b0100: out_ctrl_aluop = 3'b100;
            // increment
                4'b0101: out_ctrl_aluop = 3'b010;
            // negate
                4'b0110: out_ctrl_aluop = 3'b001;
            // subtract
                4'b0111: out_ctrl_aluop = 3'b000;
            // pass
                4'b1000: out_ctrl_aluop = 3'b111;
                4'b1001: out_ctrl_aluop = 3'b111;
                4'b1011: out_ctrl_aluop = 3'b111;
            // nop
                default: out_ctrl_aluop = 3'b011;
            endcase
        end
    end

endmodule // Control
