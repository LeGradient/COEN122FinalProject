`timescale 1ns / 1ps

module CPUTestbench();
    reg clk;

    CPU DUT (.clk(clk));

    initial begin
        clk = 0;
    end

    always begin
        #100 clk = !clk;
        #1000 $finish;
    end
endmodule
