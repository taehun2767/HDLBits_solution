module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); //
	
	assign c_enable = enable;
    assign c_load = reset| (Q == 12 & enable);
    assign c_d = c_load ? 1 : 0;
    
    always @(posedge clk) begin
        if( reset | (Q == 12 & enable)) begin
            Q <=4'b0001;
        end
        else if(enable) begin 
            Q <= Q + 1;
        end
        else begin 
            Q <= Q;
        end
    end
    
    count4 the_counter (clk, c_enable, c_load, c_d /*, ... */ );
endmodule
