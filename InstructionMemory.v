`timescale 1ns / 1ps

module InstructionMemory (
        input clk,
        input [31:0] in_pc,
        output reg [31:0] out_instr
    );

    integer i;
    reg [31:0] imem [65535:0];

    initial begin
        for (i = 0; i < 65536; i = i + 1)
            imem[i] = 0;
    end

    always @(posedge clk)
        out_instr = imem[in_pc];

endmodule // InstructionMemory
