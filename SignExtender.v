`timescale 1ns / 1ps

module SignExtender (
        input [21:0] in,
        output reg [31:0] out
    );

    integer i;

    initial begin
        out = 0;
    end

    always @(in) begin
        out = in;
        for (i = 22; i < 32; i = i + 1)
            out[i] = in[21];
    end

endmodule // SignExtender
