with SMALL_SP; use SMALL_SP;
procedure TEST4 is

  -------------------------------------------------------------------------
  -- This program demonstrates the Timed and Conditional entry calling   --
  -- capability of SmallAda version 2.0.  
  -- Task priority inheritance is also demonstrated.                     --                                               --
  -------------------------------------------------------------------------

  SCREEN : SEMAPHORE;

  task R is
    entry E1( CALLER : in character; D : in float);
    entry E2;
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
    CURSORAT(12,1); Put("TASK R RECEIVES CALLS FROM A,B,AND C");
    SIGNAL(SCREEN);
    loop
      WAIT(SCREEN);
      CURSORAT(13,1); Put("===>                      ");
      SIGNAL(SCREEN);
      accept E1(CALLER : in character; D : in float) do
        C := CALLER;
        DT := D;
      end E1;
      WAIT(SCREEN);
      CURSORAT(13,1); Put("===> RENDEZVOUSED WITH "); Put(C);
      SIGNAL(SCREEN);
      delay DT;
    end loop;
    accept E2;
  end R;

  task body A is
  begin
    WAIT(SCREEN);
    CURSORAT(15,1); Put("TASK A DOES TIMED CALLS TO R");
    SIGNAL(SCREEN);
    loop
      WAIT(SCREEN);
      CURSORAT(16,1); Put("===> CALLING ....");
      SIGNAL(SCREEN);
      select
        R.E1('A',2.0);
        WAIT(SCREEN);
        CURSORAT(16,1); Put("===> ACCEPTED    ");
        SIGNAL(SCREEN);
        delay 2.0;
      or
        delay 1.0;
      end select;
      WAIT(SCREEN);
      CURSORAT(16,1); Put("===> DELAYED     ");
      SIGNAL(SCREEN);
      delay 3.0;
    end loop;
  end A;

  task body B is
  begin
    WAIT(SCREEN);
    CURSORAT(18,1); Put("TASK B DOES CONDITIONAL CALLS TO R");
    SIGNAL(SCREEN);
    loop
      WAIT(SCREEN);
      CURSORAT(19,1); Put("===> CALLING ....");
      SIGNAL(SCREEN);
      select
        R.E1('B',1.0);
        WAIT(SCREEN);
        CURSORAT(19,1); Put("===> ACCEPTED    ");
        SIGNAL(SCREEN);
        delay 1.0;
      else
        WAIT(SCREEN);
        CURSORAT(19,1); Put("===> **FAILED**  ");
        SIGNAL(SCREEN);
        delay 1.0;
      end select;
      WAIT(SCREEN);
      CURSORAT(19,1); Put("===> DELAYED     ");
      SIGNAL(SCREEN);
      delay 1.0;
    end loop;
  end B;

  task body C is
  begin
    Priority(100);
    WAIT(SCREEN);
    CURSORAT(21,1); Put("TASK C MAKES UNANSWERABLE CALLS WITH HIGH PRIORITY");
    SIGNAL(SCREEN);
    loop
      WAIT(SCREEN);
      CURSORAT(22,1); Put("===> CALLING (R's PRIORITY SHOULD JUMP)");
      SIGNAL(SCREEN);
      select
        R.E2;
      or
        delay 2.0;
      end select;
      WAIT(SCREEN);
      CURSORAT(22,1); Put("===> DELAYED (R's PRIORITY SHOULD DROP)");
      SIGNAL(SCREEN);
      delay 2.0;
    end loop;
  end C;

begin
  SCREEN := 1;
end TEST4;
