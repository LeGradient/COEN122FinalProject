`timescale 1ns / 1ps

module RegisterFile (
        input clk,
        input in_ctrl_regwrt,
        input [5:0] in_rs,
        input [5:0] in_rt,
        input [5:0] in_rd,
        input [31:0] in_rdval,
        output reg [31:0] out_rsval,
        output reg [31:0] out_rtval
    );

    integer i;
    reg [31:0] regfile [63:0];      //we have 64 32-bit registers

    initial begin
        for (i = 0; i < 64; i = i + 1)
            regfile[i] = 0;

    end

    always @(posedge clk) begin
        if (in_ctrl_regwrt)
            regfile[in_rd] = in_rdval;
        out_rsval = regfile[in_rs];
        out_rtval = regfile[in_rt];
    end

endmodule // RegisterFile
