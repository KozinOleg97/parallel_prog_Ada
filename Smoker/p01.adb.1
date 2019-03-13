--with  Gnat.IO;
with Text_Io;
with Random_Generic;


procedure P01 is 
   --use Ada.Text_IO;
   use Text_Io;
      subtype my_type is integer range 0..2;
      
      
        package rnd_choise is 
          new Random_Generic (Result_Subtype => my_type);

          
          subtype my_type2 is integer range 1000..20000;
      
      
        package rnd_choise2 is 
          new Random_Generic (Result_Subtype => my_type2);
                    



   ----------------------   
  
   task table is
      entry put_rnd (data : in my_type);
      entry take (data : out my_type);            
   end table;


   task body table is
      L: my_type;
            

   begin
      
           loop
              
                            select
                 accept put_rnd (data : in my_type) do                 
                         l := data;
                                               Put_Line("Everything except " & my_type'Image(L) & " on the table");
                 end put_rnd;             
                 
                               or
                               
                 accept take (data : out my_type) do
                          data:= l;
                                                 put_line("Atemt to take");
                 end take;
                           end select;      
           end loop;
      
   end table;
   ------------------------------------------------------------------------------
   task barman is
         entry next;     
   end barman;


   task body barman is    
         L:my_type;
   begin
           l:=0;            
      loop
               l := rnd_choise.random_VALUE;
                              
                              Put_Line("Barman don't take  " & my_type'Image(L));

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
            a: integer;
            n: my_type2;
   begin
         loop
            table.take(l);
                                          
                     if (L = lacks)
                     then          barman.next;
                              Put_Line("Smoking #" & Integer'Image(L));
                                                            n:= rnd_choise2.random_value;
                                                            --Put_Line("!!" & Integer'Image(n));
                                                            for I in 100..n loop
                                                               a := i*i-1;
                                                            end loop;
                                                            Put_Line("Smoking #" & Integer'Image(L) & " finish");
                              
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