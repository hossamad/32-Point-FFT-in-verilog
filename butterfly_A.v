
module butterfly_A(
input clk,reset,load,en_real,en_imag,
input wire signed [15:0] ar,ai,
input wire signed [15:0] br,
input wire signed [15:0] bi,
input wire signed [15:0] wr,
input wire signed [15:0] wi,
input [1:0] s,
output reg signed [15:0] real_out,
output reg signed [15:0] imag_out
    );
wire signed [15:0]  mux_real_1_out, mux_real_2_out,mux_imag_1_out, mux_imag_2_out;  
//multiply bi by -1(in fixed rep.):
// note that:
//1- in verilog unsigned * signed = unsigned, which ...
//why I must declare minus one in a signed wire data type.
//2- with signed multiplication, you must perform a sign extention. 
wire signed [15:0] minus_one_in_fp=16'b1111111100000000;     
wire signed [31:0] bi_opposite_sign_noiseless =bi*minus_one_in_fp ;  
//concatenate signed bit with part of the multiplication result.
wire signed [15:0] bi_opposite_sign_noisy={bi_opposite_sign_noiseless[31],bi_opposite_sign_noiseless[22:8]};
 
MUX mux_real_1 ( .A_0(ar )                  ,.A_1(br), .A_2(bi_opposite_sign_noisy ), .A_3(16'd0 ),.s(s), .out(mux_real_1_out));  
MUX mux_real_2 ( .A_0(16'b0000000100000000 ),.A_1(wr), .A_2(wi ),            .A_3(16'd0), .s(s), .out(mux_real_2_out)); 
   
MUX mux_imag_1 ( .A_0(ai),                    .A_1(br), .A_2(bi ), .A_3(16'd0 ),.s(s), .out(mux_imag_1_out));
MUX mux_imag_2 ( .A_0(16'b0000000100000000 ), .A_1(wi), .A_2(wr ), .A_3(16'd0 ),.s(s), .out(mux_imag_2_out));    

wire signed [15:0] mac_out_real, mac_out_imag;

mac mac_real (.clk(clk), .reset(reset), .load(load), .x1(mux_real_1_out), .x2(mux_real_2_out), .mac_out(mac_out_real));
mac mac_imag (.clk(clk), .reset(reset), .load(load), .x1(mux_imag_1_out), .x2(mux_imag_2_out), .mac_out(mac_out_imag));
// regs with enable
always @ (posedge clk , posedge reset) begin
if (reset)
real_out=16'd0;
else if (en_real)
real_out=mac_out_real;
end

always @ (posedge clk , posedge reset) begin
if (reset)
imag_out=16'd0;
else if (en_imag)
imag_out=mac_out_imag;
end

endmodule
