`timescale 1ns / 1ps

module EX_WBBuffer(
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
    input [31:0] in_memdata,
    input [31:0] in_aluresult,
    input [5:0] in_rd,

	/* WB Control */
    output reg out_ctrl_regwrt,
    output reg out_ctrl_branch,
    output reg out_ctrl_btype,
    output reg out_ctrl_jump,
    output reg out_ctrl_memtoreg,
    output reg out_ctrl_neg,
    output reg out_ctrl_zero,

    /* WB Data */
    output reg [31:0] out_memdata,
    output reg [31:0] out_aluresult,
    output reg [5:0] out_rd

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
    reg [31:0] memdata_buff;
    reg [31:0] aluresult_buff;
    reg [5:0] rd_buff;

	initial begin
		ctrl_regwrt_buff = 0;
		ctrl_branch_buff = 0;
		ctrl_btype_buff = 0;
		ctrl_jump_buff = 0;
		ctrl_memtoreg_buff = 0;
		ctrl_neg_buff = 0;
		ctrl_zero_buff = 0;

		memdata_buff = 0;
		aluresult_buff = 0;
		rd_buff = 0;

		out_ctrl_regwrt = 0;
		out_ctrl_branch = 0;
		out_ctrl_btype = 0;
		out_ctrl_jump = 0;
		out_ctrl_memtoreg = 0;
		out_ctrl_neg = 0;
		out_ctrl_zero = 0;
	end

    always@(negedge clk) begin
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

    always@(posedge clk) begin
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
