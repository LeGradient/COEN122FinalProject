`timescale 1ns / 1ps

module ProgramCounter (
        input clk,
        input[31:0] in,
        output reg [31:0] out
    );
    reg [31:0] pc;

    initial begin
        pc = 0;
        out = 0;
    end

    always @(posedge clk) begin
        out = pc;
        $display("pc out: %d", pc);
    end

    always @(negedge clk) begin
        pc = in;
    end
endmodule // ProgramCounter
