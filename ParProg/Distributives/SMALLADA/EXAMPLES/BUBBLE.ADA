with SMALL_SP; use SMALL_SP;  -- CS159-10 Instructor: Arthur Vargas Lopes
                              -- Fall 1990
procedure BUBBLE is
   procedure BUBBLE_SORT is
    B : STRING(0..25);
    I,J : INTEGER;
    procedure SWAP(X, Y : in INTEGER) is
        temp : character;
    begin
        CURSORAT(6,X+14); PUT("X"); CURSORAT(6,Y+14); PUT("Y");
        temp := b(x);
        b(x) := b(y);
        b(y) := temp;
        CURSORAT(7,X+14); PUT(b(x)); CURSORAT(7,Y+14); PUT(b(y)); CURSORAT(6,X+14);
        PUT(" "); CURSORAT(6,Y+14); PUT(" ");
    end SWAP;
 begin
       B := "ZYXWVUTSRQPONMLKJIHGFEDCBA";
       for k in 0..25 loop
           CURSORAT(7,k+14);
           put(b(k));
       end loop;
       I:= 25;
       while (I > 0) loop                CURSORAT(6,50); PUT("I: "); PUT(I);
         J:= 0;
         while (J < I) loop              CURSORAT(7,50); PUT("J: "); PUT(J);
           if B(J) > B(J+1) then
             SWAP(J,J+1);
           end if;
           J:= J+1;
         end loop;
         I:= I-1;
       end loop;
   end BUBBLE_SORT;
begin
  CURSORAT(7,1); PUT("Bubble:");
  BUBBLE_SORT;
end BUBBLE;


