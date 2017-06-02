`timescale 1ns / 1ps

module Multiplexer(
    input [31:0] in_data0,
    input [31:0] in_data1,
    input select,
    output reg [31:0] out_data
    );
    
    always @ (in_data0 or in_data1 or select)
    begin
        case (select)
            2'b00 : out_data = in_data0;
            2'b01 : out_data = in_data1;
        endcase
     end
endmodule
