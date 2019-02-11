-- This program can be used to demonstrate the scheduling techniques
-- since Task1 will have higher priority than Task2, so more
-- A's will be printed out than B's at a time if scheduled using
-- scheduling techniques 3 and 5

with SMALL_SP; use SMALL_SP;
procedure Atest2 is

   task Task1 is
     entry start;
   end Task1;

   task Task2 is
     entry start;
   end Task2;


   task body Task1 is
     k : INTEGER;
   begin
       accept start;
       for k in 0..20 loop
         PUT("A");
         if (k mod 5 = 0) then
           delay 0.55;
         end if;
       end loop;
   end Task1;

   task body Task2 is
     k : INTEGER;
   begin
       accept start;
       for k in 0..20 loop
         PUT("B");
         if (k mod 5 = 0) then
           delay 0.55;
         end if;
       end loop;
   end Task2;



begin
  PUT("In this run Task1 has higher priority than Task2, so more A's");
  NEW_LINE;
  PUT("will be printed at one time than B's if using methods 3 and 5");
  NEW_LINE;
  NEW_LINE;
  NEW_LINE;
  Task1.start;
  Task2.start;
end Atest2;
