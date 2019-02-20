--with  Gnat.IO;
with Text_Io;

procedure P01 is 
   --use Ada.Text_IO;
   use Text_Io;

   
   ------------------------------------------------------------------------------
   
      task type T is
      --entry A (from_t_to_r : in integer);
            entry B (data : out integer);
            
   end T ;


   task body T is
      L: integer;
   begin
      L :=100;
            accept B (data : out integer) do
                data := L;
                Put_Line("Take L from T ");                
             end B;            
      
   end T ;
      
      T_1 : T;
      T_2 : T;
  ----------------------  
  
   task R is
      --entry A (data : in integer);
            --entry B (data : out integer);
            
   end R;


   task body R is
      L_1: integer;
            L_2: integer;
   begin            
      T_1.B (L_1);
            --delay 1.0;
            T_2.B (L_2);
      Put_Line("Result, L_1 = " & Integer'Image(L_1));
            Put_Line("Result, L_2 = " & Integer'Image(L_2));

   end R;
   ------------------
   
   
begin
    
   Put_Line("Hello, world!");
   
      

end P01;