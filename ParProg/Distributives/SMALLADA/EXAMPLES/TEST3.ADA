with small_sp; use small_sp;

procedure test3 is

  type Str10 is string(1..10);

  s1, s2, s3: str10;

  procedure write_array(x: str10) is
    begin
      for i in 1..10 loop
        put(x(i));
      end loop;
      new_line;
    end write_array;

begin
  s2 := "ABcdefghij";
--  put_line(S2);
  write_array(S2);
  put_line(s2(1), s2(2), ord(s2(1)), ord(s2(2)) );
  s2(1) := 'C';  s2(2) := 'D';
  put_line(s2(1), s2(2), ord(s2(1)), ord(s2(2)) );
  new_line;
  s3 := "zyxwvutsrqponm";
--  put_line(S3);
  write_array(S3);
  s3 := "AB C DE";
--  put_line(S1);
  write_array(S3);

end test3;