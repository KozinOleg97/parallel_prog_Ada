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
         accept Input do Put_Line (
"TASK2"); 
         end Input;

         accept Stop do Put_Line (
"TASK22222222"); 
            --exit; 
         end Stop;
      end loop;
   end Task2;

   -----------------------------------------  
   task type Task3 (Message: Character; How_Many: Positive);


   task body Task3 is
   begin
      for Count in 1..How_Many loop
         Put_Line(" "&Message);
         Task2.Input;

         delay 0.1;
      end loop;

   end Task3;


   T_1 : Task3 (Message => '-', How_Many => 10);  
   --------------------------------------------
begin
   delay 1.0;
   Put_Line("Hello, world!");

   Task2.Input ;
   Task2.Stop;
end P01;