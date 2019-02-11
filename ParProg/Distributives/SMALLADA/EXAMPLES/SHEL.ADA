with SMALL_SP; use SMALL_SP;
procedure SHEL is

     B : STRING(0..25);
     TEMP : CHARACTER;
     I,J,STEP : INTEGER;
     STEPSIZE : array(1..4) OF INTEGER;
     STOP : BOOLEAN;
     ROW : INTEGER;
     STIME : FLOAT;

begin
 B := "ZYXWVUTSRQPONMLKJIHGFEDCBA";
 CURSORAT(7,1); PUT("Shell:");
 STIME := CLOCK + 10.0;
 ROW := 7;
 for k in 0..25 loop
  CURSORAT(row,14+k);
  PUT(b(k));
 end loop;
 -- 'steps' contains decreasing increments for each
 -- pass. The last pass has increment 1.
 STEPSIZE(4) := 1;
 for PASS in reverse 1..3 loop
  STEPSIZE(PASS):= 2*STEPSIZE(PASS+1);
 end loop;

-- delay STIME - CLOCK;
for PASS in 1..4 loop
 STEP := STEPSIZE(PASS);
 I:= STEP;
 while (I <= 25) loop
  TEMP := B(I);
  J:= I;
  STOP:= FALSE;
  while (J > STEP-1) and (STOP /= TRUE) loop
   J := J - STEP;
   if B(J) > TEMP then
    B(J+STEP):= B(J);
    CURSORAT(ROW,14+J);
    PUT(TEMP);
   else
    B(J+STEP):= TEMP;
    STOP:= TRUE;
   end if;
   CURSORAT(ROW, 14+(J+STEP));
   PUT(B(J+STEP));
  end loop;
  if (not STOP) then
   B(0):= TEMP;
   CURSORAT(ROW,14);
   PUT(B(0));
  end if;
  I := I + STEP;
 end loop;
end loop; -- for pass in 1..npass
cursorat(19,1);
put_line("Press any key to continue..."); get(i);
end SHEL;


