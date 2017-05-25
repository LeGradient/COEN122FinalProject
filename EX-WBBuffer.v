`timescale 1ns / 1ps

module exwbbuffer (
	input clk,

    /* WB Control */
    input in_ctrl_regwrt,
    input in_ctrl_branch,
    input in_ctrl_btype,
    input in_ctrl_jump,
    input in_ctrl_memtoreg,
    input in_ctrl_neg,
    input in_ctrl_zero,

    /* WB Data */
    input [32:0] in_memdata,
    input [32:0] in_aluresult,
    input [5:0] in_rd,

	/* WB Control */
    output out_ctrl_regwrt,
    output out_ctrl_branch,
    output out_ctrl_btype,
    output out_ctrl_jump,
    output out_ctrl_memtoreg,
    output out_ctrl_neg,
    output out_ctrl_zero,
    
    /* WB Data */
    output [32:0] out_memdata,
    output [32:0] out_aluresult,
    output [5:0] out_rd

	);
    
    /* WB Control Bufffer */
    reg ctrl_regwrt_buff;
    reg ctrl_branch_buff;
    reg ctrl_btype_buff;
    reg ctrl_jump_buff;
    reg ctrl_memtoreg_buff;
    reg ctrl_neg_buff;
    reg ctrl_zero_buff;

    /* WB Data Buffer */
    reg memdata_buff;
    reg aluresult_buff;
    reg [5:0] rd_buff;

    always@(posedge clk) begin 
        /* WB Control */ 
        ctrl_regwrt_buff = in_ctrl_regwrt;
        ctrl_branch_buff = in_ctrl_branch;
        ctrl_btype_buff = in_ctrl_btype;
        ctrl_jump_buff = in_ctrl_jump;
        ctrl_memtoreg_buff = in_ctrl_memtoreg;
        ctrl_neg_buff = in_ctrl_neg;
        ctrl_zero_buff = in_ctrl_zero;

        /* WB Data */
        memdata_buff = in_memdata;
        aluresult_buff = in_aluresult;
        rd_buff = in_rd;
    end

    always@(negedge clk) begin
        /* WB Control */ 
        out_ctrl_regwrt = ctrl_regwrt_buff;
        out_ctrl_branch = ctrl_branch_buff;
        out_ctrl_btype = ctrl_btype_buff;
        out_ctrl_jump = ctrl_jump_buff;
        out_ctrl_memtoreg = ctrl_memtoreg_buff;
        out_ctrl_neg = ctrl_neg_buff;
        out_ctrl_zero = ctrl_zero_buff;

        /* WB Data */
        out_memdata = memdata_buff;
        out_aluresult = aluresult_buff;
        out_rd = rd_buff;
    end


endmodule