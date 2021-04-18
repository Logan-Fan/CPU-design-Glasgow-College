`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/09 20:35:47
// Design Name: 
// Module Name: tb_cpu
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


module tb_cpu();
reg         clk,rst,en_in,en_ram_out;
reg  [15:0] ins;
wire        en_ram_in;
wire [15:0] addr;

cpu test_cpu(
    .clk (clk),
    .rst (rst),
    .en_in (en_in),
    .en_ram_in (en_ram_in), 
    .ins (ins),	
    .en_ram_out (en_ram_out),
    .addr (addr)   	
);

parameter Tclk = 10;

initial begin
	    //define clk
	    clk=0;
	    forever #5 clk=~clk;
		end
        
initial begin
		//define rst 
		rst=0;
		#20;
		rst=1;
		end

initial begin                
		//define en_in and en_ram_out
		en_in=0;
		en_ram_out=0;
		#10
		en_in=1;
        en_ram_out=1;		
end

initial begin
         //define ins ,you can assign 0000_0000_0000_0001
		 //0000_0100_0000_0010 and so on to ins.
		 
		 ins = 16'b0000000000000001;
		 #400;
		 ins = 16'b0000010000000010;
		 #400;
         ins = 16'b0010100000000011;
		 #400;
         ins = 16'b0010110000000100;
		 #400;
         ins = 16'b0101000100000000;
 		 #400;
         ins = 16'b0111111000000000;        
  		 #400;
         ins = 16'b1001011000000000;       
         #400;
         ins= 16'b01001111000000000; 
        end
       
initial begin
    #(Tclk*1600)  $stop;
end

endmodule
