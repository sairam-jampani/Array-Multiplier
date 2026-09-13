module multiplier_tb;
reg [3:0]inp1;
reg [3:0]inp2;
wire [7:0]product;
multiplier uut(.inp1(inp1),.inp2(inp2),.product(product));
initial
begin
inp1=3;
inp2=5;
#30 ;
inp1=13;
inp2=10;
#30 ;
inp1=10;
inp2=22;
#30 ;
inp1=10;
inp2=22;
#30 ;
inp1=8;
inp2=9;
#30 ;
$finish;
end
endmodule
