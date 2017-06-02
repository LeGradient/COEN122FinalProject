`timescale 1ns / 1ps

module ProgramCounter (
        input clk,
        input[31:0] in,
        output reg [31:0] out
    );
    reg [31:0] pc;

    initial
        pc = 0;

    always @(posedge clk)
        pc = in;

    always @(negedge clk)
        out = pc;

endmodule // ProgramCounter
