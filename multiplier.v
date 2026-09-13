module multiplier (product, inp1, inp2);
output [7:0] product;
input [3:0] inp1;
input [3:0] inp2;
assign product[0] = (inp1[0] & inp2[0]);
wire x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16, x17;
HA HA1(product[1], x1, (inp1[1] & inp2[0]), (inp1[0] & inp2[1]));
FA FA1(x2, x3, inp1[1] & inp2[1], (inp1[0] & inp2[2]), x1);
FA FA2(x4, x5, (inp1[1] & inp2[2]), (inp1[0] & inp2[3]), x3);
HA HA2(x6, x7, (inp1[1] & inp2[3]), x5);
HA HA3(product[2], x15, x2, (inp1[2] & inp2[0]));
FA FA5(x14, x16, x4, (inp1[2] & inp2[1]), x15);
FA FA4(x13, x17, x6, (inp1[2] & inp2[2]), x16);
FA FA3(x9, x8, x7, (inp1[2] & inp2[3]), x17);
HA HA4(product[3], x12, x14, (inp1[3] & inp2[0]));
FA FA8(product[4], x11, x13, (inp1[3] & inp2[1]), x12);
FA FA7(product[5], x10, x9, (inp1[3] & inp2[2]), x11);
FA FA6(product[6], product[7], x8, (inp1[3] & inp2[3]), x10);
endmodule

module HA(sout, cout, a, b);
output sout, cout;
input a, b;
assign sout = a ^ b;
assign cout = (a & b);
endmodule

module FA(sout, cout, a, b, cin);
output sout, cout;
input a, b, cin;
assign sout = (a ^ b ^ cin);
assign cout = ((a & b) | (a & cin) | (b & cin));
endmodule

module bcd_seg (
input wire clk, // clock for multiplexing
input wire [3:0] hundreds, // from bin-to-BCD
input wire [3:0] tens,
input wire [3:0] ones,
output reg [2:0] digit, // Digit enable (ACTIVE HIGH)
output reg [7:0] Seven_Segment // {A,B,C,D,E,F,G,DP} ACTIVE LOW
);
// --------------------------------------------------
// Clock divider (~1 kHz digit refresh)
// --------------------------------------------------
reg [24:0] div = 0; // Expanded width to support 25,000,000 count
reg [1:0] scan = 0;
always @(posedge clk) begin
div <= div + 1;
if (div == 25'd25000000) begin // adjust for your clock
div <= 0;
scan <= scan + 1;
end
end
// --------------------------------------------------

// Select digit and BCD value
// --------------------------------------------------
reg [3:0] BCDin;
always @(*) begin
case (scan)
2'd0: begin digit = 3'b001; BCDin = ones; end
2'd1: begin digit = 3'b010; BCDin = tens; end
2'd2: begin digit = 3'b100; BCDin = hundreds; end
default: begin digit = 3'b000; BCDin = 4'd0; end
endcase
end
// --------------------------------------------------
// BCD → 7-segment decoder
// --------------------------------------------------
always @(*) begin
case (BCDin)
4'd0: Seven_Segment = 8'b00000011;
4'd1: Seven_Segment = 8'b10011111;
4'd2: Seven_Segment = 8'b00100101;
4'd3: Seven_Segment = 8'b00001101;
4'd4: Seven_Segment = 8'b10011001;
4'd5: Seven_Segment = 8'b01001001;
4'd6: Seven_Segment = 8'b01000001;
4'd7: Seven_Segment = 8'b00011111;
4'd8: Seven_Segment = 8'b00000001;
4'd9: Seven_Segment = 8'b00001001;
default: Seven_Segment = 8'b11111111;
endcase
end
endmodule

module bin2bcd(
input [7:0] bin_in,
output reg [3:0] ones,
output reg [3:0] tens,
output reg [3:0] hundreds
);
always @* begin
ones = bin_in % 10;
tens = (bin_in / 10) % 10;
hundreds = bin_in / 100;
end
endmodule
