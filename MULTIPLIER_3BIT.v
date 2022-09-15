// HALF ADDER 

module HA(s,c,a,b);
input a,b;
output s,c;

assign s = a^b;
assign c = a&b;

endmodule

// FULL ADDER

module FA(s,cout,a,b,cin);
input a,b, cin;
output s,cout;

assign s = a^b^cin;
assign cout = ((a&b) | (cin&(a^b)));

endmodule

// 3 BIT MULTIPLIER USING SINGLE BIT ADDERS

module MULTIPLIER_3BIT
(
    input [2:0] a,b,
	 output  [5:0] p,
	 inout wire  [9:0] w

);

and  n1  (p[0],a[0],b[0]);

and  n2  (w0,a[1],b[0]);
and  n3  (w1,a[0],b[1]);
HA   n4  (p[1],c1,w0,w1);

and  n5  (w2,a[2],b[0]);
and  n6  (w3,a[1],b[1]);
HA   n7  (w4,c2,w2,w3);
and  n8  (w5,a[0],b[2]);
FA   n9 (p[2],c3,w4,w5,c1);

and  n10 (w6,a[2],b[1]);
and  n11 (w7,a[1],b[2]);
FA   n12 (w8,c4,w6,w7,c2);
HA   n13 (p[3],c5,w8,c3);

and  n14 (w9,a[2],b[2]);
FA   n15 (p[4],p[5],c4,c5,w9);

endmodule
