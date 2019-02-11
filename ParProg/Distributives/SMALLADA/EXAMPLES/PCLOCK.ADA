with Text_IO; use Text_IO;
Procedure pClock is
Task Clock;

Task Body Clock is
   I : integer := 0;
Begin --Clock
  Put_Line ( "Time");
  Loop
    Delay 3.0; i := i + 3;
    Put("Current "); Put(i); Put_Line(" sec");
  End Loop;
End Clock;

Begin
 delay 5.0;
End pClock;

