module full_adder(
    input a,
    input b,
    input cin,
    output sum,
    output cout
    );
    
    assign sum = a^b^cin;
    assign cout = (cin&(a^b))+(a&b);
    
endmodule

module half_adder(
    input a,
    input b,
    output sum,
    output carry
    );
    
    assign sum = a^b;
    assign carry = a&b;
  
endmodule 

module parallel_adder_4bit(
    input b3,b2,b1,a1,a2,a0,
    output z0,z1,z2,z3
    );
    
    wire c1,c2,c3;
    
    assign z0 = a0;
    half_adder ha1(a1,b1,z1,c1);
    full_adder fa1(a2,b2,c1,z2,c2);
    half_adder ha2(b3,c2,z3,c3);
    
endmodule 

module compressor_5x3(
    input i0,
    input i1,
    input i2,
    input i3,
    input i4,
    output out_0,
    output out_1,
    output out_2
    );
    
    wire s1; // partial sum wire
    wire c1,c2; // carry wires
    
    full_adder fa1(i2,i1,i0,s1,c1);
    full_adder fa2(i4,i3,s1,out_0,c2);
    
    half_adder ha1(c2,c1,out_1,out_2);
        
endmodule

module compressor_15x4(
    input i0,
    input i1,
    input i2,
    input i3,
    input i4,
    input i5,
    input i6,
    input i7,
    input i8,
    input i9,
    input i10,
    input i11,
    input i12,
    input i13,
    input i14,
    output out_0,
    output out_1,
    output out_2,
    output out_3
    );
    
    wire c1,c2,c3,c4,c5;
    wire s1,s2,s3,s4,s5;
    
    full_adder fa1(i2,i1,i0,s1,c1);
    full_adder fa2(i5,i4,i3,s2,c2);
    full_adder fa3(i8,i7,i6,s3,c3);
    full_adder fa4(i11,i10,i9,s4,c4);
    full_adder fa5(i14,i13,i12,s5,c5);
    
    wire b0,b1,b2,b3;
    wire a0,a1,a2,a3;
    
    compressor_5x3 approx_comp_carry(c5,c4,c3,c2,c1,b1,b2,b3);
    compressor_5x3 approx_comp_sum(s5,s4,s3,s2,s1,a0,a1,a2);
    
    parallel_adder_4bit pa(b3,b2,b1,a1,a2,a0,out_0,out_1,out_2,out_3);
        
endmodule