`timescale 1ns / 1ps

module DataMemory(
    input clk,
    input in_ctrl_read,
    input in_ctrl_write,
    input [31:0] in_addr,
    input [31:0] in_data,
    output reg [31:0] out_data
    );

    reg [31:0] mem [65535:0];

    integer i;
    initial begin
        for (i = 0; i < 65536; i = i + 1) begin
            mem[i] = i;
        end

        // DATA 1
        $readmemh("data1.txt", mem, 'h100, 'h107);

        // DATA 2
        $readmemh("data2.txt", mem, 'h80, 'h89);

        // DATA 3
        $readmemh("data3.txt", mem, 'h40, 'h45);

        // DATA 4
        $readmemh("data4.txt", mem, 'h20, 'h2B);
    end

    always @(posedge clk) begin
        if (in_ctrl_write == 1)
            mem[in_addr] = in_data;
        if (in_ctrl_read == 1)
            out_data = mem[in_addr];
    end
endmodule
