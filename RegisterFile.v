`timescale 1ns / 1ps

module RegisterFile (
        input in_ctrl_regwrt,
        input [5:0] in_rs,
        input [5:0] in_rt,
        input [5:0] in_rd,
        input [31:0] in_rdval,
        output reg [31:0] out_rsval,
        output reg [31:0] out_rtval
    );

    integer i;
    reg [31:0] regfile [63:0];      //we have 64 32-bit registers

    initial begin
        for (i = 0; i < 64; i = i + 1) begin
            regfile[i] = 0;
            $dumpvars(0, regfile[i]);
        end

        // // DATA 1
        // regfile[1] = 8;
        // regfile[2] = 'h100;

        // // DATA 2
        // regfile[1] = 10;
        // regfile[2] = 'h80;

        // // DATA 3
        // regfile[1] = 6;
        // regfile[2] = 'h40;

        // DATA 4
        regfile[1] = 12;
        regfile[2] = 'h20;

        out_rsval = 0;
        out_rtval = 0;
    end

    always @(in_rs or in_rt or in_rd or in_rdval or in_ctrl_regwrt) begin
        if (in_ctrl_regwrt)
            regfile[in_rd] = in_rdval;
        out_rsval = regfile[in_rs];
        out_rtval = regfile[in_rt];
    end

    always @(regfile[3])
        $display("Regfile[3]: %h", regfile[3]);

endmodule // RegisterFile
