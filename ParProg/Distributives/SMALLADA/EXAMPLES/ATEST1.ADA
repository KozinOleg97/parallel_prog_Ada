--  This test program is used to simulate a user communicating
--  to a computer center remotely by a terminal.  If the user
--  does not type anything on the terminal for a long time, then
--  the connection is terminated.  So if the user was given high
--  priority and he wakes up just before he is dissconnected then
--  he will be given the CPU and thus won't lose the connection

with SMALL_SP; use SMALL_SP;
procedure TERMINAL is

   task USER is
   end USER;

   task HP is
     entry Communicate;
   end HP;


   task ANOTHER is
   end ANOTHER;


   task body USER is
     k : INTEGER;
   begin
       for k in 0..100 loop
         PUT("I'm the user and I'll type something");
         NEW_LINE;
         HP.Communicate;
         PUT("I'm the user and now I'll sleep a while");
         NEW_LINE;
         delay 0.27;
       end loop;
   end USER;


   task body HP is
     k : INTEGER;
   begin
     for k in 0..100 loop
       delay 0.15;
       select
         accept Communicate do
           PUT("User is up and typing");
           NEW_LINE;
         end Communicate;
       or
         delay 0.29;
         PUT("User is scratching his head, I'll disconnect");
         NEW_LINE;
       end select;
     end loop;
  end HP;


  task body ANOTHER is
   k : INTEGER;
  begin
    for k in 0..100 loop
      PUT("This is just another user working");
      NEW_LINE;
      if (k mod 10 = 0) then
        delay 0.1;
      end if;
    end loop;
  end ANOTHER;

begin

end TERMINAL;
