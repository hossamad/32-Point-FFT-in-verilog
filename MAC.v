module mac (
input clk,
input reset,load,
input wire signed [15:0] x1,
input wire signed [15:0] x2,
output reg signed [15:0] mac_out
);

wire signed [31:0] multiplier_out_noiseless = x1*x2;
wire signed [15:0] multiplier_out_noisy = {multiplier_out_noiseless[31],multiplier_out_noiseless[22:8]};
// to keep the old result of the adder
reg signed [15:0] old_result;

// update the MAC output with the addition result of the old_Result and the multiplication
always @(posedge clk or posedge reset ) begin
if (reset)
mac_out=0;
else
mac_out = multiplier_out_noisy + old_result;
end
// update the old result of the adder (description of the feedback in the MAC)
always @ (mac_out,load) begin
if (load)
old_result=0;
else
old_result = mac_out;
end

endmodule