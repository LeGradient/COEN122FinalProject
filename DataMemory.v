`timescale 1ns / 1ps

module DataMemory(
    input clk,
    input read,
    input write,
    input [31:0] addr,
    input [31:0] in,
    output reg [31:0] out
    );
    
    reg [31:0] mem [65535:0];
    
    integer i;
    initial begin
        for (i = 0; i < 65536; i = i + 1) begin
            mem[i] = i;
        end
    end
    
    always @(posedge clk) begin
        if (write == 1)
            mem[addr] = in;
        if (read == 1)
            out = mem[addr];
    end
endmodule
