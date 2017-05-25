module PCIncrementer (
        input clk,
        input in_pc,
        output reg out_pc
    );

    always @(posedge clk)
        out_pc = in_pc + 1;

endmodule // PCIncrementer
