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
            
      loop  

            Bshop.berber_work;

           
      
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
         loop
      bShop.client_work;

         end loop;
   end Client ;
      
      T_1 : T;
      T_2 : T;
  ----------------------   
  
   task type BShop is
      entry done;
      entry check;            
   end BShop;


   task body BShop is
      is_Sleep: boolean = true;
            is_done: boolean = false;
            is_in:boolean = false;
   begin
      
           loop
              
              accept client_work do
              
              end client_work;
              
              
              
              accept barber_work do
              
              end barber_work;                      
               
               
             
               
                        
               
           
           end loop;
      
   end BShop;     
      
  ---------------------- 
 

begin
    
   Put_Line("Hello, world!");
   
      

end P01;