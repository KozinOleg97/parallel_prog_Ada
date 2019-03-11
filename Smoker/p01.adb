--with  Gnat.IO;
with Text_Io;
with Random_Generic;


procedure P01 is 
   --use Ada.Text_IO;
   use Text_Io;
      subtype my_type is integer range 0..2;
   ----------------------   
  
   task table is
      entry put_rnd (data : in my_type);
      entry take (data : out my_type);            
   end table;


   task body table is
      L: my_type;
            

   begin
      
           loop
              
              accept put_rnd (data : in my_type) do                 
                      l := data;
              end put_rnd;             
              
              accept take (data : out my_type) do
                               data:= l;
                            end take;
                     
           end loop;
      
   end table;
   ------------------------------------------------------------------------------
   task barman is
         entry next;     
   end barman;


   task body barman is    
         L:integer;
   begin
           l:=0;            
      loop
               l := Random_Generic (Result_Subtype => my_type); --!! generate rnd
               table.put_rnd(l);
  
         accept next do
                  Put_Line("Next");
               end next;
               
      end loop;
   end barman;
   ------------------
   
   task type Smoker (lacks : integer) is                  
   end Smoker ;


   task body Smoker is
      L: my_type;
   begin
         loop
            table.take(l);
                     if (L = lacks)
                     then 
                              Put_Line("Smoking #" & Integer'Image(L));
                              barman.next;
                     end if;
                  end loop;
   end Smoker ;
      
      T_1 : Smoker (lacks => 0);
      T_2 : Smoker (lacks => 1);
            T_3 : Smoker (lacks => 2);

       
      
  ---------------------- 
 

begin
    
   Put_Line("Hello, world!");
   
      

end P01;