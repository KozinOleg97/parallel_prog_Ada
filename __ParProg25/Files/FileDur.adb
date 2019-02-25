with Ada.Text_IO; use Ada.Text_IO; 
with Calendar; use Calendar;

procedure FileDur is
package Int_Io is new Integer_IO (Integer); use Int_Io;
type tData is array(1..2, 1..100) of integer;
   Data : tData;
 
subtype tFileNameOut is string(1..10);

oFN       : tFileNameOut;
i, j           : integer;
Output_File : File_Type;
N                     : integer;

begin
 
 oFn := "Times2.txt";
    
  N := 100;
  for i in 1..2 loop
  delay 0.01 * i;
  for j in 1..N loop
  Data(i, j) := j;
  end loop;
  end loop;
  New_Line; Put ( N);
  Create ( File => Output_File, Mode => Out_File, Name => oFN );
 I := 0; New_Line; Put("Output in  " & oFN);
   WHILE   I < N LOOP
      I := I + 1;
      Put ( File => Output_File, Item => Data(1, i));
      New_Line(File => Output_File);
    END LOOP;
   Close ( File => Output_File );
end FileDur;