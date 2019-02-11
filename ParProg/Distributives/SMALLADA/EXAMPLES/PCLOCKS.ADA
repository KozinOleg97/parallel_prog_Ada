with Text_IO; use Text_IO;
Procedure pClocks is
Task tClock1;
Task tClock2;
Task tClock3;

Task Body tClock1 is
   I : integer := 0;
Begin --tClock
  Cursorat(1,1); Put( "Timer 1");
  Loop
    Delay 3.0; i := i + 1;
    CursorAt(1,2);  Put(i);
  End Loop;
End tClock1;

Task Body tClock2 is
   I : integer := 0;
Begin --tClock
  CursorAt(25, 1); Put( "Timer 2");
  Loop
    Delay 3.0; i := i + 2;
    CursorAt(25, 2);  Put(i);
  End Loop;
End tClock2;

Task Body tClock3 is
   I : integer := 0;
Begin --tClock
  CursorAt(50,1); Put( "Timer 3");
  Loop
    Delay 3.0; i := i + 3;
    Cursorat(50, 2);  Put(i);
  End Loop;
End tClock3;

Begin--pClocks
 delay 1.0;
End pClocks;

