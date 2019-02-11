with SMALL_SP; use SMALL_SP;
procedure TEST5 is

  -------------------------------------------------------------------------
  -- This program demonstrates the Timed and Conditional entry calling   --
  -- and the Selective Wait capability of SmallAda v2.0.  
  -------------------------------------------------------------------------

  SCREEN : SEMAPHORE;

  task R is
    entry E1( CALLER : in character; D : in float);
    entry E2( CALLER : in character; D : in float);
    entry E3( CALLER : in character; D : in float);
  end R;

  task A;
  task B;
  task C;

  task body R is
    C : character;
    DT : float;
  begin
    INHERITP(true);
    WAIT(SCREEN);
    CURSORAT(2,1); Put("Task R receives calls from A, B, C on E1, E2, E3.");
    SIGNAL(SCREEN);
    loop
      select
        accept E1(CALLER : in character; D : in float) do
          C := CALLER;
          DT := D;
        end E1;
        WAIT(SCREEN);
        CURSORAT(3,1); Put("===> R.E1 called by "); Put(C);
        SIGNAL(SCREEN);
        delay DT;
      or
        accept E2(CALLER : in character; D : in float) do
          C := CALLER;
          DT := D;
        end E2;
        WAIT(SCREEN);
        CURSORAT(3,1); Put("===> R.E2 called by "); Put(C);
        SIGNAL(SCREEN);
        delay DT;
      or
        accept E3(CALLER : in character; D : in float) do
          C := CALLER;
          DT := D;
        end E3;
        WAIT(SCREEN);
        CURSORAT(3,1); Put("===> R.E3 called by "); Put(C);
        SIGNAL(SCREEN);
        delay DT;
      or
        delay 1.0;
        WAIT(SCREEN);
        CURSORAT(3,1); Put("===> Timed Out Waiting     ");
        SIGNAL(SCREEN);
        delay 3.0;
      or
        delay 100000.0; -- If this delay is chosen the system will hang
        -- for a while
      end select;
      WAIT(SCREEN);
      CURSORAT(3,1); Put("===>                   ");
      SIGNAL(SCREEN);
    end loop;
    accept E2;
  end R;

  task body A is
  begin
    WAIT(SCREEN);
    CURSORAT(5,1); Put("Task A does timed calls to R.E1");
    SIGNAL(SCREEN);
    loop
      WAIT(SCREEN);
      CURSORAT(6,1); Put("===> calling ....");
      SIGNAL(SCREEN);
      select
        R.E1('A',1.11);
        WAIT(SCREEN);
        CURSORAT(6,1); Put("===> accepted    ");
        SIGNAL(SCREEN);
        delay 1.11;
      or
        delay 2.0;
      end select;
      WAIT(SCREEN);
      CURSORAT(6,1); Put("===> delayed     ");
      SIGNAL(SCREEN);
      delay 3.0;
    end loop;
  end A;

  task body B is
  begin
    WAIT(SCREEN);
    CURSORAT(8,1); Put("Task B does conditional calls to R.E2");
    SIGNAL(SCREEN);
    loop
      WAIT(SCREEN);
      CURSORAT(9,1); Put("===> calling ....");
      SIGNAL(SCREEN);
      select
        R.E2('B',0.5);
        WAIT(SCREEN);
        CURSORAT(9,1); Put("===> accepted    ");
        SIGNAL(SCREEN);
        delay 0.5;
      else
        WAIT(SCREEN);
        CURSORAT(9,1); Put("===> **failed**  ");
        SIGNAL(SCREEN);
        delay 0.5;
      end select;
      WAIT(SCREEN);
      CURSORAT(9,1); Put("===> delayed     ");
      SIGNAL(SCREEN);
      delay 0.5;
    end loop;
  end B;

  task body C is
  begin
    Priority(100);
    WAIT(SCREEN);
    CURSORAT(11,1); Put("Task C makes calls with high priority to R.E3");
    SIGNAL(SCREEN);
    loop
      WAIT(SCREEN);
      CURSORAT(12,1); Put("===> calling ....");
      SIGNAL(SCREEN);
      select
        R.E3('C',4.0);
        WAIT(SCREEN);
        CURSORAT(12,1); Put("===> accepted    ");
        SIGNAL(SCREEN);
        delay 100.0 * 0.04;
      or
        delay 2.0;
      end select;
      WAIT(SCREEN);
      CURSORAT(12,1); Put("===> delayed     ");
      SIGNAL(SCREEN);
      delay 5.0;
    end loop;
  end C;

begin
  SCREEN := 1;
end TEST5;
