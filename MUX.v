`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/19/2022 01:52:55 PM
// Design Name: 
// Module Name: MUX
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module MUX(
input wire signed [15:0] A_0 ,
input wire signed [15:0] A_1 ,
input wire signed [15:0] A_2 ,
input wire signed [15:0] A_3 ,
input wire signed [1:0] s,
output reg signed [15:0] out
    );
always @(*) begin
    case(s)
3'd0 : out=A_0;
3'd1 : out=A_1;
3'd2 : out=A_2;
default : out=A_3;
endcase
end
endmodule
