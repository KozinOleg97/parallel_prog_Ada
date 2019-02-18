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
   task Task2 is
      entry Input; 
      entry Stop; 
   end Task2;


   task body Task2 is
   begin
      loop

         select
            accept Input do Put_Line (
"TASK2"); 
            end Input;

         or

            accept Stop do Put_Line (
"TASK22222222"); 
               --exit; 
            end Stop;
         end select;
      end loop;
   end Task2;

   -----------------------------------------  
   task type Task3 (Message: Character; How_Many: Positive) is
      entry Start; 
   end Task3;


   task body Task3 is
   begin
      accept Start; 
      for Count in 1..How_Many loop
         Put_Line(Integer'Image(Count));
         Task2.Input;
         --Task2.Stop;

         delay 0.8;
      end loop;

      Put_Line("Done");


   end Task3;


   T_1 : Task3 (Message => '-', How_Many => 10);  
   --------------------------------------------
begin

   Put_Line("Hello, world!");

   T_1.Start;



end P01;