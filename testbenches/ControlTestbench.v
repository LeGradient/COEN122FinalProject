`timescale 1ns / 1ps

module ControlTestbench ();
    reg [4:0] opcode;
    wire regwrt;
    wire memrd;
    wire memwrt;
    wire alusrc;
    wire [2:0] aluop;
    wire memtoreg;
    wire branch;
    wire btype;
    wire jump;

    Control DUT(
        .in_opcode(opcode[3:0]),
        .out_ctrl_regwrt(regwrt),
        .out_ctrl_memrd(memrd),
        .out_ctrl_memwrt(memwrt),
        .out_ctrl_alusrc(alusrc),
        .out_ctrl_aluop(aluop),
        .out_ctrl_memtoreg(memtoreg),
        .out_ctrl_branch(branch),
        .out_ctrl_btype(btype),
        .out_ctrl_jump(jump)
    );

    initial begin
        $dumpvars;
        for (opcode = 0; opcode < 5'b10000; opcode = opcode + 1) #100;
        $finish;
    end

endmodule // ControlTestbench
