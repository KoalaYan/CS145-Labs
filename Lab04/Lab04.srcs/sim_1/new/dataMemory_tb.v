`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/24 09:08:53
// Design Name: 
// Module Name: dataMemory_tb
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


module dataMemory_tb(

    );
    reg Clk;
    reg [31:0] address;
    reg [31:0] writeData;
    reg memWrite;
    reg memRead;
    wire [31:0] readData;
    
    dataMemory u0(
        .Clk(Clk),
        .address(address),
        .writeData(writeData),
        .memWrite(memWrite),
        .memRead(memRead),
        .readData(readData)
    );
    always #100 Clk = ~Clk;
    
    initial begin
        Clk = 0;
        address = 32'b00000000000000000000000000000000;
        writeData = 32'b00000000000000000000000000000000;
        memWrite = 1'b0;
        memRead = 1'b0;              
        //initial
        
        #185;
        memWrite = 1'b1;
        address = 32'b00000000000000000000000000000111;
        writeData = 32'b11100000000000000000000000000000;
        
        #100;
        memWrite = 1'b1;
        writeData = 32'hffffffff;
        address = 32'b00000000000000000000000000000110;
        
        #185;
        memRead = 1'b1;
        memWrite = 1'b0;
        address = 32'b00000000000000000000000000000111;
        
        #80;
        memWrite = 1;
        address = 8;
        writeData = 32'haaaaaaaa;
        
        #80;
        memWrite = 0;
        memRead = 1;
        address = 32'b00000000000000000000000000000110;
    end
endmodule
