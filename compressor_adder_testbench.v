`include "compressor_adder"

module compressor_15x4_testbench();

    reg i0,i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14;
    wire out_0, out_1, out_2, out_3;
    
    compressor_15x4 test_compressor_greater(i0,i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,out_0,out_1,out_2,out_3);
    
    initial begin
    i0 = 1;
    i1 = 1;
    i2 = 1;
    i3 = 1;
    i4 = 1;
    i5 = 1;
    i6 = 1;
    i7 = 1;
    i8 = 1;
    i9 = 1;
    i10 = 1;
    i11 = 1;
    i12 = 1;
    i13 = 1;
    i14 = 1;
    
    #1 $display("output0 = %b, output1 = %b output2 = %b output3 = %b", out_0, out_1, out_2, out_3);
    end
 
endmodule