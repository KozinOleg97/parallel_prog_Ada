with Text_IO; use Text_IO;
Procedure ppClocks is
Task Type tpClock is
 entry Dt(Dtn : in natural);
end tpClock;

Clock1, Clock2, Clock3 : tpClock;

Task Body tpClock is
   I : natural := 0; sDtn : natural;
Begin --tpClock
Loop
  select 
 -- when Dt'Count /= 0 =>
  accept Dt(Dtn : in natural) do
    sDtn := Dtn;
  end Dt;
  Put_Line ( Item=>"Timer "&Natural'Image(sDtn));
  
  else
    begin
      Delay 0.5; i := i + sDtn;
    Put_Line ("Timer "&Natural ' Image(sDtn)&"    Current "&Natural'Image(i)&" sec");
    end;
    
    end select;  
 End Loop;
  --Put_Line ( "Timer "&Integer'Image(sDtn));
  
End tpClock;
Begin--ppClocks
 Clock1.Dt(1);
   Clock2.Dt(2);
   Clock3.Dt(3);
End ppClocks;

