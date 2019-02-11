with SMALL_SP; use SMALL_SP;  -- CS159-10 Instructor: Arthur Vargas Lopes
                              -- Fall 1990
procedure SELECT_S is
   ch : character;
   procedure SELECT_S_SORT is
    B : STRING(0..25);
    I,J : INTEGER;
    procedure SWAP(X, Y : in INTEGER) is
        temp : character;
    begin
        CURSORAT(2,X+14); PUT("X"); CURSORAT(2,Y+14); PUT("Y");
        temp := b(x);
        b(x) := b(y);
        b(y) := temp;
        CURSORAT(3,X+14); PUT(b(x)); CURSORAT(3,Y+14); PUT(b(y)); CURSORAT(2,X+14);
        PUT(" "); CURSORAT(2,Y+14); PUT(" ");
    end SWAP;
 begin
       B := "ZYXWVUTSRQPONMLKJIHGFEDCBA";
       for k in 0..25 loop
           CURSORAT(3,k+14);
           put(b(k));
       end loop;
       for i in 0..24 loop               CURSORAT(2,50); PUT("I: "); PUT(I);
         for j in (i+1)..25 loop         CURSORAT(3,50); PUT("J: "); PUT(J);
           if B(I) > B(J) then
             SWAP(I,J);
           end if;
         end loop;
       end loop;
   end SELECT_S_SORT;
begin
  CURSORAT(3,1); PUT("Selection:");
  SELECT_S_SORT;
  CURSORAT(19,1); PUT("Press enter to proceed..."); GET(ch);
end SELECT_S;


