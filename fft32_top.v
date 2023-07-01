

module fft32_top(
input [15:0] xr_0, xr_1, xr_2, xr_3, xr_4, xr_5, xr_6, xr_7, xr_8, xr_9, xr_10, xr_11, xr_12, xr_13, xr_14, xr_15, xr_16,
 xr_17, xr_18, xr_19, xr_20, xr_21, xr_22, xr_23, xr_24, xr_25, xr_26, xr_27, xr_28, xr_29, xr_30, xr_31, 
xi_0, xi_1, xi_2, xi_3, xi_4, xi_5, xi_6, xi_7, xi_8, xi_9, xi_10, xi_11, xi_12, xi_13, xi_14, xi_15, 
xi_16, xi_17, xi_18, xi_19, xi_20, xi_21, xi_22, xi_23, xi_24, xi_25, xi_26, xi_27, xi_28, xi_29, xi_30, xi_31, 

  
  input clk_100, reset,
  
  output reg [15:0] outr_0, outr_1, outr_2, outr_3, outr_4, outr_5, outr_6, outr_7, outr_8,
   outr_9, outr_10, outr_11, outr_12, outr_13, outr_14, outr_15, outr_16, outr_17, outr_18, 
   outr_19, outr_20, outr_21, outr_22, outr_23, outr_24, outr_25, outr_26, outr_27, outr_28, 
   outr_29, outr_30, outr_31, outi_0, outi_1, outi_2, outi_3, outi_4, outi_5, outi_6, outi_7, 
   outi_8, outi_9, outi_10, outi_11, outi_12, outi_13, outi_14, outi_15, outi_16, outi_17, outi_18,
   outi_19, outi_20, outi_21, outi_22, outi_23, outi_24, outi_25, outi_26,
    outi_27, outi_28, outi_29, outi_30, outi_31
    );
 //clk divider
 wire clk_20;
 clk_divn generated_clk (.clk(clk_100),.reset(reset), .clk_out(clk_20));
    
//wr_k = cos(2*pi*k/32)   
wire signed [15:0] wr_0=16'b0000000100000000;
wire signed [15:0] wr_1=16'b0000000011111011;
wire signed [15:0] wr_2=16'b0000000011101100;
wire signed [15:0] wr_3=16'b0000000011010100;
wire signed [15:0] wr_4=16'b0000000010110101;
wire signed [15:0] wr_5=16'b0000000010001110;
wire signed [15:0] wr_6=16'b0000000001100001;
wire signed [15:0] wr_7=16'b0000000000110001;
wire signed [15:0] wr_8=16'b0000000000000000;
wire signed [15:0] wr_9=16'b1111111111001111;
wire signed [15:0] wr_10=16'b1111111110011111;
wire signed [15:0] wr_11=16'b1111111101110010;
wire signed [15:0] wr_12=16'b1111111101001011;
wire signed [15:0] wr_13=16'b1111111100101100;
wire signed [15:0] wr_14=16'b1111111100010100;
wire signed [15:0] wr_15=16'b1111111100000101;


//wi_k = -1*sin(2*pi*k/32) 


wire signed [15:0] wi_0=16'b0000000000000000;
wire signed [15:0] wi_1=16'b1111111111001111;
wire signed [15:0] wi_2=16'b1111111110011111;
wire signed [15:0] wi_3=16'b1111111101110010;
wire signed [15:0] wi_4=16'b1111111101001011;
wire signed [15:0] wi_5=16'b1111111100101100;
wire signed [15:0] wi_6=16'b1111111100010100;
wire signed [15:0] wi_7=16'b1111111100000101;
wire signed [15:0] wi_8=16'b1111111100000000;
wire signed [15:0] wi_9=16'b1111111100000101;
wire signed [15:0] wi_10=16'b1111111100010100;
wire signed [15:0] wi_11=16'b1111111100101100;
wire signed [15:0] wi_12=16'b1111111101001011;
wire signed [15:0] wi_13=16'b1111111101110010;
wire signed [15:0] wi_14=16'b1111111110011111;
wire signed [15:0] wi_15=16'b1111111111001111;



wire load, en_real, en_imag;
wire [1:0] s;
wire [2:0] counter_out;
counter counter_i (.clk(clk_100), .reset(reset), .counter_out(counter_out));

controller controller_i (.clk(clk_100), .reset(reset), .s(s), .counter_out(counter_out), .load(load), 
 .en_real(en_real), .en_imag(en_imag));
    
   
/////////////////////////////////////s1
wire  [15:0] outr_s1 [31:0];
wire  [15:0] outi_s1 [31:0];


butterfly_A s1_A_1 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(xr_0)   , .ai(xi_0) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(xr_16)   , .bi(xi_16) ,
.real_out(outr_s1[0]), .imag_out(outi_s1[0]));


butterfly_B s1_B_1 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(xr_0)   , .ai(xi_0) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(xr_16)   , .bi(xi_16) ,
.real_out(outr_s1[1]), .imag_out(outi_s1[1]));


butterfly_A s1_A_2 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(xr_8)   , .ai(xi_8) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(xr_24)   , .bi(xi_24) ,
.real_out(outr_s1[2]), .imag_out(outi_s1[2]));


butterfly_B s1_B_2 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(xr_8)   , .ai(xi_8) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(xr_24)   , .bi(xi_24) ,
.real_out(outr_s1[3]), .imag_out(outi_s1[3]));


butterfly_A s1_A_3 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(xr_4)   , .ai(xi_4) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(xr_20)   , .bi(xi_20) ,
.real_out(outr_s1[4]), .imag_out(outi_s1[4]));


butterfly_B s1_B_3 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(xr_4)   , .ai(xi_4) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(xr_20)   , .bi(xi_20) ,
.real_out(outr_s1[5]), .imag_out(outi_s1[5]));


butterfly_A s1_A_4 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(xr_12)   , .ai(xi_12) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(xr_28)   , .bi(xi_28) ,
.real_out(outr_s1[6]), .imag_out(outi_s1[6]));


butterfly_B s1_B_4 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(xr_12)   , .ai(xi_12) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(xr_28)   , .bi(xi_28) ,
.real_out(outr_s1[7]), .imag_out(outi_s1[7]));


butterfly_A s1_A_5 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(xr_2)   , .ai(xi_2) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(xr_18)   , .bi(xi_18) ,
.real_out(outr_s1[8]), .imag_out(outi_s1[8]));


butterfly_B s1_B_5 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(xr_2)   , .ai(xi_2) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(xr_18)   , .bi(xi_18) ,
.real_out(outr_s1[9]), .imag_out(outi_s1[9]));


butterfly_A s1_A_6 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(xr_10)   , .ai(xi_10) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(xr_26)   , .bi(xi_26) ,
.real_out(outr_s1[10]), .imag_out(outi_s1[10]));


butterfly_B s1_B_6 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(xr_10)   , .ai(xi_10) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(xr_26)   , .bi(xi_26) ,
.real_out(outr_s1[11]), .imag_out(outi_s1[11]));


butterfly_A s1_A_7 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(xr_6)   , .ai(xi_6) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(xr_22)   , .bi(xi_22) ,
.real_out(outr_s1[12]), .imag_out(outi_s1[12]));


butterfly_B s1_B_7 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(xr_6)   , .ai(xi_6) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(xr_22)   , .bi(xi_22) ,
.real_out(outr_s1[13]), .imag_out(outi_s1[13]));


butterfly_A s1_A_8 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(xr_14)   , .ai(xi_14) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(xr_30)   , .bi(xi_30) ,
.real_out(outr_s1[14]), .imag_out(outi_s1[14]));


butterfly_B s1_B_8 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(xr_14)   , .ai(xi_14) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(xr_30)   , .bi(xi_30) ,
.real_out(outr_s1[15]), .imag_out(outi_s1[15]));


butterfly_A s1_A_9 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(xr_1)   , .ai(xi_1) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(xr_17)   , .bi(xi_17) ,
.real_out(outr_s1[16]), .imag_out(outi_s1[16]));


butterfly_B s1_B_9 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(xr_1)   , .ai(xi_1) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(xr_17)   , .bi(xi_17) ,
.real_out(outr_s1[17]), .imag_out(outi_s1[17]));


butterfly_A s1_A_10 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(xr_9)   , .ai(xi_9) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(xr_25)   , .bi(xi_25) ,
.real_out(outr_s1[18]), .imag_out(outi_s1[18]));


butterfly_B s1_B_10 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(xr_9)   , .ai(xi_9) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(xr_25)   , .bi(xi_25) ,
.real_out(outr_s1[19]), .imag_out(outi_s1[19]));


butterfly_A s1_A_11 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(xr_5)   , .ai(xi_5) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(xr_21)   , .bi(xi_21) ,
.real_out(outr_s1[20]), .imag_out(outi_s1[20]));


butterfly_B s1_B_11 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(xr_5)   , .ai(xi_5) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(xr_21)   , .bi(xi_21) ,
.real_out(outr_s1[21]), .imag_out(outi_s1[21]));


butterfly_A s1_A_12 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(xr_13)   , .ai(xi_13) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(xr_29)   , .bi(xi_29) ,
.real_out(outr_s1[22]), .imag_out(outi_s1[22]));


butterfly_B s1_B_12 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(xr_13)   , .ai(xi_13) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(xr_29)   , .bi(xi_29) ,
.real_out(outr_s1[23]), .imag_out(outi_s1[23]));


butterfly_A s1_A_13 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(xr_3)   , .ai(xi_3) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(xr_19)   , .bi(xi_19) ,
.real_out(outr_s1[24]), .imag_out(outi_s1[24]));


butterfly_B s1_B_13 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(xr_3)   , .ai(xi_3) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(xr_19)   , .bi(xi_19) ,
.real_out(outr_s1[25]), .imag_out(outi_s1[25]));


butterfly_A s1_A_14 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(xr_11)   , .ai(xi_11) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(xr_27)   , .bi(xi_27) ,
.real_out(outr_s1[26]), .imag_out(outi_s1[26]));


butterfly_B s1_B_14 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(xr_11)   , .ai(xi_11) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(xr_27)   , .bi(xi_27) ,
.real_out(outr_s1[27]), .imag_out(outi_s1[27]));


butterfly_A s1_A_15 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(xr_7)   , .ai(xi_7) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(xr_23)   , .bi(xi_23) ,
.real_out(outr_s1[28]), .imag_out(outi_s1[28]));


butterfly_B s1_B_15 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(xr_7)   , .ai(xi_7) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(xr_23)   , .bi(xi_23) ,
.real_out(outr_s1[29]), .imag_out(outi_s1[29]));


butterfly_A s1_A_16 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(xr_15)   , .ai(xi_15) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(xr_31)   , .bi(xi_31) ,
.real_out(outr_s1[30]), .imag_out(outi_s1[30]));


butterfly_B s1_B_16 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(xr_15)   , .ai(xi_15) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(xr_31)   , .bi(xi_31) ,
.real_out(outr_s1[31]), .imag_out(outi_s1[31]));



/////////////////////////////s2
reg  [15:0] outr_s1_reg [31:0];
reg  [15:0] outi_s1_reg [31:0];
 
integer x;    
always @(posedge clk_20 ) begin
if (reset)
begin
for (x=0; x<32; x=x+1)
    begin
    outr_s1_reg[x]=15'd0;
    outi_s1_reg[x]=15'd0;
    end
end
else 
for (x=0; x<32; x=x+1)
begin
    begin
    outr_s1_reg[x]=outr_s1[x];
    outi_s1_reg[x]=outi_s1[x];
    end
end
end   

wire  [15:0] outr_s2 [31:0];
wire  [15:0] outi_s2 [31:0];


butterfly_A s2_A_0 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s1_reg[0])   , .ai(outi_s1_reg[0]) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(outr_s1_reg[2])   , .bi(outi_s1_reg[2]) ,
.real_out(outr_s2[0]), .imag_out(outi_s2[0]));


butterfly_B s2_B_0 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s1_reg[0])   , .ai(outi_s1_reg[0]) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(outr_s1_reg[2])   , .bi(outi_s1_reg[2]) ,
.real_out(outr_s2[2]), .imag_out(outi_s2[2]));


butterfly_A s2_A_1 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s1_reg[1])   , .ai(outi_s1_reg[1]) ,
.wr(wr_8)   , .wi(wi_8) ,
.br(outr_s1_reg[3])   , .bi(outi_s1_reg[3]) ,
.real_out(outr_s2[1]), .imag_out(outi_s2[1]));


butterfly_B s2_B_1 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s1_reg[1])   , .ai(outi_s1_reg[1]) ,
.wr(wr_8)   , .wi(wi_8) ,
.br(outr_s1_reg[3])   , .bi(outi_s1_reg[3]) ,
.real_out(outr_s2[3]), .imag_out(outi_s2[3]));


butterfly_A s2_A_2 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s1_reg[4])   , .ai(outi_s1_reg[4]) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(outr_s1_reg[6])   , .bi(outi_s1_reg[6]) ,
.real_out(outr_s2[4]), .imag_out(outi_s2[4]));


butterfly_B s2_B_2 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s1_reg[4])   , .ai(outi_s1_reg[4]) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(outr_s1_reg[6])   , .bi(outi_s1_reg[6]) ,
.real_out(outr_s2[6]), .imag_out(outi_s2[6]));


butterfly_A s2_A_3 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s1_reg[5])   , .ai(outi_s1_reg[5]) ,
.wr(wr_8)   , .wi(wi_8) ,
.br(outr_s1_reg[7])   , .bi(outi_s1_reg[7]) ,
.real_out(outr_s2[5]), .imag_out(outi_s2[5]));


butterfly_B s2_B_3 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s1_reg[5])   , .ai(outi_s1_reg[5]) ,
.wr(wr_8)   , .wi(wi_8) ,
.br(outr_s1_reg[7])   , .bi(outi_s1_reg[7]) ,
.real_out(outr_s2[7]), .imag_out(outi_s2[7]));


butterfly_A s2_A_4 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s1_reg[8])   , .ai(outi_s1_reg[8]) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(outr_s1_reg[10])   , .bi(outi_s1_reg[10]) ,
.real_out(outr_s2[8]), .imag_out(outi_s2[8]));


butterfly_B s2_B_4 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s1_reg[8])   , .ai(outi_s1_reg[8]) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(outr_s1_reg[10])   , .bi(outi_s1_reg[10]) ,
.real_out(outr_s2[10]), .imag_out(outi_s2[10]));


butterfly_A s2_A_5 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s1_reg[9])   , .ai(outi_s1_reg[9]) ,
.wr(wr_8)   , .wi(wi_8) ,
.br(outr_s1_reg[11])   , .bi(outi_s1_reg[11]) ,
.real_out(outr_s2[9]), .imag_out(outi_s2[9]));


butterfly_B s2_B_5 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s1_reg[9])   , .ai(outi_s1_reg[9]) ,
.wr(wr_8)   , .wi(wi_8) ,
.br(outr_s1_reg[11])   , .bi(outi_s1_reg[11]) ,
.real_out(outr_s2[11]), .imag_out(outi_s2[11]));


butterfly_A s2_A_6 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s1_reg[12])   , .ai(outi_s1_reg[12]) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(outr_s1_reg[14])   , .bi(outi_s1_reg[14]) ,
.real_out(outr_s2[12]), .imag_out(outi_s2[12]));


butterfly_B s2_B_6 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s1_reg[12])   , .ai(outi_s1_reg[12]) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(outr_s1_reg[14])   , .bi(outi_s1_reg[14]) ,
.real_out(outr_s2[14]), .imag_out(outi_s2[14]));


butterfly_A s2_A_7 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s1_reg[13])   , .ai(outi_s1_reg[13]) ,
.wr(wr_8)   , .wi(wi_8) ,
.br(outr_s1_reg[15])   , .bi(outi_s1_reg[15]) ,
.real_out(outr_s2[13]), .imag_out(outi_s2[13]));


butterfly_B s2_B_7 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s1_reg[13])   , .ai(outi_s1_reg[13]) ,
.wr(wr_8)   , .wi(wi_8) ,
.br(outr_s1_reg[15])   , .bi(outi_s1_reg[15]) ,
.real_out(outr_s2[15]), .imag_out(outi_s2[15]));


butterfly_A s2_A_8 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s1_reg[16])   , .ai(outi_s1_reg[16]) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(outr_s1_reg[18])   , .bi(outi_s1_reg[18]) ,
.real_out(outr_s2[16]), .imag_out(outi_s2[16]));


butterfly_B s2_B_8 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s1_reg[16])   , .ai(outi_s1_reg[16]) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(outr_s1_reg[18])   , .bi(outi_s1_reg[18]) ,
.real_out(outr_s2[18]), .imag_out(outi_s2[18]));


butterfly_A s2_A_9 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s1_reg[17])   , .ai(outi_s1_reg[17]) ,
.wr(wr_8)   , .wi(wi_8) ,
.br(outr_s1_reg[19])   , .bi(outi_s1_reg[19]) ,
.real_out(outr_s2[17]), .imag_out(outi_s2[17]));


butterfly_B s2_B_9 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s1_reg[17])   , .ai(outi_s1_reg[17]) ,
.wr(wr_8)   , .wi(wi_8) ,
.br(outr_s1_reg[19])   , .bi(outi_s1_reg[19]) ,
.real_out(outr_s2[19]), .imag_out(outi_s2[19]));


butterfly_A s2_A_10 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s1_reg[20])   , .ai(outi_s1_reg[20]) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(outr_s1_reg[22])   , .bi(outi_s1_reg[22]) ,
.real_out(outr_s2[20]), .imag_out(outi_s2[20]));


butterfly_B s2_B_10 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s1_reg[20])   , .ai(outi_s1_reg[20]) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(outr_s1_reg[22])   , .bi(outi_s1_reg[22]) ,
.real_out(outr_s2[22]), .imag_out(outi_s2[22]));


butterfly_A s2_A_11 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s1_reg[21])   , .ai(outi_s1_reg[21]) ,
.wr(wr_8)   , .wi(wi_8) ,
.br(outr_s1_reg[23])   , .bi(outi_s1_reg[23]) ,
.real_out(outr_s2[21]), .imag_out(outi_s2[21]));


butterfly_B s2_B_11 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s1_reg[21])   , .ai(outi_s1_reg[21]) ,
.wr(wr_8)   , .wi(wi_8) ,
.br(outr_s1_reg[23])   , .bi(outi_s1_reg[23]) ,
.real_out(outr_s2[23]), .imag_out(outi_s2[23]));


butterfly_A s2_A_12 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s1_reg[24])   , .ai(outi_s1_reg[24]) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(outr_s1_reg[26])   , .bi(outi_s1_reg[26]) ,
.real_out(outr_s2[24]), .imag_out(outi_s2[24]));


butterfly_B s2_B_12 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s1_reg[24])   , .ai(outi_s1_reg[24]) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(outr_s1_reg[26])   , .bi(outi_s1_reg[26]) ,
.real_out(outr_s2[26]), .imag_out(outi_s2[26]));


butterfly_A s2_A_13 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s1_reg[25])   , .ai(outi_s1_reg[25]) ,
.wr(wr_8)   , .wi(wi_8) ,
.br(outr_s1_reg[27])   , .bi(outi_s1_reg[27]) ,
.real_out(outr_s2[25]), .imag_out(outi_s2[25]));


butterfly_B s2_B_13 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s1_reg[25])   , .ai(outi_s1_reg[25]) ,
.wr(wr_8)   , .wi(wi_8) ,
.br(outr_s1_reg[27])   , .bi(outi_s1_reg[27]) ,
.real_out(outr_s2[27]), .imag_out(outi_s2[27]));


butterfly_A s2_A_14 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s1_reg[28])   , .ai(outi_s1_reg[28]) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(outr_s1_reg[30])   , .bi(outi_s1_reg[30]) ,
.real_out(outr_s2[28]), .imag_out(outi_s2[28]));


butterfly_B s2_B_14 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s1_reg[28])   , .ai(outi_s1_reg[28]) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(outr_s1_reg[30])   , .bi(outi_s1_reg[30]) ,
.real_out(outr_s2[30]), .imag_out(outi_s2[30]));


butterfly_A s2_A_15 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s1_reg[29])   , .ai(outi_s1_reg[29]) ,
.wr(wr_8)   , .wi(wi_8) ,
.br(outr_s1_reg[31])   , .bi(outi_s1_reg[31]) ,
.real_out(outr_s2[29]), .imag_out(outi_s2[29]));


butterfly_B s2_B_15 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s1_reg[29])   , .ai(outi_s1_reg[29]) ,
.wr(wr_8)   , .wi(wi_8) ,
.br(outr_s1_reg[31])   , .bi(outi_s1_reg[31]) ,
.real_out(outr_s2[31]), .imag_out(outi_s2[31])); 


/////////////////////////////s3
reg  [15:0] outr_s2_reg [31:0];
reg  [15:0] outi_s2_reg [31:0];
 
   
always @(posedge clk_20 ) begin
if (reset)
begin
for (x=0; x<32; x=x+1)
    begin
    outr_s2_reg[x]=15'd0;
    outi_s2_reg[x]=15'd0;
    end
end
else 
for (x=0; x<32; x=x+1)
begin
    begin
    outr_s2_reg[x]=outr_s2[x];
    outi_s2_reg[x]=outi_s2[x];
    end
end
end   
 

wire  [15:0] outr_s3 [31:0];
wire  [15:0] outi_s3 [31:0];



butterfly_A s3_A_0 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s2_reg[0])   , .ai(outi_s2_reg[0]) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(outr_s2_reg[4])   , .bi(outi_s2_reg[4]) ,
.real_out(outr_s3[0]), .imag_out(outi_s3[0]));


butterfly_B s3_B_0 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s2_reg[0])   , .ai(outi_s2_reg[0]) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(outr_s2_reg[4])   , .bi(outi_s2_reg[4]) ,
.real_out(outr_s3[4]), .imag_out(outi_s3[4]));


butterfly_A s3_A_1 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s2_reg[1])   , .ai(outi_s2_reg[1]) ,
.wr(wr_4)   , .wi(wi_4) ,
.br(outr_s2_reg[5])   , .bi(outi_s2_reg[5]) ,
.real_out(outr_s3[1]), .imag_out(outi_s3[1]));


butterfly_B s3_B_1 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s2_reg[1])   , .ai(outi_s2_reg[1]) ,
.wr(wr_4)   , .wi(wi_4) ,
.br(outr_s2_reg[5])   , .bi(outi_s2_reg[5]) ,
.real_out(outr_s3[5]), .imag_out(outi_s3[5]));


butterfly_A s3_A_2 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s2_reg[2])   , .ai(outi_s2_reg[2]) ,
.wr(wr_8)   , .wi(wi_8) ,
.br(outr_s2_reg[6])   , .bi(outi_s2_reg[6]) ,
.real_out(outr_s3[2]), .imag_out(outi_s3[2]));


butterfly_B s3_B_2 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s2_reg[2])   , .ai(outi_s2_reg[2]) ,
.wr(wr_8)   , .wi(wi_8) ,
.br(outr_s2_reg[6])   , .bi(outi_s2_reg[6]) ,
.real_out(outr_s3[6]), .imag_out(outi_s3[6]));


butterfly_A s3_A_3 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s2_reg[3])   , .ai(outi_s2_reg[3]) ,
.wr(wr_12)   , .wi(wi_12) ,
.br(outr_s2_reg[7])   , .bi(outi_s2_reg[7]) ,
.real_out(outr_s3[3]), .imag_out(outi_s3[3]));


butterfly_B s3_B_3 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s2_reg[3])   , .ai(outi_s2_reg[3]) ,
.wr(wr_12)   , .wi(wi_12) ,
.br(outr_s2_reg[7])   , .bi(outi_s2_reg[7]) ,
.real_out(outr_s3[7]), .imag_out(outi_s3[7]));


butterfly_A s3_A_4 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s2_reg[8])   , .ai(outi_s2_reg[8]) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(outr_s2_reg[12])   , .bi(outi_s2_reg[12]) ,
.real_out(outr_s3[8]), .imag_out(outi_s3[8]));


butterfly_B s3_B_4 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s2_reg[8])   , .ai(outi_s2_reg[8]) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(outr_s2_reg[12])   , .bi(outi_s2_reg[12]) ,
.real_out(outr_s3[12]), .imag_out(outi_s3[12]));


butterfly_A s3_A_5 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s2_reg[9])   , .ai(outi_s2_reg[9]) ,
.wr(wr_4)   , .wi(wi_4) ,
.br(outr_s2_reg[13])   , .bi(outi_s2_reg[13]) ,
.real_out(outr_s3[9]), .imag_out(outi_s3[9]));


butterfly_B s3_B_5 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s2_reg[9])   , .ai(outi_s2_reg[9]) ,
.wr(wr_4)   , .wi(wi_4) ,
.br(outr_s2_reg[13])   , .bi(outi_s2_reg[13]) ,
.real_out(outr_s3[13]), .imag_out(outi_s3[13]));


butterfly_A s3_A_6 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s2_reg[10])   , .ai(outi_s2_reg[10]) ,
.wr(wr_8)   , .wi(wi_8) ,
.br(outr_s2_reg[14])   , .bi(outi_s2_reg[14]) ,
.real_out(outr_s3[10]), .imag_out(outi_s3[10]));


butterfly_B s3_B_6 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s2_reg[10])   , .ai(outi_s2_reg[10]) ,
.wr(wr_8)   , .wi(wi_8) ,
.br(outr_s2_reg[14])   , .bi(outi_s2_reg[14]) ,
.real_out(outr_s3[14]), .imag_out(outi_s3[14]));


butterfly_A s3_A_7 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s2_reg[11])   , .ai(outi_s2_reg[11]) ,
.wr(wr_12)   , .wi(wi_12) ,
.br(outr_s2_reg[15])   , .bi(outi_s2_reg[15]) ,
.real_out(outr_s3[11]), .imag_out(outi_s3[11]));


butterfly_B s3_B_7 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s2_reg[11])   , .ai(outi_s2_reg[11]) ,
.wr(wr_12)   , .wi(wi_12) ,
.br(outr_s2_reg[15])   , .bi(outi_s2_reg[15]) ,
.real_out(outr_s3[15]), .imag_out(outi_s3[15]));


butterfly_A s3_A_8 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s2_reg[16])   , .ai(outi_s2_reg[16]) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(outr_s2_reg[20])   , .bi(outi_s2_reg[20]) ,
.real_out(outr_s3[16]), .imag_out(outi_s3[16]));


butterfly_B s3_B_8 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s2_reg[16])   , .ai(outi_s2_reg[16]) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(outr_s2_reg[20])   , .bi(outi_s2_reg[20]) ,
.real_out(outr_s3[20]), .imag_out(outi_s3[20]));


butterfly_A s3_A_9 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s2_reg[17])   , .ai(outi_s2_reg[17]) ,
.wr(wr_4)   , .wi(wi_4) ,
.br(outr_s2_reg[21])   , .bi(outi_s2_reg[21]) ,
.real_out(outr_s3[17]), .imag_out(outi_s3[17]));


butterfly_B s3_B_9 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s2_reg[17])   , .ai(outi_s2_reg[17]) ,
.wr(wr_4)   , .wi(wi_4) ,
.br(outr_s2_reg[21])   , .bi(outi_s2_reg[21]) ,
.real_out(outr_s3[21]), .imag_out(outi_s3[21]));


butterfly_A s3_A_10 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s2_reg[18])   , .ai(outi_s2_reg[18]) ,
.wr(wr_8)   , .wi(wi_8) ,
.br(outr_s2_reg[22])   , .bi(outi_s2_reg[22]) ,
.real_out(outr_s3[18]), .imag_out(outi_s3[18]));


butterfly_B s3_B_10 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s2_reg[18])   , .ai(outi_s2_reg[18]) ,
.wr(wr_8)   , .wi(wi_8) ,
.br(outr_s2_reg[22])   , .bi(outi_s2_reg[22]) ,
.real_out(outr_s3[22]), .imag_out(outi_s3[22]));


butterfly_A s3_A_11 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s2_reg[19])   , .ai(outi_s2_reg[19]) ,
.wr(wr_12)   , .wi(wi_12) ,
.br(outr_s2_reg[23])   , .bi(outi_s2_reg[23]) ,
.real_out(outr_s3[19]), .imag_out(outi_s3[19]));


butterfly_B s3_B_11 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s2_reg[19])   , .ai(outi_s2_reg[19]) ,
.wr(wr_12)   , .wi(wi_12) ,
.br(outr_s2_reg[23])   , .bi(outi_s2_reg[23]) ,
.real_out(outr_s3[23]), .imag_out(outi_s3[23]));


butterfly_A s3_A_12 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s2_reg[24])   , .ai(outi_s2_reg[24]) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(outr_s2_reg[28])   , .bi(outi_s2_reg[28]) ,
.real_out(outr_s3[24]), .imag_out(outi_s3[24]));


butterfly_B s3_B_12 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s2_reg[24])   , .ai(outi_s2_reg[24]) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(outr_s2_reg[28])   , .bi(outi_s2_reg[28]) ,
.real_out(outr_s3[28]), .imag_out(outi_s3[28]));


butterfly_A s3_A_13 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s2_reg[25])   , .ai(outi_s2_reg[25]) ,
.wr(wr_4)   , .wi(wi_4) ,
.br(outr_s2_reg[29])   , .bi(outi_s2_reg[29]) ,
.real_out(outr_s3[25]), .imag_out(outi_s3[25]));


butterfly_B s3_B_13 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s2_reg[25])   , .ai(outi_s2_reg[25]) ,
.wr(wr_4)   , .wi(wi_4) ,
.br(outr_s2_reg[29])   , .bi(outi_s2_reg[29]) ,
.real_out(outr_s3[29]), .imag_out(outi_s3[29]));


butterfly_A s3_A_14 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s2_reg[26])   , .ai(outi_s2_reg[26]) ,
.wr(wr_8)   , .wi(wi_8) ,
.br(outr_s2_reg[30])   , .bi(outi_s2_reg[30]) ,
.real_out(outr_s3[26]), .imag_out(outi_s3[26]));


butterfly_B s3_B_14 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s2_reg[26])   , .ai(outi_s2_reg[26]) ,
.wr(wr_8)   , .wi(wi_8) ,
.br(outr_s2_reg[30])   , .bi(outi_s2_reg[30]) ,
.real_out(outr_s3[30]), .imag_out(outi_s3[30]));


butterfly_A s3_A_15 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s2_reg[27])   , .ai(outi_s2_reg[27]) ,
.wr(wr_12)   , .wi(wi_12) ,
.br(outr_s2_reg[31])   , .bi(outi_s2_reg[31]) ,
.real_out(outr_s3[27]), .imag_out(outi_s3[27]));


butterfly_B s3_B_15 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s2_reg[27])   , .ai(outi_s2_reg[27]) ,
.wr(wr_12)   , .wi(wi_12) ,
.br(outr_s2_reg[31])   , .bi(outi_s2_reg[31]) ,
.real_out(outr_s3[31]), .imag_out(outi_s3[31]));



/////////////////////////////s4
reg  [15:0] outr_s3_reg [31:0];
reg  [15:0] outi_s3_reg [31:0];
 
   
always @(posedge clk_20 ) begin
if (reset)
begin
for (x=0; x<32; x=x+1)
    begin
    outr_s3_reg[x]=15'd0;
    outi_s3_reg[x]=15'd0;
    end
end
else 
for (x=0; x<32; x=x+1)
begin
    begin
    outr_s3_reg[x]=outr_s3[x];
    outi_s3_reg[x]=outi_s3[x];
    end
end
end   
 





wire  [15:0] outr_s4 [31:0];
wire  [15:0] outi_s4 [31:0];
//part1


butterfly_A part1_s4_A_0 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s3_reg[0])   , .ai(outi_s3_reg[0]) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(outr_s3_reg[8])   , .bi(outi_s3_reg[8]) ,
.real_out(outr_s4[0]), .imag_out(outi_s4[0]));


butterfly_B part1_s4_B_0 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s3_reg[0])   , .ai(outi_s3_reg[0]) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(outr_s3_reg[8])   , .bi(outi_s3_reg[8]) ,
.real_out(outr_s4[8]), .imag_out(outi_s4[8]));


butterfly_A part1_s4_A_1 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s3_reg[16])   , .ai(outi_s3_reg[16]) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(outr_s3_reg[24])   , .bi(outi_s3_reg[24]) ,
.real_out(outr_s4[16]), .imag_out(outi_s4[16]));


butterfly_B part1_s4_B_1 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s3_reg[16])   , .ai(outi_s3_reg[16]) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(outr_s3_reg[24])   , .bi(outi_s3_reg[24]) ,
.real_out(outr_s4[24]), .imag_out(outi_s4[24]));
//part2


butterfly_A part2_s4_A_0 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s3_reg[1])   , .ai(outi_s3_reg[1]) ,
.wr(wr_2)   , .wi(wi_2) ,
.br(outr_s3_reg[9])   , .bi(outi_s3_reg[9]) ,
.real_out(outr_s4[1]), .imag_out(outi_s4[1]));


butterfly_B part2_s4_B_0 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s3_reg[1])   , .ai(outi_s3_reg[1]) ,
.wr(wr_2)   , .wi(wi_2) ,
.br(outr_s3_reg[9])   , .bi(outi_s3_reg[9]) ,
.real_out(outr_s4[9]), .imag_out(outi_s4[9]));


butterfly_A part2_s4_A_1 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s3_reg[17])   , .ai(outi_s3_reg[17]) ,
.wr(wr_2)   , .wi(wi_2) ,
.br(outr_s3_reg[25])   , .bi(outi_s3_reg[25]) ,
.real_out(outr_s4[17]), .imag_out(outi_s4[17]));


butterfly_B part2_s4_B_1 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s3_reg[17])   , .ai(outi_s3_reg[17]) ,
.wr(wr_2)   , .wi(wi_2) ,
.br(outr_s3_reg[25])   , .bi(outi_s3_reg[25]) ,
.real_out(outr_s4[25]), .imag_out(outi_s4[25]));
//part3


butterfly_A part3_s4_A_0 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s3_reg[2])   , .ai(outi_s3_reg[2]) ,
.wr(wr_4)   , .wi(wi_4) ,
.br(outr_s3_reg[10])   , .bi(outi_s3_reg[10]) ,
.real_out(outr_s4[2]), .imag_out(outi_s4[2]));


butterfly_B part3_s4_B_0 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s3_reg[2])   , .ai(outi_s3_reg[2]) ,
.wr(wr_4)   , .wi(wi_4) ,
.br(outr_s3_reg[10])   , .bi(outi_s3_reg[10]) ,
.real_out(outr_s4[10]), .imag_out(outi_s4[10]));


butterfly_A part3_s4_A_1 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s3_reg[18])   , .ai(outi_s3_reg[18]) ,
.wr(wr_4)   , .wi(wi_4) ,
.br(outr_s3_reg[26])   , .bi(outi_s3_reg[26]) ,
.real_out(outr_s4[18]), .imag_out(outi_s4[18]));


butterfly_B part3_s4_B_1 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s3_reg[18])   , .ai(outi_s3_reg[18]) ,
.wr(wr_4)   , .wi(wi_4) ,
.br(outr_s3_reg[26])   , .bi(outi_s3_reg[26]) ,
.real_out(outr_s4[26]), .imag_out(outi_s4[26]));
//part4


butterfly_A part4_s4_A_0 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s3_reg[3])   , .ai(outi_s3_reg[3]) ,
.wr(wr_6)   , .wi(wi_6) ,
.br(outr_s3_reg[11])   , .bi(outi_s3_reg[11]) ,
.real_out(outr_s4[3]), .imag_out(outi_s4[3]));


butterfly_B part4_s4_B_0 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s3_reg[3])   , .ai(outi_s3_reg[3]) ,
.wr(wr_6)   , .wi(wi_6) ,
.br(outr_s3_reg[11])   , .bi(outi_s3_reg[11]) ,
.real_out(outr_s4[11]), .imag_out(outi_s4[11]));


butterfly_A part4_s4_A_1 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s3_reg[19])   , .ai(outi_s3_reg[19]) ,
.wr(wr_6)   , .wi(wi_6) ,
.br(outr_s3_reg[27])   , .bi(outi_s3_reg[27]) ,
.real_out(outr_s4[19]), .imag_out(outi_s4[19]));


butterfly_B part4_s4_B_1 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s3_reg[19])   , .ai(outi_s3_reg[19]) ,
.wr(wr_6)   , .wi(wi_6) ,
.br(outr_s3_reg[27])   , .bi(outi_s3_reg[27]) ,
.real_out(outr_s4[27]), .imag_out(outi_s4[27]));
//part5


butterfly_A part5_s4_A_0 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s3_reg[4])   , .ai(outi_s3_reg[4]) ,
.wr(wr_8)   , .wi(wi_8) ,
.br(outr_s3_reg[12])   , .bi(outi_s3_reg[12]) ,
.real_out(outr_s4[4]), .imag_out(outi_s4[4]));


butterfly_B part5_s4_B_0 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s3_reg[4])   , .ai(outi_s3_reg[4]) ,
.wr(wr_8)   , .wi(wi_8) ,
.br(outr_s3_reg[12])   , .bi(outi_s3_reg[12]) ,
.real_out(outr_s4[12]), .imag_out(outi_s4[12]));


butterfly_A part5_s4_A_1 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s3_reg[20])   , .ai(outi_s3_reg[20]) ,
.wr(wr_8)   , .wi(wi_8) ,
.br(outr_s3_reg[28])   , .bi(outi_s3_reg[28]) ,
.real_out(outr_s4[20]), .imag_out(outi_s4[20]));


butterfly_B part5_s4_B_1 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s3_reg[20])   , .ai(outi_s3_reg[20]) ,
.wr(wr_8)   , .wi(wi_8) ,
.br(outr_s3_reg[28])   , .bi(outi_s3_reg[28]) ,
.real_out(outr_s4[28]), .imag_out(outi_s4[28]));
//part6


butterfly_A part6_s4_A_0 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s3_reg[5])   , .ai(outi_s3_reg[5]) ,
.wr(wr_10)   , .wi(wi_10) ,
.br(outr_s3_reg[13])   , .bi(outi_s3_reg[13]) ,
.real_out(outr_s4[5]), .imag_out(outi_s4[5]));


butterfly_B part6_s4_B_0 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s3_reg[5])   , .ai(outi_s3_reg[5]) ,
.wr(wr_10)   , .wi(wi_10) ,
.br(outr_s3_reg[13])   , .bi(outi_s3_reg[13]) ,
.real_out(outr_s4[13]), .imag_out(outi_s4[13]));


butterfly_A part6_s4_A_1 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s3_reg[21])   , .ai(outi_s3_reg[21]) ,
.wr(wr_10)   , .wi(wi_10) ,
.br(outr_s3_reg[29])   , .bi(outi_s3_reg[29]) ,
.real_out(outr_s4[21]), .imag_out(outi_s4[21]));


butterfly_B part6_s4_B_1 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s3_reg[21])   , .ai(outi_s3_reg[21]) ,
.wr(wr_10)   , .wi(wi_10) ,
.br(outr_s3_reg[29])   , .bi(outi_s3_reg[29]) ,
.real_out(outr_s4[29]), .imag_out(outi_s4[29]));
//part7
butterfly_A part7_s4_A_0 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s3_reg[6])   , .ai(outi_s3_reg[6]) ,
.wr(wr_12)   , .wi(wi_12) ,
.br(outr_s3_reg[14])   , .bi(outi_s3_reg[14]) ,
.real_out(outr_s4[6]), .imag_out(outi_s4[6]));


butterfly_B part7_s4_B_0 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s3_reg[6])   , .ai(outi_s3_reg[6]) ,
.wr(wr_12)   , .wi(wi_12) ,
.br(outr_s3_reg[14])   , .bi(outi_s3_reg[14]) ,
.real_out(outr_s4[14]), .imag_out(outi_s4[14]));
butterfly_A part7_s4_A_1 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s3_reg[22])   , .ai(outi_s3_reg[22]) ,
.wr(wr_12)   , .wi(wi_12) ,
.br(outr_s3_reg[30])   , .bi(outi_s3_reg[30]) ,
.real_out(outr_s4[22]), .imag_out(outi_s4[22]));


butterfly_B part7_s4_B_1 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s3_reg[22])   , .ai(outi_s3_reg[22]) ,
.wr(wr_12)   , .wi(wi_12) ,
.br(outr_s3_reg[30])   , .bi(outi_s3_reg[30]) ,
.real_out(outr_s4[30]), .imag_out(outi_s4[30]));
//part8


butterfly_A part8_s4_A_0 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s3_reg[7])   , .ai(outi_s3_reg[7]) ,
.wr(wr_14)   , .wi(wi_14) ,
.br(outr_s3_reg[15])   , .bi(outi_s3_reg[15]) ,
.real_out(outr_s4[7]), .imag_out(outi_s4[7]));


butterfly_B part8_s4_B_0 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s3_reg[7])   , .ai(outi_s3_reg[7]) ,
.wr(wr_14)   , .wi(wi_14) ,
.br(outr_s3_reg[15])   , .bi(outi_s3_reg[15]) ,
.real_out(outr_s4[15]), .imag_out(outi_s4[15]));


butterfly_A part8_s4_A_1 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s3_reg[23])   , .ai(outi_s3_reg[23]) ,
.wr(wr_14)   , .wi(wi_14) ,
.br(outr_s3_reg[31])   , .bi(outi_s3_reg[31]) ,
.real_out(outr_s4[23]), .imag_out(outi_s4[23]));


butterfly_B part8_s4_B_1 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s3_reg[23])   , .ai(outi_s3_reg[23]) ,
.wr(wr_14)   , .wi(wi_14) ,
.br(outr_s3_reg[31])   , .bi(outi_s3_reg[31]) ,
.real_out(outr_s4[31]), .imag_out(outi_s4[31]));



/////////////////////////////s5
reg  [15:0] outr_s4_reg [31:0];
reg  [15:0] outi_s4_reg [31:0];
     
always @(posedge clk_20 ) begin
if (reset)
begin
for (x=0; x<32; x=x+1)
    begin
    outr_s4_reg[x]=15'd0;
    outi_s4_reg[x]=15'd0;
    end
end
else 
for (x=0; x<32; x=x+1)
begin
    begin
    outr_s4_reg[x]=outr_s4[x];
    outi_s4_reg[x]=outi_s4[x];
    end
end
end   
 

wire  [15:0] outr_s5 [31:0];
wire  [15:0] outi_s5 [31:0];



butterfly_A s5_A_0 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s4_reg[0])   , .ai(outi_s4_reg[0]) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(outr_s4_reg[16])   , .bi(outi_s4_reg[16]) ,
.real_out(outr_s5[0]), .imag_out(outi_s5[0]));


butterfly_B s5_B_0 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s4_reg[0])   , .ai(outi_s4_reg[0]) ,
.wr(wr_0)   , .wi(wi_0) ,
.br(outr_s4_reg[16])   , .bi(outi_s4_reg[16]) ,
.real_out(outr_s5[16]), .imag_out(outi_s5[16]));


butterfly_A s5_A_1 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s4_reg[1])   , .ai(outi_s4_reg[1]) ,
.wr(wr_1)   , .wi(wi_1) ,
.br(outr_s4_reg[17])   , .bi(outi_s4_reg[17]) ,
.real_out(outr_s5[1]), .imag_out(outi_s5[1]));


butterfly_B s5_B_1 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s4_reg[1])   , .ai(outi_s4_reg[1]) ,
.wr(wr_1)   , .wi(wi_1) ,
.br(outr_s4_reg[17])   , .bi(outi_s4_reg[17]) ,
.real_out(outr_s5[17]), .imag_out(outi_s5[17]));


butterfly_A s5_A_2 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s4_reg[2])   , .ai(outi_s4_reg[2]) ,
.wr(wr_2)   , .wi(wi_2) ,
.br(outr_s4_reg[18])   , .bi(outi_s4_reg[18]) ,
.real_out(outr_s5[2]), .imag_out(outi_s5[2]));


butterfly_B s5_B_2 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s4_reg[2])   , .ai(outi_s4_reg[2]) ,
.wr(wr_2)   , .wi(wi_2) ,
.br(outr_s4_reg[18])   , .bi(outi_s4_reg[18]) ,
.real_out(outr_s5[18]), .imag_out(outi_s5[18]));


butterfly_A s5_A_3 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s4_reg[3])   , .ai(outi_s4_reg[3]) ,
.wr(wr_3)   , .wi(wi_3) ,
.br(outr_s4_reg[19])   , .bi(outi_s4_reg[19]) ,
.real_out(outr_s5[3]), .imag_out(outi_s5[3]));


butterfly_B s5_B_3 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s4_reg[3])   , .ai(outi_s4_reg[3]) ,
.wr(wr_3)   , .wi(wi_3) ,
.br(outr_s4_reg[19])   , .bi(outi_s4_reg[19]) ,
.real_out(outr_s5[19]), .imag_out(outi_s5[19]));


butterfly_A s5_A_4 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s4_reg[4])   , .ai(outi_s4_reg[4]) ,
.wr(wr_4)   , .wi(wi_4) ,
.br(outr_s4_reg[20])   , .bi(outi_s4_reg[20]) ,
.real_out(outr_s5[4]), .imag_out(outi_s5[4]));


butterfly_B s5_B_4 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s4_reg[4])   , .ai(outi_s4_reg[4]) ,
.wr(wr_4)   , .wi(wi_4) ,
.br(outr_s4_reg[20])   , .bi(outi_s4_reg[20]) ,
.real_out(outr_s5[20]), .imag_out(outi_s5[20]));


butterfly_A s5_A_5 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s4_reg[5])   , .ai(outi_s4_reg[5]) ,
.wr(wr_5)   , .wi(wi_5) ,
.br(outr_s4_reg[21])   , .bi(outi_s4_reg[21]) ,
.real_out(outr_s5[5]), .imag_out(outi_s5[5]));


butterfly_B s5_B_5 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s4_reg[5])   , .ai(outi_s4_reg[5]) ,
.wr(wr_5)   , .wi(wi_5) ,
.br(outr_s4_reg[21])   , .bi(outi_s4_reg[21]) ,
.real_out(outr_s5[21]), .imag_out(outi_s5[21]));


butterfly_A s5_A_6 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s4_reg[6])   , .ai(outi_s4_reg[6]) ,
.wr(wr_6)   , .wi(wi_6) ,
.br(outr_s4_reg[22])   , .bi(outi_s4_reg[22]) ,
.real_out(outr_s5[6]), .imag_out(outi_s5[6]));


butterfly_B s5_B_6 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s4_reg[6])   , .ai(outi_s4_reg[6]) ,
.wr(wr_6)   , .wi(wi_6) ,
.br(outr_s4_reg[22])   , .bi(outi_s4_reg[22]) ,
.real_out(outr_s5[22]), .imag_out(outi_s5[22]));


butterfly_A s5_A_7 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s4_reg[7])   , .ai(outi_s4_reg[7]) ,
.wr(wr_7)   , .wi(wi_7) ,
.br(outr_s4_reg[23])   , .bi(outi_s4_reg[23]) ,
.real_out(outr_s5[7]), .imag_out(outi_s5[7]));


butterfly_B s5_B_7 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s4_reg[7])   , .ai(outi_s4_reg[7]) ,
.wr(wr_7)   , .wi(wi_7) ,
.br(outr_s4_reg[23])   , .bi(outi_s4_reg[23]) ,
.real_out(outr_s5[23]), .imag_out(outi_s5[23]));


butterfly_A s5_A_8 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s4_reg[8])   , .ai(outi_s4_reg[8]) ,
.wr(wr_8)   , .wi(wi_8) ,
.br(outr_s4_reg[24])   , .bi(outi_s4_reg[24]) ,
.real_out(outr_s5[8]), .imag_out(outi_s5[8]));


butterfly_B s5_B_8 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s4_reg[8])   , .ai(outi_s4_reg[8]) ,
.wr(wr_8)   , .wi(wi_8) ,
.br(outr_s4_reg[24])   , .bi(outi_s4_reg[24]) ,
.real_out(outr_s5[24]), .imag_out(outi_s5[24]));


butterfly_A s5_A_9 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s4_reg[9])   , .ai(outi_s4_reg[9]) ,
.wr(wr_9)   , .wi(wi_9) ,
.br(outr_s4_reg[25])   , .bi(outi_s4_reg[25]) ,
.real_out(outr_s5[9]), .imag_out(outi_s5[9]));


butterfly_B s5_B_9 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s4_reg[9])   , .ai(outi_s4_reg[9]) ,
.wr(wr_9)   , .wi(wi_9) ,
.br(outr_s4_reg[25])   , .bi(outi_s4_reg[25]) ,
.real_out(outr_s5[25]), .imag_out(outi_s5[25]));


butterfly_A s5_A_10 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s4_reg[10])   , .ai(outi_s4_reg[10]) ,
.wr(wr_10)   , .wi(wi_10) ,
.br(outr_s4_reg[26])   , .bi(outi_s4_reg[26]) ,
.real_out(outr_s5[10]), .imag_out(outi_s5[10]));


butterfly_B s5_B_10 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s4_reg[10])   , .ai(outi_s4_reg[10]) ,
.wr(wr_10)   , .wi(wi_10) ,
.br(outr_s4_reg[26])   , .bi(outi_s4_reg[26]) ,
.real_out(outr_s5[26]), .imag_out(outi_s5[26]));


butterfly_A s5_A_11 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s4_reg[11])   , .ai(outi_s4_reg[11]) ,
.wr(wr_11)   , .wi(wi_11) ,
.br(outr_s4_reg[27])   , .bi(outi_s4_reg[27]) ,
.real_out(outr_s5[11]), .imag_out(outi_s5[11]));


butterfly_B s5_B_11 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s4_reg[11])   , .ai(outi_s4_reg[11]) ,
.wr(wr_11)   , .wi(wi_11) ,
.br(outr_s4_reg[27])   , .bi(outi_s4_reg[27]) ,
.real_out(outr_s5[27]), .imag_out(outi_s5[27]));


butterfly_A s5_A_12 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s4_reg[12])   , .ai(outi_s4_reg[12]) ,
.wr(wr_12)   , .wi(wi_12) ,
.br(outr_s4_reg[28])   , .bi(outi_s4_reg[28]) ,
.real_out(outr_s5[12]), .imag_out(outi_s5[12]));


butterfly_B s5_B_12 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s4_reg[12])   , .ai(outi_s4_reg[12]) ,
.wr(wr_12)   , .wi(wi_12) ,
.br(outr_s4_reg[28])   , .bi(outi_s4_reg[28]) ,
.real_out(outr_s5[28]), .imag_out(outi_s5[28]));


butterfly_A s5_A_13 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s4_reg[13])   , .ai(outi_s4_reg[13]) ,
.wr(wr_13)   , .wi(wi_13) ,
.br(outr_s4_reg[29])   , .bi(outi_s4_reg[29]) ,
.real_out(outr_s5[13]), .imag_out(outi_s5[13]));


butterfly_B s5_B_13 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s4_reg[13])   , .ai(outi_s4_reg[13]) ,
.wr(wr_13)   , .wi(wi_13) ,
.br(outr_s4_reg[29])   , .bi(outi_s4_reg[29]) ,
.real_out(outr_s5[29]), .imag_out(outi_s5[29]));


butterfly_A s5_A_14 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s4_reg[14])   , .ai(outi_s4_reg[14]) ,
.wr(wr_14)   , .wi(wi_14) ,
.br(outr_s4_reg[30])   , .bi(outi_s4_reg[30]) ,
.real_out(outr_s5[14]), .imag_out(outi_s5[14]));


butterfly_B s5_B_14 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s4_reg[14])   , .ai(outi_s4_reg[14]) ,
.wr(wr_14)   , .wi(wi_14) ,
.br(outr_s4_reg[30])   , .bi(outi_s4_reg[30]) ,
.real_out(outr_s5[30]), .imag_out(outi_s5[30]));


butterfly_A s5_A_15 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s4_reg[15])   , .ai(outi_s4_reg[15]) ,
.wr(wr_15)   , .wi(wi_15) ,
.br(outr_s4_reg[31])   , .bi(outi_s4_reg[31]) ,
.real_out(outr_s5[15]), .imag_out(outi_s5[15]));


butterfly_B s5_B_15 (.clk(clk_100),
.reset(reset),  .load(load), .s(s),.en_real(en_real), .en_imag(en_imag),
.ar(outr_s4_reg[15])   , .ai(outi_s4_reg[15]) ,
.wr(wr_15)   , .wi(wi_15) ,
.br(outr_s4_reg[31])   , .bi(outi_s4_reg[31]) ,
.real_out(outr_s5[31]), .imag_out(outi_s5[31]));


   
always @(posedge clk_20 ) begin
if (reset)
begin
outr_0=16'd0;
outi_0=16'd0;
outr_1=16'd0;
outi_1=16'd0;
outr_2=16'd0;
outi_2=16'd0;
outr_3=16'd0;
outi_3=16'd0;
outr_4=16'd0;
outi_4=16'd0;
outr_5=16'd0;
outi_5=16'd0;
outr_6=16'd0;
outi_6=16'd0;
outr_7=16'd0;
outi_7=16'd0;
outr_8=16'd0;
outi_8=16'd0;
outr_9=16'd0;
outi_9=16'd0;
outr_10=16'd0;
outi_10=16'd0;
outr_11=16'd0;
outi_11=16'd0;
outr_12=16'd0;
outi_12=16'd0;
outr_13=16'd0;
outi_13=16'd0;
outr_14=16'd0;
outi_14=16'd0;
outr_15=16'd0;
outi_15=16'd0;
outr_16=16'd0;
outi_16=16'd0;
outr_17=16'd0;
outi_17=16'd0;
outr_18=16'd0;
outi_18=16'd0;
outr_19=16'd0;
outi_19=16'd0;
outr_20=16'd0;
outi_20=16'd0;
outr_21=16'd0;
outi_21=16'd0;
outr_22=16'd0;
outi_22=16'd0;
outr_23=16'd0;
outi_23=16'd0;
outr_24=16'd0;
outi_24=16'd0;
outr_25=16'd0;
outi_25=16'd0;
outr_26=16'd0;
outi_26=16'd0;
outr_27=16'd0;
outi_27=16'd0;
outr_28=16'd0;
outi_28=16'd0;
outr_29=16'd0;
outi_29=16'd0;
outr_30=16'd0;
outi_30=16'd0;
outr_31=16'd0;
outi_31=16'd0;
end
else begin
outr_0=outr_s5[0];
outi_0=outi_s5[0];
outr_1=outr_s5[1];
outi_1=outi_s5[1];
outr_2=outr_s5[2];
outi_2=outi_s5[2];
outr_3=outr_s5[3];
outi_3=outi_s5[3];
outr_4=outr_s5[4];
outi_4=outi_s5[4];
outr_5=outr_s5[5];
outi_5=outi_s5[5];
outr_6=outr_s5[6];
outi_6=outi_s5[6];
outr_7=outr_s5[7];
outi_7=outi_s5[7];
outr_8=outr_s5[8];
outi_8=outi_s5[8];
outr_9=outr_s5[9];
outi_9=outi_s5[9];
outr_10=outr_s5[10];
outi_10=outi_s5[10];
outr_11=outr_s5[11];
outi_11=outi_s5[11];
outr_12=outr_s5[12];
outi_12=outi_s5[12];
outr_13=outr_s5[13];
outi_13=outi_s5[13];
outr_14=outr_s5[14];
outi_14=outi_s5[14];
outr_15=outr_s5[15];
outi_15=outi_s5[15];
outr_16=outr_s5[16];
outi_16=outi_s5[16];
outr_17=outr_s5[17];
outi_17=outi_s5[17];
outr_18=outr_s5[18];
outi_18=outi_s5[18];
outr_19=outr_s5[19];
outi_19=outi_s5[19];
outr_20=outr_s5[20];
outi_20=outi_s5[20];
outr_21=outr_s5[21];
outi_21=outi_s5[21];
outr_22=outr_s5[22];
outi_22=outi_s5[22];
outr_23=outr_s5[23];
outi_23=outi_s5[23];
outr_24=outr_s5[24];
outi_24=outi_s5[24];
outr_25=outr_s5[25];
outi_25=outi_s5[25];
outr_26=outr_s5[26];
outi_26=outi_s5[26];
outr_27=outr_s5[27];
outi_27=outi_s5[27];
outr_28=outr_s5[28];
outi_28=outi_s5[28];
outr_29=outr_s5[29];
outi_29=outi_s5[29];
outr_30=outr_s5[30];
outi_30=outi_s5[30];
outr_31=outr_s5[31];
outi_31=outi_s5[31];
end
end 
  
endmodule
