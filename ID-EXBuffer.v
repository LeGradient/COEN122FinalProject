`timescale 1ns / 1ps

module idexbuffer(
    input clk,

    input in_ctrl_regwrt,
    input in_ctrl_branch,
    input in_ctrl_btype,
    input in_ctrl_jump,
    input in_ctrl_memtoreg,
    input in_ctrl_memrd,
    input in_ctrl_memwrt,
    input [3:0] in_ctrl_aluop,
    input in_ctrl_alusrc1,
    input in_ctrl_alusrc0,

    input [32:0] in_pc,
    input [32:0] in_rs,
    input [32:0] in_rt,
    input [32:0] in_x,
    input [5:0] in_rd,

    output out_ctrl_regwrt,
    output out_ctrl_branch,
    output out_ctrl_btype,
    output out_ctrl_jump,
    output out_ctrl_memtoreg,
    output out_ctrl_memrd,
    output out_ctrl_memwrt,
    output [3:0] out_ctrl_aluop,
    output out_ctrl_alusrc1,
    output out_ctrl_alusrc0,

    output [32:0] out_pc,
    output [32:0] out_rs,
    output [32:0] out_rt,
    output [32:0] out_x,
    output [5:0] out_rd
    );
    
    reg ctrl_regwrt_buff;
    reg ctrl_branch_buff;
    reg ctrl_btype_buff;
    reg ctrl_jump_buff;
    reg ctrl_memtoreg_buff;
    reg ctrl_memrd_buff;
    reg ctrl_memwrt_buff;
    reg [3:0] ctrl_aluop_buff;
    reg ctrl_alusrc1_buff;
    reg ctrl_alusrc0_buff;

    reg [32:0] pc_buff;
    reg [32:0] rs_buff;
    reg [32:0] rt_buff;
    reg [32:0] x_buff;
    reg [5:0] rd_buff;
    
    always@(posedge clk) begin
        ctrl_regwrt_buff = in_ctrl_regwrt;
        ctrl_branch_buff = in_ctrl_branch;
        ctrl_btype_buff = in_ctrl_btype;
        ctrl_jump_buff = in_ctrl_jump;
        ctrl_memtoreg_buff = in_ctrl_memtoreg;
        ctrl_memrd_buff = in_ctrl_memrd;
        ctrl_memwrt_buff = in_ctrl_memwrt;
        ctrl_aluop_buff = in_ctrl_aluop;
        ctrl_alusrc1_buff = in_ctrl_alusrc1;
        ctrl_alusrc0_buff = in_ctrl_alusrc0;

        pc_buff = in_pc;
        rs_buff = in_rs;
        rt_buff = in_rt;
        x_buff = in_x;
        rd_buff = in_rd;
    end
    
    always@(negedge clk) begin
        out_ctrl_regwrt = ctrl_regwrt_buff;
        out_ctrl_branch = ctrl_branch_buff;
        out_ctrl_btype = ctrl_btype_buff;
        out_ctrl_jump = ctrl_jump_buff;
        out_ctrl_memtoreg = ctrl_memtoreg_buff;
        out_ctrl_memrd = ctrl_memrd_buff;
        out_ctrl_memwrt = ctrl_memwrt_buff;
        out_ctrl_aluop = ctrl_aluop_buff;
        out_ctrl_alusrc1 = ctrl_alusrc1_buff;
        out_ctrl_alusrc0 = ctrl_alusrc0_buff;

        out_pc = pc_buff;
        out_rs = rs_buff;
        out_rt = rt_buff;
        out_x = x_buff;
        out_rd = rd_buff;
    end
    
endmodule