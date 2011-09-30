-----------------------------------------------------------------
-- Copyright (c) Drexel University, 1996                       --
-- Data Fusion Laboratory                                      --
-- Electrical and Computer Engineering Department              --
--							       --
-- Permission to use, copy, modify, distribute, and sell this  --
-- software and its documentation for any purpose is hereby    --
-- granted without fee, provided that the above copyright      --
-- notice appear in all copies and that both that copyright    --
-- notice and this permission notice appear in supporting      --
-- documentation.					       --
--							       --
-- Drexel University disclaims all warranties with regard to   --
-- this software, including all implied warranties of          --
-- merchantability and fitness, in no event shall Drexel       --
-- University be liable for any special, indirect or           --
-- consequential damages or any damages whatsoever resulting   --
-- from loss of use, data or profits, arising out of or in     --
-- connection with the use or performance of this software.    --
-----------------------------------------------------------------
--
-- $FILE: generic_real_arrays.adb
-- $LAST_MODIFIED: 11/20/96
-- $AUTHORS: Chris Papademetrious, Xiaoxun Zhu, Moshe Kam
--

package body GENERIC_REAL_ARRAYS is

-- SUBPROGRAMS for REAL_VECTOR TYPES -- 

  -- REAL_VECTOR arithmetic operations -- 

  function "+" (RIGHT : REAL_VECTOR) return REAL_VECTOR is
  begin
    return RIGHT;
  end "+";

  function "-" (RIGHT : REAL_VECTOR) return REAL_VECTOR is
    RESULT: REAL_VECTOR(RIGHT'Range);
  begin
    for I in RIGHT'Range loop
      RESULT(I) := -RIGHT(I);
    end loop;
    return RESULT;
  end "-";

  function "abs" (RIGHT : REAL_VECTOR) return REAL_VECTOR is
    RESULT: REAL_VECTOR(RIGHT'Range);
  begin
    for I in RIGHT'Range loop
      RESULT(I) := abs RIGHT(I);
    end loop;
    return RESULT;
  end "abs";

  function "+" (LEFT, RIGHT : REAL_VECTOR) return REAL_VECTOR is
    RESULT: REAL_VECTOR(LEFT'Range);
  begin
    if LEFT'Length /= RIGHT'Length then
      raise ARRAY_INDEX_ERROR;
    end if;
    for I in LEFT'Range loop
      RESULT(I) := LEFT(I) + RIGHT(RIGHT'First + (I - LEFT'First));
    end loop;
    return RESULT;
  end "+";

  function "-" (LEFT, RIGHT : REAL_VECTOR) return REAL_VECTOR is
    RESULT: REAL_VECTOR(LEFT'Range);
  begin
    if LEFT'Length /= RIGHT'Length then
      raise ARRAY_INDEX_ERROR;
    end if;
    for I in LEFT'Range loop
      RESULT(I) := LEFT(I) - RIGHT(RIGHT'First + (I - LEFT'First));
    end loop;
    return RESULT;
  end "-";

  function "*" (LEFT, RIGHT : REAL_VECTOR) return REAL_VECTOR is
    RESULT: REAL_VECTOR(LEFT'Range);
  begin
    if LEFT'Length /= RIGHT'Length then
      raise ARRAY_INDEX_ERROR;
    end if;
    for I in LEFT'Range loop
      RESULT(I) := LEFT(I) * RIGHT(RIGHT'First + (I - LEFT'First));
    end loop;
    return RESULT;
  end "*";

  function "/" (LEFT, RIGHT : REAL_VECTOR) return REAL_VECTOR is
    RESULT: REAL_VECTOR(LEFT'Range);
  begin
    if LEFT'Length /= RIGHT'Length then
      raise ARRAY_INDEX_ERROR;
    end if;
    for I in LEFT'Range loop
      RESULT(I) := LEFT(I) / RIGHT(RIGHT'First + (I - LEFT'First));
    end loop;
    return RESULT;
  end "/";

  function "**" (LEFT : REAL_VECTOR;
                 RIGHT : INTEGER) return REAL_VECTOR is
    RESULT: REAL_VECTOR(LEFT'Range);
  begin
    for I in LEFT'Range loop
      RESULT(I) := LEFT(I) ** RIGHT;
    end loop;
    return RESULT;
  end "**";

  function "*" (LEFT, RIGHT : REAL_VECTOR) return REAL is
    RESULT: REAL := 0.0;
  begin
    if LEFT'Length /= RIGHT'Length then
      raise ARRAY_INDEX_ERROR;
    end if;
    for I in LEFT'Range loop
      RESULT := RESULT + LEFT(I) * RIGHT(RIGHT'First + (I - LEFT'First));
    end loop;
    return RESULT;
  end "*";



  -- REAL_VECTOR scaling operations -- 

  function "*" (LEFT : REAL;
                RIGHT : REAL_VECTOR) return REAL_VECTOR is
    RESULT: REAL_VECTOR(RIGHT'Range);
  begin
    for I in RIGHT'Range loop
      RESULT(I) := LEFT * RIGHT(I);
    end loop;
    return RESULT;
  end "*";

  function "*" (LEFT : REAL_VECTOR; 
                RIGHT : REAL) return REAL_VECTOR is
    RESULT: REAL_VECTOR(LEFT'Range);
  begin
    for I in LEFT'Range loop
      RESULT(I) := LEFT(I) * RIGHT;
    end loop;
    return RESULT;
  end "*";

  function "/" (LEFT : REAL_VECTOR; 
                RIGHT : REAL) return REAL_VECTOR is
    RESULT: REAL_VECTOR(LEFT'Range);
  begin
    for I in LEFT'Range loop
      RESULT(I) := LEFT(I) / RIGHT;
    end loop;
    return RESULT;
  end "/";

  -- Other REAL_VECTOR operations -- 

  function UNIT_VECTOR (INDEX : INTEGER; 
                        ORDER : POSITIVE;
                        FIRST : INTEGER := 1) return REAL_VECTOR is
    RESULT: REAL_VECTOR(FIRST..FIRST+ORDER-1);
  begin
    if (INDEX<FIRST) or (INDEX>FIRST+ORDER-1) then
      raise ARRAY_INDEX_ERROR;
    end if;

    RESULT := (others => 0.0);
    RESULT(INDEX) := 1.0;
    return RESULT;
  end UNIT_VECTOR;

-- SUBPROGRAMS for REAL_MATRIX TYPES --  

  -- REAL_MATRIX arithmetic operations --

  function "+" (RIGHT : REAL_MATRIX) return REAL_MATRIX is
    RESULT: REAL_MATRIX(RIGHT'Range(1), RIGHT'Range(2));
  begin
    for R in RIGHT'Range(1) loop
      for C in RIGHT'Range(2) loop
        RESULT(R,C) := +RIGHT(R,C);
      end loop;
    end loop;
    return RESULT;
  end "+";

  function "-" (RIGHT : REAL_MATRIX) return REAL_MATRIX is
    RESULT: REAL_MATRIX(RIGHT'Range(1), RIGHT'Range(2));
  begin
    for R in RIGHT'Range(1) loop
      for C in RIGHT'Range(2) loop
        RESULT(R,C) := -RIGHT(R,C);
      end loop;
    end loop;
    return RESULT;
  end "-";

  function "abs" (RIGHT : REAL_MATRIX) return REAL_MATRIX is
    RESULT: REAL_MATRIX(RIGHT'Range(1), RIGHT'Range(2));
  begin
    for R in RIGHT'Range(1) loop
      for C in RIGHT'Range(2) loop
        RESULT(R,C) := abs RIGHT(R,C);
      end loop;
    end loop;
    return RESULT;
  end "abs";

  function TRANSPOSE (X : REAL_MATRIX) return REAL_MATRIX is
    RESULT: REAL_MATRIX(X'Range(2), X'Range(1));
  begin
    for R in X'Range(1) loop
      for C in X'Range(2) loop
        RESULT(C,R) := X(R,C);
      end loop;
    end loop;
    return RESULT;
  end TRANSPOSE;

  function "+" (LEFT, RIGHT : REAL_MATRIX) return REAL_MATRIX is
    RESULT: REAL_MATRIX(LEFT'Range(1), LEFT'Range(2));
  begin
    if (LEFT'Length(1) /= RIGHT'Length(1)) or (LEFT'Length(2) /= RIGHT'Length(2)) then
      raise ARRAY_INDEX_ERROR;
    end if;
    for R in LEFT'Range(1) loop
      for C in LEFT'Range(2) loop
        RESULT(R,C) := LEFT(R,C) + RIGHT(RIGHT'First(1)+(R-LEFT'First(1)),RIGHT'First(2)+(C-LEFT'First(2)));
      end loop;
    end loop;
    return RESULT;
  end "+";
  
  function "-" (LEFT, RIGHT : REAL_MATRIX) return REAL_MATRIX is
    RESULT: REAL_MATRIX(LEFT'Range(1), LEFT'Range(2));
  begin
    if (LEFT'Length(1) /= RIGHT'Length(1)) or (LEFT'Length(2) /= RIGHT'Length(2)) then
      raise ARRAY_INDEX_ERROR;
    end if;
    for R in LEFT'Range(1) loop
      for C in LEFT'Range(2) loop
        RESULT(R,C) := LEFT(R,C) - RIGHT(RIGHT'First(1)+(R-LEFT'First(1)),RIGHT'First(2)+(C-LEFT'First(2)));
      end loop;
    end loop;
    return RESULT;
  end "-";
  
  function "*" (LEFT, RIGHT : REAL_MATRIX) return REAL_MATRIX is
    RESULT: REAL_MATRIX(LEFT'Range(1), RIGHT'Range(2)) :=
      (others => (others => 0.0));
  begin
    if LEFT'Length(2) /= RIGHT'Length(1) then
      raise ARRAY_INDEX_ERROR;
    end if;
    for l_row in LEFT'Range(1) loop
      for r_col in RIGHT'Range(2) loop
        for l_col in LEFT'Range(2) loop
          RESULT(l_row,r_col) := RESULT(l_row,r_col) + 
            LEFT(l_row,l_col)*RIGHT((l_col-LEFT'First(2))+RIGHT'First(1),r_col);
        end loop;
      end loop;
    end loop;
    return RESULT;
  end "*";

  function "*" (LEFT, RIGHT : REAL_VECTOR) return REAL_MATRIX is
    RESULT: REAL_MATRIX(LEFT'Range, RIGHT'Range);
  begin
    for R in LEFT'Range loop
      for C in RIGHT'Range loop
        RESULT(R,C) := LEFT(R) * RIGHT(C);
      end loop;
    end loop;
    return RESULT;
  end "*";

  function "*" (LEFT : REAL_VECTOR;
                RIGHT : REAL_MATRIX) return REAL_VECTOR is
    RESULT: REAL_VECTOR(RIGHT'Range(2)) := (others => 0.0);
  begin
    if LEFT'length /= RIGHT'length(1) then
      raise ARRAY_INDEX_ERROR;
    end if;
    for C in RIGHT'Range(2) loop
      for R in RIGHT'Range(1) loop
        RESULT(C) := (RESULT(C) + RIGHT(R,C)*LEFT(LEFT'First+(R-Right'First(1))));
      end loop;
    end loop;
    return RESULT;
  end "*";

  function "*" (LEFT : REAL_MATRIX;
                RIGHT : REAL_VECTOR) return REAL_VECTOR is
    RESULT: REAL_VECTOR(LEFT'Range(1)) := (others => 0.0);
  begin
    if LEFT'Length(2) /= RIGHT'Length then
      raise ARRAY_INDEX_ERROR;
    end if;
    for R in LEFT'Range(1) loop
      for C in LEFT'Range(2) loop
        RESULT(R) := RESULT(R) + LEFT(R,C)*RIGHT(Right'First+(C-Left'First(2)));
      end loop;
    end loop;
    return RESULT;
  end "*";

  -- REAL_MATRIX scaling operations -- 

  function "*" (LEFT : REAL;
                RIGHT : REAL_MATRIX) return REAL_MATRIX is
    RESULT: REAL_MATRIX(RIGHT'Range(1), RIGHT'Range(2));
  begin
    for R in RIGHT'Range(1) loop
      for C in RIGHT'Range(2) loop
        RESULT(R,C) := LEFT * RIGHT(R,C);
      end loop;
    end loop;
    return RESULT;
  end "*";

  function "*" (LEFT : REAL_MATRIX;
                RIGHT : REAL) return REAL_MATRIX is
    RESULT: REAL_MATRIX(LEFT'Range(1), LEFT'Range(2));
  begin
    for R in LEFT'Range(1) loop
      for C in LEFT'Range(2) loop
        RESULT(R,C) := LEFT(R,C) * RIGHT;
      end loop;
    end loop;
    return RESULT;
  end "*";


  function "/" (LEFT : REAL_MATRIX;
                RIGHT : REAL) return REAL_MATRIX is
    RESULT: REAL_MATRIX(LEFT'Range(1), LEFT'Range(2));
  begin
    for R in LEFT'Range(1) loop
      for C in LEFT'Range(2) loop
        RESULT(R,C) := LEFT(R,C) / RIGHT;
      end loop;
    end loop;
    return RESULT;
  end "/";



  -- Other REAL_MATRIX operations -- 

  function IDENTITY_MATRIX (ORDER : POSITIVE;
                            FIRST_1, FIRST_2 : INTEGER := 1) return REAL_MATRIX is
    RESULT: REAL_MATRIX(FIRST_1..FIRST_1+ORDER-1, FIRST_2..FIRST_2+ORDER-1);
  begin
    RESULT := (others => (others => 0.0));
    for I in 0..ORDER-1 loop
      RESULT(FIRST_1+I, FIRST_2+I) := 1.0;
    end loop;
    return RESULT;
  end IDENTITY_MATRIX;

end GENERIC_REAL_ARRAYS;
