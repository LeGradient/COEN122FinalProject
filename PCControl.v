`timescale 1ns / 1ps

/*
    in_ctrl_btype:
        0: BRZ - branch if zero
        1: BRN - branch if negative
*/
module PCControl (
        input in_ctrl_branch,
        input in_ctrl_btype,
        input in_ctrl_jump,
        input in_ctrl_neg,
        input in_ctrl_zero,
        output reg out
    );

    initial
        out = 0;

    always @(in_ctrl_branch or in_ctrl_btype or in_ctrl_jump or in_ctrl_neg or in_ctrl_zero)
        out = in_ctrl_jump
            || (in_ctrl_branch && !in_ctrl_btype && in_ctrl_zero)
            || (in_ctrl_branch && in_ctrl_btype && in_ctrl_neg);

endmodule // PCControl
