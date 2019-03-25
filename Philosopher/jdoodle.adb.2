--with  Gnat.IO;
with Text_Io;
with Random_Generic;

procedure jdoodle is 
    --use Ada.Text_IO;
    use Text_Io;
    subtype my_type is integer range 0..2;
    
     package rnd_choise is 
      new Random_Generic (Result_Subtype => my_type);

    subtype my_type2 is integer range 1000..20000;
    package rnd_choise2 is 
       new Random_Generic (Result_Subtype => my_type2);
    
---------------------------------------------------------------------
  
    task table is
        entry check_place(data : out integer);
        entry finish_eat(data : in integer); 
        entry check_neighbours (data : in out integer);
    end table;
   
    task type Phil (lacks : integer) is                     
    end Phil;
   
    task servant is
        entry want_to_eat(data : in out integer);
    end servant;

-----------------------------------------------------------------------------------

    task body table is
        --L: my_type;            
        sits: array (1..5) of integer;
        forks: array (1..10) of integer;
        blocks: array (1..5) of integer;
        cnt:integer;
        left, right, cur :integer;
    begin      
        cnt:=0;
        
        for I in sits'Range loop
            sits(I):=0;
            blocks(I):=0;
            forks(I):=0;
            forks(I*2):=0;
        end loop;
         
        loop
            select
                accept finish_eat(data:in integer) do
                    put_line("      (table) cnt = " & integer'Image(cnt) & " ================================-1");
                    put_line("      [" & integer'Image(sits(1)) & " , "  & integer'Image(sits(2)) & " , " & integer'Image(sits(3)) & " , " & integer'Image(sits(4)) & " , " & integer'Image(sits(5)) & "]");
                    sits (data):=0;
                    forks (data*2):=0;
                    forks (data*2 -1):=0;
                    put_line("      phil leave" & integer'Image(data) & " place");
                    put_line("      [" & integer'Image(sits(1)) & " , "  & integer'Image(sits(2)) & " , " & integer'Image(sits(3)) & " , " & integer'Image(sits(4)) & " , " & integer'Image(sits(5)) & "]");
                    cnt:=cnt-1;
                    put_line("      (table) cnt = " & integer'Image(cnt) & " ================================-2");
                end finish_eat;
         
            or
            
                accept check_neighbours (data : in out integer) do
                    put_line("      [" & integer'Image(sits(1)) & " , "  & integer'Image(sits(2)) & " , " & integer'Image(sits(3)) & " , " & integer'Image(sits(4)) & " , " & integer'Image(sits(5)) & "]");
                    cur:=data;
                    sits(cur):=3;
                    
                    left:=(cur-1);
                    if (left = 0)
                    then 
                        left:=5;
                    end if;
                    
                    right:=(cur+1) mod 5;
                    
                    Put_Line("      (table) left = " & integer'Image(left) & " ;cur = " & integer'Image(cur) & " ;right = " & integer'Image(right));
                    data:=sits(left) + sits(right);
                    
                    if data > 2
                    then
                        sits(cur):=1;
                    end if;
                    
                    put_line("      [" & integer'Image(sits(1)) & " , "  & integer'Image(sits(2)) & " , " & integer'Image(sits(3)) & " , " & integer'Image(sits(4)) & " , " & integer'Image(sits(5)) & "]");
                end check_neighbours;
            
            or
         
                accept check_place (data : out integer) do
                    data:=0;
                    put_line("      (table) cnt = " & integer'Image(cnt) & " ================================1");
                    if (cnt < 4)
                    then
                        data:=0;
                        for I in sits'Range loop
                            if (I mod 2) /= 0
                            then
                                if (sits (I) = 0)
                                then
                                    data:= I;
                                    sits (I):=1;
                                    exit;
                                end if;
                            end if;                        
                        end loop;
                         
                        if data = 0
                        then 
                            for I in sits'Range loop
                                if (I mod 2) = 0
                                then 
                                    if (sits (I) = 0)
                                    then 
                                        data:= I;
                                        sits (I):=1;
                                        exit;
                                    end if;
                                end if;                        
                            end loop;
                        end if;
                         
                    else
                        put_line("      (table) cnt = " & integer'Image(cnt) & " ================================2");
                        data:=0;
                    end if;
        
                    if (data /= 0)
                    then 
                        cnt:=cnt+1;
                        put_line("      (table) cnt++");
                    end if;
                    put_line("      (table) cnt = " & integer'Image(cnt) & " ================================2");
                end check_place;
            
            
              
                
            end select;   
               
        end loop;
      
      
    end table;
------------------------------------------------------------------------------------------------

    task body servant is    
        -- L:my_type;
        place_l:integer;         
    begin
                 
        loop
      
            accept want_to_eat(data : in out integer) do
                put_line("  (servant)  serving phil " & integer'Image(data));
                loop 
                    put_line("  (servant)  atempt to serve phil" & integer'Image(data));
                    table.check_place(place_l);                      
                    put_line("  (servant)  result of phil " & integer'Image(data) & " is " & integer'Image(place_l));
                    exit when place_l /= 0;                      
                    put_line("  (servant)  Table is full!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
                end loop;
                data:= place_l;
            end want_to_eat;
                
        end loop;
        
    end servant;
------------------------------------------------------------------------------------------
   
    task body Phil is
        -- L: my_type;
        a: integer;
         n: my_type2;
        my_place, data: integer;
    begin
        my_place:=lacks;
        loop
                        --delay 0.0001;

            n:= rnd_choise2.random_value;
            --Put_Line("!!" & Integer'Image(n));
            for I in 1..n loop
                a := i*i-1;
            end loop;
              
            put_line("(philosopher) #" & integer'Image(lacks) & " wana eat"); 
            my_place:=lacks;
            servant.want_to_eat(my_place);
            put_line("(philosopher) #" & integer'Image(lacks) & " take place #"& integer'Image(my_place) ); 
            
            
            loop
                                data:=my_place;
                put_line("(philosopher) #" & integer'Image(lacks) & " atempt to eat");
                table.check_neighbours(data);
                
                exit when data <3;
                put_line("(philosopher) #" & integer'Image(lacks) & " failse to eat(((((");
            end loop;
            
            put_line("(philosopher) #" & integer'Image(lacks) & " eating!!!!!!!!!!");
            
            
            n:= rnd_choise2.random_value;
            --Put_Line("!!" & Integer'Image(n));
            for I in 1..n loop
                a := i*i-1;
            end loop;
              
            --delay 0.0001;
              
            put_line("(philosopher) #" & integer'Image(lacks) & " wana leave");
            table.finish_eat(my_place);
              
                                             
        end loop;
    end Phil;
      
    T_1 : Phil (lacks => 1);
    T_2 : Phil (lacks => 2);
    T_3 : Phil (lacks => 3);
    T_4 : Phil (lacks => 4);
    T_5 : Phil (lacks => 5);

       
      
  ------------------------------------------------------- 
 

begin

    Put_Line("Hello, world!");
    
end jdoodle;
