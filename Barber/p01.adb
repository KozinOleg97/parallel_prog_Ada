--with  Gnat.IO;
with Text_Io;

procedure P01 is 
   --use Ada.Text_IO;
   use Text_Io;

   
   ------------------------------------------------------------------------------
   task Barber is
      entry wake;
            --entry B (data : out integer);
            
   end Barber;


   task body Barber is
      State: integer;
            lmtx : integer = 0;      
   begin
            State:=0; --sleep   
            
      loop        
      
            select

         when (state = 0) => accept wake do
             Put_Line("call Barber Wake");
             State := 1; --work          
         end wake;
            
            or
            
           when (state = 1) => 
                  delay 0.0001;
           Put_Line("Barber done");
          State := 2; --check mtx         

               when (state = 2) =>
                  delay 0.0001;
                  Put_Line("Barber checking mtx");
                  Mutex.Take(lmtx);
                  if (lmtx = 1)
                     then state = 3; --check queue
                     else state = 0; --sleep
                  end if;
                 
               when (state = 3) => 
                  delay 0.0001;
           Put_Line("Barber checking queue");
          State := 2; --check mtx
                   
            end select;
            
      end loop;
   end Barber;
   ------------------
   
   task type Client is
      entry done;
            --entry B (data : out integer);            
   end Client ;


   task body Client is
      L: integer;
   begin
      L :=100;
      R.A (L);
      
   end Client ;
      
      T_1 : T;
      T_2 : T;
  ----------------------  
  
   task Mutex is
      entry free;
      entry take (data : out integer);
            
   end Mutex;


   task body Mutex is
      L: integer;      
      begin
       L:=1;    
       loop
       
              select
     
                  accept take (M : out integer) do
             Put_Line("call Take");
             M:=L;
             Put_Line(" LMTX = " & Integer'Image(L));
                       L:=0;
           end take;
                
              or
           
           accept free do
             Put_Line("call Free");
                       if (l = 1)
                       then Put_Line("call Free, but already free");
                       end if;
             L:=1;          
          end free;
             
              end select;
       end loop;
   end Mutex;

    
  -----------------------------------------------------
  
  task Queue is
      entry free;
      entry take (data : out integer);
            
   end Queue;


   task body Queue is
      L: integer;      
      begin
       L:=1;    
       loop
       
              select
     
                  accept take (M : out integer) do
             Put_Line("call Take");
             M:=L;
             Put_Line(" LMTX = " & Integer'Image(L));
                       L:=0;
           end take;
                
              or
           
           accept free do
             Put_Line("call Free");
                       if (l = 1)
                       then Put_Line("call Free, but already free");
                       end if;
             L:=1;          
          end free;
             
              end select;
       end loop;
   end Queue;

    
  -----------------------------------------------------

begin
    
   Put_Line("Hello, world!");
   
      

end P01;