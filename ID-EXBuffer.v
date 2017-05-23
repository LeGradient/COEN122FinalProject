`timescale 1ns / 1ps

module idexbuffer(
    input clk,
    input [32:0] in_pc,
    input in_ctrl_mread,
    input in_ctrl_mwrite,
    input [3:0] in_ctrl_aluop,
    output [32:0] out_pc,
    output [32:0] out_inst
    );
    
    reg [32:0] pc_buff;
    reg [32:0] inst_buff;
    
    always@(posedge clk) begin
        pc_buff = in_pc;
        inst_buff = in_inst;
    end
    
    always@(negedge clk) begin
        out_pc = pc_buff;
        out_inst = inst_buff;
    end
    
endmodule
