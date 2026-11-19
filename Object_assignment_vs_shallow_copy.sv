// Code your testbench here
// or browse Exam
module test;
  class c2;
    int b;

    function c2 copy();
    copy = new();
    copy.b = this.b();
    endfunction
    
    function void display(string s);
      $display("%s : the value of b is %0d",s,b);

    endfunction
 
  endclass
  
  class c1;
    c2 c12_h1; //Class 2 handle inside class1
    function new();
      c12_h1 = new();
      
    endfunction
    
    int a;
    
    function void display(string s);
      
      $display("%s : The value of a is %d",s,a);

      endfunction
    
  endclass
  
  initial begin
    c1  c1_h1,c1_h2;
    c1_h1 = new();
//     c1_h2 = new();
    c1_h1.a = 10;
    c1_h1.display("1st Handle");
///Disadvantage of shallow copy
 /// Subclass handle mai same chej copy ho ja rahi hai
     c1_h2= new c1_h1;//Shallow Copy
    //c1_h2= c1_h1;//Object assignment
    c1_h2.a = 20;
    
//     c1_h1.display("1st Handle");
//     c1_h2.display("2nd Handle");
    
    c1_h1.c12_h1.b = 10;
    c1_h2.c12_h1.b = 20;
    c1_h1.display("1st Handle");
    c1_h1.c12_h1.display("2st Handle");
    c1_h2.c12_h1.display("3st Handle");
  end
  
endmodule