/*
 * ECE385-HelperTools/PNG-To-Txt
 * Author: Rishi Thakkar
 *
 */

module  cloud_frameRAM
(
		// input [2:0] data_In,
		// // input [18:0] write_address, read_address,
		// input [8:0] write_address, read_address,
		// input we, Clk,
		input [13:0] read_address,
		output logic [2:0] data_Out
		// input [15:0] read_address,
		// output logic [23:0] data_Out
);

// mem has width of 3 bits and a total of 400 addresses
// logic [23:0] mem [0:32767];
logic [2:0] mem [0:9999];
// parameter ADDR_WIDTH = 12;
// parameter DATA_WIDTH = 3;
// logic [ADDR_WIDTH-1:0] addr_reg;
initial 
begin
	$readmemh("sprite_bytes/cloud.txt",mem);
	// $readmemh("sounds_converted/formatted_sound.txt",mem);
end

assign data_Out = mem[read_address];

endmodule