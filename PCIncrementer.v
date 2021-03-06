`timescale 1ns / 1ps

module PCIncrementer (
        input [31:0] in_pc,
        output reg [31:0] out_pc
    );

    always @(in_pc)
        out_pc = in_pc + 1;

endmodule // PCIncrementer
