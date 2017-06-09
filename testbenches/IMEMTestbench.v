`timescale 1ns / 1ps

module IMEMTestbench ();
    reg clk;
    wire [31:0] pc_in;
    wire [31:0] pc_out;
    wire [31:0] inst;

    ProgramCounter pc (.clk(clk), .in(pc_in), .out(pc_out));
    PCIncrementer inc (.in_pc(pc_out), .out_pc(pc_in));
    InstructionMemory imem (.clk(clk), .in_pc(pc_out), .out_inst(inst));

    initial begin
        $dumpvars;
        clk = 0;
        #3000 $finish;
    end

    always
        #100 clk = !clk;

endmodule // IMEMTestbench
