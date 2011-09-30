-- Calcul numérique en Ada
-- ***********************


with Ada.Text_Io; use Ada.Text_Io;
with Ada.Integer_Text_IO;


---------------------------------------------------------------------------------------
------ Ada95 Matrix Package is needed http://dflwww.ece.drexel.edu/research/ada/ ------
---------------------------------------------------------------------------------------
with Generic_Real_Arrays;
----with Generic_Real_Arrays.Operations;
with Generic_Real_Arrays.Array_IO;


procedure Main is
   n : FLOAT;

   package Real_Arrays is new Generic_Real_Arrays(FLOAT);
   --package Real_Arrays_Array_IO is new Generic_Real_Arrays_Array_IO(FLOAT);

   ----package Real_Arrays_Operations is new Real_Arrays.Operations;
   use Real_Arrays;
   --use Real_Arrays_Array_IO;
   ----use Real_Arrays_Operations;

   A : Real_Matrix(1..5, 1..5);
   B : Real_Matrix(1..5, 1..5);
   C : Real_Matrix(1..5, 1..5);

begin
   Put_Line("Using Ada & Ada95 Matrix Package !");
   n := 2.0;

   A := (( 1.0,  2.0,  3.0,  4.0,  5.0),
         ( 6.0,  7.0,  8.0,  9.0, 10.0),
         (11.0, 12.0, 13.0, 14.0, 15.0),
         (16.0, 17.0, 18.0, 19.0, 20.0),
         (21.0, 22.0, 23.0, 24.0, 25.0));

   B := (( 1.0,  2.0,  3.0,  4.0,  5.0),
         ( 6.0,  7.0,  8.0,  9.0, 10.0),
         (11.0, 12.0, 13.0, 14.0, 15.0),
         (16.0, 17.0, 18.0, 19.0, 20.0),
         (21.0, 22.0, 23.0, 24.0, 25.0));

   C := A+B;

   --Put(C);
   --Real_Arrays_Array_IO.Put(C);

end Main;
