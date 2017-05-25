`timescale 1ns / 1ps

module ALU (
        input clk,
        input [31:0] in_a,
        input [31:0] in_b,
        input [2:0] ctrl_aluop,
        output reg [31:0] out
    );

    always @(posedge clk) begin
        if (ctrl_aluop == 'b100)
            out = in_b + in_a;
        else if (ctrl_aluop == 'b010)
            out = in_a + 1;
        else if (ctrl_aluop == 'b001)
            out = -in_a;
        else if (ctrl_aluop == 'b000)
            out = in_b - in_a;
        else if (ctrl_aluop == 'b111)
            out = in_a;
    end

endmodule // ALU
