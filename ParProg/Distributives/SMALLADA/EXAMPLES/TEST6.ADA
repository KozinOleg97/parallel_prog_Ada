with SMALL_SP; use SMALL_SP;
procedure TEST6 is

  -------------------------------------------------------------------------
  -- This program demonstrates WHEN clauses on SmallAda v2.0 SELECT      --
  -- alternatives.                                                       --
  -------------------------------------------------------------------------

  task R is
    entry E1;
    entry E2;
    entry E3;
  end R;

  task A;
  task B;
  task C;

  task body R is
    GUARD1 : boolean;
    GUARD2 : boolean;
    GUARD3 : boolean;
    I      : integer;
  begin
    CURSORAT(3,1); Put("TESTING GUARDED SELECT ALTERNATIVES, TEST #");
    I := 1;
    loop
      CURSORAT(3,45); Put(I);
      if RANDOM(100) > 50 then GUARD1 := true; else GUARD1 := false; end if;
      if RANDOM(100) > 50 then GUARD2 := true; else GUARD2 := false; end if;
      if RANDOM(100) > 50 then GUARD3 := true; else GUARD3 := false; end if;
      CURSORAT(5,1); Put("GUARD ON ACCEPT E1 ===> ");
      if GUARD1 then
        Put("TRUE                           ");
      else
        Put("FALSE                          ");
      end if;
      CURSORAT(7,1); Put("GUARD ON ACCEPT E2 ===> ");
      if GUARD2 then
        Put("TRUE                           ");
      else
        Put("FALSE                          ");
      end if;
      CURSORAT(9,1); Put("GUARD ON ACCEPT E3 ===> ");
      if GUARD3 then
        Put("TRUE                           ");
      else
        Put("FALSE                          ");
      end if;

      select
        when GUARD1 => accept E1; 
        CURSORAT(5,31); Put("*** CALL ACCEPTED ***");
      or
        when GUARD2 => accept E2;
        CURSORAT(7,31); Put("*** CALL ACCEPTED ***");
      or
        when GUARD3 => accept E3;
        CURSORAT(9,31); Put("*** CALL ACCEPTED ***");
      or
        delay 1.0;
      end select;
      delay 2.0;
      I := I + 1;
    end loop;
  end R;

  task body A is
  begin
    loop
      R.E1;
    end loop;
  end A;

  task body B is
  begin
    loop
      R.E2;
    end loop;
  end B;

  task body C is
  begin
    loop
      R.E3;
    end loop;
  end C;

begin
  null;
end TEST6;
