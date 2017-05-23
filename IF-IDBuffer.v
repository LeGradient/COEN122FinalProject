`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Kush Mahajani
// 
// Create Date: 05/22/2017 05:59:55 PM
// Design Name: 
// Module Name: ifidbuffer.v
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ifidbuffer(
    input clk,
    input [32:0] in_pc,
    input [32:0] in_inst,
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
