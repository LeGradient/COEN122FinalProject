/*
    Includes:
        register to store PC value
        adder to increment PC value
        MUX to choose between PC + 1 and $rs
*/
module ProgramCounter (
        input clk,
        input[31:0] in,
        output reg [31:0] out
    );
    reg [31:0] pc;

    always @(posedge clk)
        pc = in;

    always @(negedge clk)
        out = pc;

endmodule // ProgramCounter
