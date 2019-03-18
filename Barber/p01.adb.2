--with  Gnat.IO;
with Text_Io;
with Random_Generic;

procedure P01 is 
   --use Ada.Text_IO;
   use Text_Io;

      subtype my_type is integer range 100..10000;

      package rnd_choise is 
          new Random_Generic (Result_Subtype => my_type);
      
   ----------------------   
  
   task BShop is
      --entry client_work;
      --entry barber_work;  
            entry client_in(data: out integer);  
            entry barber_Start_work;
            entry barber_end_work;
            entry client_take_place;

   end BShop;
   
   task Barber is
      entry wake;
            entry queue; 
            entry straight;
              --entry B (data : out integer);
            
   end Barber;


   task body BShop is
      L: integer;
            b_state:integer;
            c_state:integer;


   begin
      b_state:=0;
           c_state:=0;

           loop
                        select
              accept client_in (data : out integer) do              
                  Put_Line("___client in");     
                                    data:=b_state;
                                    --if (c_state = 0)
                                    --   then data:=b_state;
                                    --   else data:=1;
                                    --end if;
                                    c_state:=c_state+1;                        
              end client_in;
              
                             accept client_take_place do
                                put_line("___client_take_place");
                             end client_take_place;
                          
                         or delay 0.00001; 
                 end select;       
              --delay 3.0;
              
                       select                              
            
              accept barber_Start_work do
                                  b_state:=1;
                 Put_Line("Barber start  working");                                       
              end barber_start_work;     
              
                       or
                            accept barber_end_work do
                                  b_state:=0;
                 Put_Line("Barber stop working & going to sleep----------------------------------------");                                       
              end barber_end_work; 
              
                      or delay 0.000001;
                             
             end select;               
           
           end loop;
      
   end BShop;
   ------------------------------------------------------------------------------
   


   task body Barber is    
         client_queue :integer;
         n:my_type;
         l:integer;
         
   begin
            
            
            loop
               client_queue :=-1;
         Put_Line("sleep"); 
         
               accept wake do
           Put_Line("wake");                    
         end wake;
         
               Bshop.barber_start_work;

                      
         loop                                                                  
                   select
                   
                      accept straight do
                         Put_Line("working on straight client!"); 
                          n:= rnd_choise.random_value;
                                    
                           for I in integer range  1..1000 loop

                               l := i*i-1;      
                           end loop; 
                         Put_Line("done with straight client!");
                      end straight;
                      
                   or
                   
                      accept queue do
                            Put_Line("working on next client in queue!!");                           
                           n:= rnd_choise.random_value;
                                 --delay 0.001;   
                           for I in 1..n loop
                               l := i*i-1;
                               --Put_Line("***" & integer'image(l));              
                           end loop; 
                           for I in 1..n loop
                               l := i*i-1;
                               --Put_Line("***" & integer'image(l));              
                           end loop; 
                           for I in 1..n loop
                               l := i*i-1;
                               --Put_Line("***" & integer'image(l));              
                           end loop;   
                           Put_Line("done with client in queue!!"); 
                           Put_Line("()" & integer'image(queue'count));                    

                           client_queue:=queue'count;
                       end queue;   
                  
                   or delay 0.0001;                          
                       
                   end select;
                       
                  Put_Line("/////" & integer'image(client_queue));               
                  exit  when client_queue = 0;
                  if (client_queue = -1)
                     then client_queue:=0;
                  end if;
         end loop;
               Bshop.barber_End_work;
            end loop;
   end Barber;
   ------------------
   
   task type Client is
                  --entry B (data : out integer);       
     
   end Client ;


   task body Client is
      L: integer;
            n: my_type;
   begin
         loop

                  Bshop.client_in(l);
                  if (l = 0)
                  then Put_Line("new client decided to go straight to barber");
                                              barber.wake;
                                              BShop.client_take_place;
                                              barber.straight;
                                    else    Put_Line("new client decided to go in queue");
                                              Bshop.client_take_place;                                              
                                              barber.queue;                                              
                                    end if;
                  
                  Put_Line("client away");   
                                    
                                    n:= rnd_choise.random_value;
                                    
                                    for I in 1..100 loop
                                          l := i*i-1;      
                                    end loop;                     
                        
                        
         end loop;
   end Client ;
      
      T_1 : client;
      T_2 : client;
       T_3 : client;
            T_4 : client;
      T_5 : client; 
      T_6 : client; 
T_7 : client; 
T_8 : client; 

      
  ---------------------- 
 

begin
    
   Put_Line("--------"); 

   
      

end P01;
