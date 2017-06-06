`timescale 1ns / 1ps

module CPUTestbench();
    reg clk;

    CPU DUT (.clk(clk));

    initial begin
    	$dumpvars;
        clk = 0;
        #30000 $finish;
    end

    always begin
        #100 clk = !clk;
    end
endmodule
