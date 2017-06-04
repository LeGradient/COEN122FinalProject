`timescale 1ns / 1ps

module ID_EXBuffer(
    input clk,

    /* WB Control */
    input in_ctrl_regwrt,
    input in_ctrl_branch,
    input in_ctrl_btype,
    input in_ctrl_jump,
    input in_ctrl_memtoreg,

    /* EX Control */
    input in_ctrl_memrd,
    input in_ctrl_memwrt,
    input [2:0] in_ctrl_aluop,
    input in_ctrl_alusrc,

    /* EX Data */
    input [31:0] in_pc,
    input [31:0] in_rs,
    input [31:0] in_rt,
    input [31:0] in_x,
    input [5:0] in_rd,

    /* WB Control */
    output reg out_ctrl_regwrt,
    output reg out_ctrl_branch,
    output reg out_ctrl_btype,
    output reg out_ctrl_jump,
    output reg out_ctrl_memtoreg,

    /* EX Control */
    output reg out_ctrl_memrd,
    output reg out_ctrl_memwrt,
    output reg [2:0] out_ctrl_aluop,
    output reg out_ctrl_alusrc,

    /* EX Data */
    output reg [31:0] out_pc,
    output reg [31:0] out_rs,
    output reg [31:0] out_rt,
    output reg [31:0] out_x,
    output reg [5:0] out_rd
    );
    
    /* WB Control Bufffer */
    reg ctrl_regwrt_buff;
    reg ctrl_branch_buff;
    reg ctrl_btype_buff;
    reg ctrl_jump_buff;
    reg ctrl_memtoreg_buff;

    /* EX Control Buffer */
    reg ctrl_memrd_buff;
    reg ctrl_memwrt_buff;
    reg [2:0] ctrl_aluop_buff;
    reg ctrl_alusrc_buff;

    /* EX Data Buffer */ 
    reg [31:0] pc_buff;
    reg [31:0] rs_buff;
    reg [31:0] rt_buff;
    reg [31:0] x_buff;
    reg [5:0] rd_buff;

    initial begin
        out_ctrl_regwrt = 0;
        out_ctrl_branch = 0;
        out_ctrl_btype = 0;
        out_ctrl_jump = 0;
        out_ctrl_memtoreg = 0;

        out_ctrl_memrd = 0;
        out_ctrl_memwrt = 0;
        out_ctrl_aluop = 011;
        out_ctrl_alusrc = 0;

        out_pc = 0;
        out_rs = 0;
        out_rt = 0;
        out_x = 0;
        out_rd = 0;     
    end

    always@(posedge clk) begin
        /* WB Control */ 
        ctrl_regwrt_buff = in_ctrl_regwrt;
        ctrl_branch_buff = in_ctrl_branch;
        ctrl_btype_buff = in_ctrl_btype;
        ctrl_jump_buff = in_ctrl_jump;
        ctrl_memtoreg_buff = in_ctrl_memtoreg;

        /* EX Control */
        ctrl_memrd_buff = in_ctrl_memrd;
        ctrl_memwrt_buff = in_ctrl_memwrt;
        ctrl_aluop_buff = in_ctrl_aluop;
        ctrl_alusrc_buff = in_ctrl_alusrc;

        /* EX Data */
        pc_buff = in_pc;
        rs_buff = in_rs;
        rt_buff = in_rt;
        x_buff = in_x;
        rd_buff = in_rd;
    end
    
    always@(negedge clk) begin
        /* WB Control */
        out_ctrl_regwrt = ctrl_regwrt_buff;
        out_ctrl_branch = ctrl_branch_buff;
        out_ctrl_btype = ctrl_btype_buff;
        out_ctrl_jump = ctrl_jump_buff;
        out_ctrl_memtoreg = ctrl_memtoreg_buff;

        /* EX Control */
        out_ctrl_memrd = ctrl_memrd_buff;
        out_ctrl_memwrt = ctrl_memwrt_buff;
        out_ctrl_aluop = ctrl_aluop_buff;
        out_ctrl_alusrc = ctrl_alusrc_buff;

        /* EX Data */
        out_pc = pc_buff;
        out_rs = rs_buff;
        out_rt = rt_buff;
        out_x = x_buff;
        out_rd = rd_buff;
    end
    
endmodule
