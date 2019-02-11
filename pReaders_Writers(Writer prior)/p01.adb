--with  Gnat.IO;
with Text_Io;

procedure P01 is 
   --use Ada.Text_IO;
   use Text_Io;


   ---------------------------------
   task Task1;


   task body Task1 is
   begin
      --delay 2.0;
      Put_Line("task1");
   end Task1;
   -----------------------------------------
   task Controller is
      entry Read; 
      entry Write; 
      entry Fin; 
   end Controller ;


   task body Controller is
      State         : Integer := 0;  
      Readers_Count : Integer := 0;  
   begin
      Put_Line (
         "Controller start");

      loop

         case State is

            when 0    =>
               select

                  accept Read do State := 1; 
                     Readers_Count:=Readers_Count+1;
                     Put_Line (
                        "read start");
                     Put_Line(Integer'Image(Readers_Count));

                  end Read;

               or

                  accept Write do State := 2; 
                     Put_Line (
                        "write start");
                  end Write;
               end select;

            when 1    =>
               select

                  accept Read do State := 1; 
                     Readers_Count:=Readers_Count+1;
                     Put_Line (
                        "read start");
                     Put_Line(Integer'Image(Readers_Count));

                  end Read;

               or

                  accept Fin do Readers_Count := Readers_Count - 1; 

                     Put_Line (
                        "Fin read");
                     Put_Line(Integer'Image(Readers_Count));


                     if (Readers_Count = 0)
                           then
                        State := 0;
                     end if;
                  end Fin;

               or

                  accept Write do State := 3; 
                     Put_Line (
                        "write req ");
                  end Write;

               end select;

            when 2    =>
               select
                  accept Fin do State := 0; 

                     Put_Line (
                        "Fin write");
                  end Fin;

               or

                  delay 0.2;
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

   -----------------------------------------  
   task type Reader (Interval: Integer
         ) is
      entry Start; 
   end Reader;


   task body Reader is
   begin
      accept Start; 
      loop

         delay 0.01;
         Controller.Read;
         delay 0.01;
         Controller.Fin;
      end loop;

      Put_Line("Done");


   end Reader;

   -----------------------------------------  
   task type Writer (Interval: Integer
         ) is
      entry Start; 
   end Writer ;


   task body Writer is
   begin
      accept Start; 
      loop

         delay 0.01;
         Controller.Write;
         delay 0.03;
         Controller.Fin;
      end loop;

      Put_Line("Done");


   end Writer ;

   R_1 : Reader (Interval => 10000);  
   R_2 : Reader (Interval => 10000);  
   R_3 : Reader (Interval => 10000);  
   W_1 : Writer (Interval => 10000);  
   --------------------------------------------
begin

   --Put_Line("Hello, world!");

   R_1.Start;
   delay 0.05;
   R_2.Start;
   R_3.Start;
   delay 0.15;
   W_1.Start;

   --Controller.Read;
   --delay 1.0;
   --Controller.Read;
   --delay 1.0;
   --Controller.Read;
   --delay 1.0;
   --Controller.Fin;
   --delay 1.0;
   ----Controller.Write;
   ----delay 1.0;
   ----Controller.Fin;
   ----delay 1.0;
   --Controller.Fin;
   --delay 1.0;
   --Controller.Fin;
   --delay 1.0;

   --Controller.Write;
   --delay 0.1;
   --Controller.Read;
   --delay 1.0;
   --Controller.Fin;
   --delay 1.0;
   --Controller.Fin;
   --delay 1.0;





end P01;