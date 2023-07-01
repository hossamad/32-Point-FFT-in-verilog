module counter (
input clk, reset,
output reg [2:0] counter_out
);

reg max ;
always @ (counter_out)
begin
if (counter_out == 3'd4)
max=1'b1;
else 
max=0;
end

always @ (posedge clk or posedge reset) begin
if (reset==1'b1)
counter_out=0;
else if (max==1'b1)
counter_out=0;
else 
counter_out=counter_out+1;
end

endmodule 