with SMALL_SP; use SMALL_SP;
procedure FOURTASK is

  SCREEN: SEMAPHORE := 1;

  task CYCLIC_1 is
    entry START;
  end CYCLIC_1;

  task CYCLIC_2 is
    entry START;
  end CYCLIC_2;

  task CYCLIC_3 is
    entry START;
  end CYCLIC_3;

  task CYCLIC_4 is
    entry START;
  end CYCLIC_4;

  task body CYCLIC_1 is
    T : FLOAT;
  begin
    accept START;
    WAIT(SCREEN);
    CURSORAT(1,1); PUT("CYCLIC_1 RUNS EVERY 3.0 SECONDS");
    SIGNAL(SCREEN);
    T := CLOCK + 3.0;
    for HOW_MANY in 1..20
    loop
      WAIT(SCREEN);
      CURSORAT(2,1); PUT("       ");
      SIGNAL(SCREEN);
      delay T - CLOCK;
      T := CLOCK + 3.0;
      WAIT(SCREEN);
      CURSORAT(2,1); PUT("RUNNING"); PUT(HOW_MANY);
      SIGNAL(SCREEN);
    end loop;
  end CYCLIC_1;

  task body CYCLIC_2 is
    T : FLOAT;
  begin
    accept START;
    WAIT(SCREEN);
    CURSORAT(3,1); PUT("CYCLIC_2 RUNS EVERY 5.0 SECONDS");
    SIGNAL(SCREEN);
    T := CLOCK + 5.0;
    for HOW_MANY in 1..10
    loop
      WAIT(SCREEN);
      CURSORAT(4,1); PUT("       ");
      SIGNAL(SCREEN);
      delay T - CLOCK;
      T := CLOCK + 5.0;
      WAIT(SCREEN);
      CURSORAT(4,1); PUT("RUNNING"); PUT(HOW_MANY);
      SIGNAL(SCREEN);
    end loop;
  end CYCLIC_2;

  task body CYCLIC_3 is
    T : FLOAT;
  begin
    accept START;
    WAIT(SCREEN);
    CURSORAT(5,1); PUT("CYCLIC_3 RUNS EVERY 7.0 SECONDS");
    SIGNAL(SCREEN);
    T := CLOCK + 7.0;
    for HOW_MANY in 1..10
    loop
      WAIT(SCREEN);
      CURSORAT(6,1); PUT("       ");
      SIGNAL(SCREEN);
      delay T - CLOCK;
      T := CLOCK + 7.0;
      WAIT(SCREEN);
      CURSORAT(6,1); PUT("RUNNING"); PUT(HOW_MANY);
      SIGNAL(SCREEN);
    end loop;
  end CYCLIC_3;

  task body CYCLIC_4 is
    T : FLOAT;
  begin
    accept START;
    WAIT(SCREEN);
    CURSORAT(7,1); PUT("CYCLIC_4 RUNS EVERY 9.0 SECONDS");
    SIGNAL(SCREEN);
    T := CLOCK + 9.0;
    for HOW_MANY in 1..10 loop
      WAIT(SCREEN);
      CURSORAT(8,1); PUT("       ");
      SIGNAL(SCREEN);
      delay T - CLOCK;
      T := CLOCK + 9.0;
      WAIT(SCREEN);
      CURSORAT(8,1); PUT("RUNNING"); PUT(HOW_MANY);
      SIGNAL(SCREEN);
    end loop;
  end CYCLIC_4;

begin
  CYCLIC_1.START;
  CYCLIC_2.START;
  CYCLIC_3.START;
  CYCLIC_4.START;
end FOURTASK;
