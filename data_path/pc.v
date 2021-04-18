`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/05 17:12:07
// Design Name: 
// Module Name: pc
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


module pc(
         clk,
         rst		,       
		 en_in		,
		 pc_ctrl  	,
		 offset_addr, 		 			 
		 pc_out  		
    );
    input clk,rst,en_in;
    input wire[1:0] pc_ctrl;
    input wire[7:0] offset_addr;
    output reg[15:0] pc_out;
    always@(posedge clk or negedge rst)
        if(rst==0)
            begin
                pc_out<=0000000000000000;
            end
         else
            begin
                 if(en_in==1)
                    begin
                         case (pc_ctrl)
                         2'b01:
                            pc_out <= pc_out + 1;
                         2'b10:
                            pc_out <= {8'b00000000,offset_addr[7:0]};
                         default:                            
                                  pc_out <= pc_out;
                       endcase
                       end
            end   
    
endmodule
