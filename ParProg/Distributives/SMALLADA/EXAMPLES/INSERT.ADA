with SMALL_SP; use SMALL_SP; -- CS159-10 Fall/1990 - Arthur Vargas Lopes
procedure INSERT is
   ch : character;
   procedure INSERT_SORT is
     B    : STRING(0..26);
     J    : INTEGER;
     TEMP : CHARACTER;
     STOP : BOOLEAN;
    procedure SHOW(X : in INTEGER) is
    begin
        CURSORAT(4,X+14); PUT("^");
        CURSORAT(3,X+14); PUT(b(x));
        CURSORAT(4,X+14); PUT(" ");
    end SHOW;
   BEGIN
     B := " ZYXWVUTSRQPONMLKJIHGFEDCBA";
     for k in 1..26 loop
        CURSORAT(3,k+14);
        PUT(B(k));
     end loop;
     for I in 1..26 loop
       CURSORAT(3,45); PUT("I: "); PUT(I);
       CURSORAT(4,45); PUT("J: "); PUT(J);
       TEMP := B(I); J:= I; STOP := FALSE;
       while (J > 0) and (not STOP) loop
         J := J - 1;
         CURSORAT(4,45); PUT("J: "); PUT(J);
         if (B(J) > TEMP) then
            B(J+1):= B(J);
         else
            B(J+1):= TEMP;
            STOP := TRUE;
         end if;
         SHOW(J+1);
       end loop;
       if (not STOP) then
          B(1):= TEMP;
          SHOW(1);
       end if;
     end loop;
  end INSERT_SORT;
begin
  CURSORAT(3,1); PUT("Insertion:");
  INSERT_SORT;
  CURSORAT(23,1); PUT("Press any key to proceed..."); GET(ch);
end INSERT;
