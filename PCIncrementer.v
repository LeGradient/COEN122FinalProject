`timescale 1ns / 1ps

module PCIncrementer (
        input clk,
        input [31:0] in_pc,
        output reg [31:0] out_pc
    );

    always @(posedge clk)
        out_pc = in_pc + 1;

endmodule // PCIncrementer
