-----------------------------------------------------------------
-- Copyright (c) Drexel University, 1996                       --
-- Data Fusion Laboratory                                      --
-- Electrical and Computer Engineering Department              --
--                                                             --
-- Permission to use, copy, modify, distribute, and sell this  --
-- software and its documentation for any purpose is hereby    --
-- granted without fee, provided that the above copyright      --
-- notice appear in all copies and that both that copyright    --
-- notice and this permission notice appear in supporting      --
-- documentation.                                              --
--                                                             --
-- Drexel University disclaims all warranties with regard to   --
-- this software, including all implied warranties of          --
-- merchantability and fitness, in no event shall Drexel       --
-- University be liable for any special, indirect or           --
-- consequential damages or any damages whatsoever resulting   --
-- from loss of use, data or profits, arising out of or in     --
-- connection with the use or performance of this software.    --
-----------------------------------------------------------------
--
-- $FILE: generic_complex_arrays-array_io.ads
-- $LAST_MODIFIED: 07/31/96
-- $AUTHORS: Chris Papademetrious, Xiaoxun Zhu, Moshe Kam
--
-- Instantiating this package:
-- To instantiate this package, you must first instantiate
-- Generic_Complex_Arrays, then refer to this as a child package.
-- Example:
--
--  package Real_Arrays is new Generic_Real_Arrays(Float);
--  package Complex_Types is new Ada.Numerics.Generic_Complex_Types(Float);
--  use Real_Arrays;
--  use Complex_Types;
--  package Complex_Arrays is new Generic_Complex_Arrays(Float,
--                                                       Real_Vector,
--                                                       Real_Matrix,
--                                                       Complex);
--  package Complex_Arrays_IO is new Complex_Arrays.Array_IO;


generic
package GENERIC_COMPLEX_ARRAYS.ARRAY_IO is

  -- display command for vectors, matrices
  procedure Put(v : in COMPLEX_VECTOR);
  procedure Put(m : in COMPLEX_MATRIX);

end GENERIC_COMPLEX_ARRAYS.ARRAY_IO;
