`timescale 1ns / 1ps

module PCControlTestbench ();
    reg [5:0] in;
    wire out;

    PCControl DUT(
        .in_ctrl_branch(in[0]),
        .in_ctrl_btype(in[1]),
        .in_ctrl_jump(in[2]),
        .in_ctrl_neg(in[3]),
        .in_ctrl_zero(in[4]),
        .out(out)
    );

    initial begin
        $dumpvars;
        in = 0;     // off
        #100
        in[0] = 1;  // off
        #100
        in[4] = 1;  // on
        #100
        in[1] = 1;  // off
        #100
        //for (in = 0; in < 6'b100000; in = in + 1) #100;
        $finish;
    end

endmodule // ControlTestbench
