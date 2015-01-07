
module dpi_test();
   import "DPI-C" function void c_func_hello(int in_dat);

   int i;

   initial
     i = 32'd100;

   initial begin
      #1;
      c_func_hello(i);
   end

endmodule
