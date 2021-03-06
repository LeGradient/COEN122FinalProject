`timescale 1ns / 1ps

module IF_IDBuffer(
    input clk,

    input [31:0] in_pc,
    input [31:0] in_inst,

    output reg [31:0] out_pc,
    output reg [31:0] out_inst
    );

    reg [31:0] pc_buff;
    reg [31:0] inst_buff;

    initial begin
        pc_buff = 0;
        inst_buff = 0;
        out_pc = 0;
        out_inst = 0;
    end

    always@(negedge clk) begin
        pc_buff = in_pc;
        inst_buff = in_inst;
    end

    always@(posedge clk) begin
        out_pc = pc_buff;
        out_inst = inst_buff;
    end

endmodule
