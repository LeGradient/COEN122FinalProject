module SignExtender (
        input clk,
        input [21:0] in,
        output reg [31:0] out
    );

    integer i;

    always @(posedge clk) begin
        out = in;
        for (i = 22; i < 32; i++)
            out[i] = in[21];
    end

endmodule // SignExtender
