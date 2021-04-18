module cpu(clk,rst ,en_in,en_ram_out,addr,ins,en_ram_in 	);

input         clk,rst ,en_in,en_ram_out;
input  [15:0] ins;
output [15:0] addr;
output        en_ram_in;

wire         en_pc_pulse,en_group_pulse,alu_in_sel,en_alu;
wire  [1:0]  pc_ctrl;
wire  [3:0]  reg_en;
wire  [2:0]  alu_func;
wire  [7:0]  offset_addr;

data_path data_path1 (
					.clk(clk),
					.rst(rst),
					.offset(ins[7:0]),
					.offset_addr(offset_addr),
					.en_pc_pulse(en_pc_pulse),
					.pc_ctrl(pc_ctrl),
					.en_in(en_group_pulse) ,
					.reg_en(reg_en) ,
				    .rd(ins[11:10]),
					.rs(ins[9:8]),
				    .alu_in_sel(alu_in_sel),
				    .alu_func(alu_func),
				    .en_out(en_alu),
				    .pc_out(addr)
				);	                     

control_unit control_unit1(
					.clk(clk ) ,
					.rst(rst) ,
					.en(en_in)  ,
					.en_alu(en_alu ) ,  
					.en_ram_out(en_ram_out) ,
					.ins(ins),
					.offset_addr(offset_addr),
					.en_ram_in(en_ram_in ),
				    .en_group_pulse(en_group_pulse ),
					.en_pc_pulse(en_pc_pulse),
				    .reg_en(reg_en),
				    .alu_in_sel(alu_in_sel),
					.alu_func (alu_func),
					.pc_ctrl(pc_ctrl)			
				);	
endmodule				
