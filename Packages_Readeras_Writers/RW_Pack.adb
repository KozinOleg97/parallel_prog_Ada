--package RW_Pack is
--   procedure Write (data : integer);
--   procedure Fin;
--   function Read return Integer;
--end RW_Pack;

with Text_Io;
package body RW_Pack is
use Text_Io;
  
   
   task Controller is
      entry Read; 
      entry Write  ; 
      entry Fin; 
   end Controller ;


   task body Controller is
      State         : Integer := 0;  
      Readers_Count : Integer := 0;
      
      G_data : integer :=0;
   begin
      Put_Line (
         "Controller start");

      loop

         case State is

            when 0    =>
               select

                  accept Read  do 
                     
                     State := 1; 
                     Readers_Count:=Readers_Count+1;
                     Put_Line ("read start");
                     Put_Line(Integer'Image(Readers_Count));
                  end Read;

               or

                  accept Write do
                    
                     State := 2; 
                     Put_Line ("write start");
                  end Write;
               end select;

            when 1    =>
               select

                  accept Read  do
                    
                     State := 1; 
                     Readers_Count:=Readers_Count+1;
                     Put_Line (
                        "read start");
                     Put_Line(Integer'Image(Readers_Count));

                  end Read;

               or

                  accept Fin do 
                     Readers_Count := Readers_Count - 1; 
                     Put_Line ("Fin read");
                     Put_Line(Integer'Image(Readers_Count));

                     if (Readers_Count = 0)
                           then
                        State := 0;
                     end if;
                  end Fin;

               or

                  accept Write  do 
                     State := 3; 
                     Put_Line ("write req ");
                  end Write;

               end select;

            when 2    =>
               select
                  accept Fin do State := 0; 
                     
                     G_data := G_data +1;
                     G_data := G_data +1;
                     G_data := G_data - 1;
                     Put_Line (
                        "Fin write");
                  end Fin;

               or

                  delay 0.1;
                  Put_Line (
                     "Wait write Fin");
               end select;


            when 3    =>
               select
                  accept Fin do Readers_Count := Readers_Count - 1; 

                     Put_Line (
                        "Stop read");
                     Put_Line(Integer'Image(Readers_Count));


                     if (Readers_Count = 0)
                           then
                        State := 2;
                        Put_Line (
                           "Start write");


                     end if;
                  end Fin;

               end select;


            when others => -- error 
               null;
         end case;



      end loop;
      Put_Line (
         "Controller End");
   end Controller;
   
   ----------------------------------------------
   
    procedure Write  is
   begin
      controller.write;
   end Write;


   procedure Fin is
   begin
      controller.fin;
   end Fin;
   
   
   procedure Read is
   begin
      controller.read;      
   end Read;
   
   ----------------------------------------------
   Begin
         Put_Line ("Start RW");

   
   End RW_pack;