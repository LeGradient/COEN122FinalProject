`timescale 1ns / 1ps

module InstructionMemory (
        input clk,
        input [31:0] in_pc,
        output reg [31:0] out_inst
    );

    integer i;
    reg [31:0] imem [65535:0];

    initial begin
        for (i = 0; i < 65536; i = i + 1) begin
            imem[i] = 0;
        end
        $readmemb("machinecode.txt", imem);
        for (i = 0; i < 11; i = i + 1) begin
            $display("%h", imem[i]);
        end
    end

    always @(posedge clk)
        out_inst = imem[in_pc];

endmodule // InstructionMemory
