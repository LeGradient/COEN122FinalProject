/* FIXME: 
FIX PASS AND NOOP
*/ 
`timescale 1ns / 1ps

module ALU (
        input clk,
        input [31:0] in_a,
        input [31:0] in_b,
        input [2:0] in_ctrl_aluop,
        output reg [31:0] out_result,
        output reg out_zero,
        output reg out_neg
    );

    always @(posedge clk) begin
        if (in_ctrl_aluop == 'b100)
            out_result = in_b + in_a;
        else if (in_ctrl_aluop == 'b010)
            out_result = in_a + 1;
        else if (in_ctrl_aluop == 'b001)
            out_result = -in_a;
        else if (in_ctrl_aluop == 'b000)
            out_result = in_b - in_a;
        else if (in_ctrl_aluop == 'b111)
            out_result = in_a;

        out_zero = out_result == 0;
        out_neg = out_result < 0;
    end

endmodule // ALU
