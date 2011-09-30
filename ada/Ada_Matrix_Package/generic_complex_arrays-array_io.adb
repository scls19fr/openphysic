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
-- $FILE: generic_complex_arrays-array_io.adb
-- $LAST_MODIFIED: 07/31/96
-- $AUTHORS: Chris Papademetrious, Xiaoxun Zhu, Moshe Kam
--


with Ada.Text_IO;

package body GENERIC_COMPLEX_ARRAYS.ARRAY_IO is

  -- This creates math and IO packages specific to the generic type
  --  "Float_Element" that is used for this package.
  package Float_Element_IO is new Ada.Text_IO.Float_IO(REAL);

  procedure Put(X: in COMPLEX) is
  begin
    Ada.Text_IO.Put("(");
    Float_Element_IO.Put(RE(X));
    Ada.Text_IO.Put(",");
    Float_Element_IO.Put(IM(X));
    Ada.Text_IO.Put(")");
  end Put;

  procedure Put(v: in COMPLEX_VECTOR) is
  begin
    Ada.Text_IO.Put("(");
    Put(v(v'First));
    
    for I in v'First+1..v'last loop
      Ada.Text_IO.New_Line;
      Ada.Text_IO.Put(" ");
      Put(v(I));
    end loop;
    Ada.Text_IO.Put(")");
    Ada.Text_IO.New_Line;
  end Put;

  procedure Put(m: in COMPLEX_MATRIX) is
  begin
    Ada.Text_IO.Put("[");
    Put(m(m'First(1),m'First(2)));
    for C in m'First(2)+1..m'Last(2) loop
      Ada.Text_IO.Put(" ");
      Put(m(m'First(1),C));
    end loop;

    for R in m'First(1)+1..m'Last(1) loop
      Ada.Text_IO.New_Line;
      for C in m'First(2)..m'Last(2) loop
        Ada.Text_IO.Put(" ");
        Put(m(R,C));
      end loop;
    end loop;

    Ada.Text_IO.Put("]");
    Ada.Text_IO.New_Line;
  end Put;
end GENERIC_COMPLEX_ARRAYS.ARRAY_IO;
