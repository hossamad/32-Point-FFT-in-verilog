module controller (
input clk,reset,
input [2:0] counter_out,
output reg [1:0] s,
output reg   load, en_real, en_imag
);

/*
clk                 |--|__|--|__|--|__|--|__|--|__|--|__|--|__|--|__|--|__|--|__|--|__|  
reset_controller    |-----|_________________________________________________
counter_out         |0    |1    |2    |3    |4    | 0   |1    |2    |3    |4    |0    |
state transition    | start                       |s1   | s2  |s3   |s4   |s5   |s1   |  
*/


//mealy FSM 
localparam [2:0]
state_start=3'd0,
state_1 = 3'd1,
state_2=3'd2,
state_3=3'd3,
state_4=3'd4,
state_5=3'd5;


reg [2:0] current_state, next_state;

always @(posedge clk or posedge reset) begin
if (reset)
current_state=state_start;
else
current_state=next_state;
end 

//state transition
always@(current_state, counter_out) begin
case(current_state)
state_start: begin
if (counter_out==3'd0) 
		next_state=state_1;
else 
        next_state=state_start;
end

state_1:begin
if (counter_out==3'd3) 
		next_state=state_2;
else 
        next_state=state_1;
end

state_2:begin
if (counter_out==3'd4) 
next_state=state_3;
else 
        next_state=state_2;

end

state_3:begin
if (counter_out==3'd0) 
next_state=state_4;
else 
        next_state=state_3;
end

state_4:begin
if (counter_out==3'd1) 
next_state=state_5;
else 
        next_state=state_4;

end

state_5:begin
if (counter_out==3'd2) 
next_state=state_1;
else 
next_state=state_5;

end
//state_start and else
default: begin
if (counter_out==3'd0) 
		next_state=state_1;
else 
        next_state=state_start;
 

end

endcase


end

// outputs

always@(current_state, counter_out) begin
case(current_state)

state_1:begin
        s=2'd3 ;
        load=1'b1  ;
        en_real=1'b0  ;
        en_imag=1'b0  ;
end

state_2:begin
        s=2'd0 ;
        load=1'b0  ;
        en_real=1'b0  ;
        en_imag=1'b0  ;
end

state_3:begin     
        s=2'd1 ;
        load=1'b0  ;
        en_real=1'b0  ;
        en_imag=1'b0  ;

end


state_4:begin
        s=2'd2 ;
        load=1'b0  ;
        en_real=1'b0  ;
        en_imag=1'b0  ;
end

state_5:begin
        s=2'd3 ;
        load=1'b0  ;
        en_real=1'b1  ;
        en_imag=1'b1  ;
    
end
//state_start and else
default: begin
        s=2'd3 ;
        load=1'b1  ;
        en_real=1'b1  ;
        en_imag=1'b1  ;
end



endcase
end



endmodule