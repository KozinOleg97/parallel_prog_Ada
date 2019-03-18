with Random_Generic;
package body My_rnd is

subtype my_type is Positive range 0..2;
  package my_type is 
    new Random_Generic (Result_Subtype => my_type);
end my_rnd;