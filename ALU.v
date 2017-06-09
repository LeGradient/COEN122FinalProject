`timescale 1ns / 1ps

module ALU (
        input [31:0] in_a,
        input [31:0] in_b,
        input [2:0] in_ctrl_aluop,
        output reg [31:0] out_result,
        output reg out_zero,
        output reg out_neg
    );

    initial begin
        out_result = 0;
        out_zero = 0;
        out_neg = 0;
    end

    always @(in_a or in_b or in_ctrl_aluop) begin
        if (in_ctrl_aluop == 3'b100)
            out_result = in_b + in_a;
        else if (in_ctrl_aluop == 3'b010)
            out_result = in_a + 1;
        else if (in_ctrl_aluop == 3'b001)
            out_result = -in_a;
        else if (in_ctrl_aluop == 3'b000)
            out_result = in_b - in_a;
        else if (in_ctrl_aluop == 3'b111)
            out_result = in_a;

        // don't change flags if pass
        if (in_ctrl_aluop != 3'b111) begin
            out_zero = out_result == 0;
            out_neg = out_result[31];
        end
    end

endmodule // ALU
