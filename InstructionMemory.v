`timescale 1ns / 1ps

module InstructionMemory (
        input [31:0] in_pc,
        output reg [31:0] out_inst
    );

    integer i;
    reg [31:0] imem [65535:0];

    initial begin
        for (i = 0; i < 65535; i = i + 1) begin
            imem[i] = 0;
        end
        $readmemb("machinecode.txt", imem, 0, 10);
        out_inst = 0;
    end

    always @(in_pc) begin
        out_inst = imem[in_pc];
    end

endmodule // InstructionMemory
