-- This program can be used to demonstrate the Round-Robin scheduling
-- technique
-- The order is as follows: Task1 Task2 Task3 Task4
with SMALL_SP; use SMALL_SP;
procedure Atest4 is

   task Task1 is
     entry start;
   end Task1;

   task Task2 is
     entry start;
   end Task2;

   task Task3 is
     entry start;
   end Task3;

   task Task4 is
     entry start;
   end Task4;

   task body Task1 is
     k : INTEGER;
   begin
       accept start;
       for k in 0..20 loop
         PUT("1");
       end loop;
   end Task1;

   task body Task2 is
     k : INTEGER;
   begin
       accept start;
       for k in 0..20 loop
         PUT("2");
       end loop;
   end Task2;

   task body Task3 is
     k : INTEGER;
   begin
       accept start;
       for k in 0..20 loop
         PUT("3");
       end loop;
   end Task3;

   task body Task4 is
     k : INTEGER;
   begin
       accept start;
       for k in 0..20 loop
         PUT("4");
       end loop;
   end Task4;

begin
  PUT("If this was scheduled using Round-Robin then ");
  NEW_LINE;
  PUT("the order will be Task1 Task2 Task3 Task3");
  NEW_LINE;
  NEW_LINE;
  NEW_LINE;
  Task1.start;
  Task2.start;
  Task3.start;
  Task4.start;
end Atest4;
