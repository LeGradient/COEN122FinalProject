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
    output [5:0] out_rd,

	);