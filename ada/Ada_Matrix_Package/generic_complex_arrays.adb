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
-- $FILE: generic_complex_arrays.adb
-- $LAST_MODIFIED: 11/20/96
-- $AUTHORS: Chris Papademetrious, Xiaoxun Zhu, Moshe Kam
--


package body GENERIC_COMPLEX_ARRAYS is

-- SUBPROGRAMS for COMPLEX_VECTOR types -- 

  COMPLEX_ZERO: constant COMPLEX := COMPOSE_FROM_CARTESIAN(0.0, 0.0);
  COMPLEX_UNITY: constant COMPLEX := COMPOSE_FROM_CARTESIAN(1.0, 0.0);

  -- COMPLEX_VECTOR selection, conversion and composition operations --

  function RE (X : COMPLEX_VECTOR) return REAL_VECTOR is
    RESULT: REAL_VECTOR(X'Range);
  begin
    for I in X'Range loop
      RESULT(I) := Re(X(I));
    end loop;
    return RESULT;
  end RE;

  function IM (X : COMPLEX_VECTOR) return REAL_VECTOR is
    RESULT: REAL_VECTOR(X'Range);
  begin
    for I in X'Range loop
      RESULT(I) := Im(X(I));
    end loop;
    return RESULT;
  end IM;

  procedure SET_RE (X : in out COMPLEX_VECTOR; RE : in REAL_VECTOR) is
  begin
    if X'Length /= RE'Length then
      raise ARRAY_INDEX_ERROR;
    end if;
    for I in X'Range loop
      SET_RE(X(I), RE((I-X'First)+RE'First));
    end loop;
  end SET_RE;

  procedure SET_IM (X : in out COMPLEX_VECTOR; IM : in REAL_VECTOR) is
  begin
    if X'Length /= IM'Length then
      raise ARRAY_INDEX_ERROR;
    end if;
    for I in X'Range loop
      SET_IM(X(I), IM((I-X'First)+IM'First));
    end loop;
  end SET_IM;

  function COMPOSE_FROM_CARTESIAN (RE : REAL_VECTOR) return COMPLEX_VECTOR is
    RESULT: COMPLEX_VECTOR(RE'Range);
  begin
    for I in RE'Range loop
      RESULT(I) := COMPOSE_FROM_CARTESIAN(RE(I), 0.0);
    end loop;
    return RESULT;
  end COMPOSE_FROM_CARTESIAN;
  
  function COMPOSE_FROM_CARTESIAN (RE, IM : REAL_VECTOR) return COMPLEX_VECTOR is
    RESULT: COMPLEX_VECTOR(RE'Range);
  begin
    if RE'Length /= IM'Length then
      raise ARRAY_INDEX_ERROR;
    end if;
    for I in RE'Range loop
      RESULT(I) := COMPOSE_FROM_CARTESIAN(RE(I), IM((I-RE'First)+IM'First));
    end loop;
    return RESULT;
  end COMPOSE_FROM_CARTESIAN;
  
  function MODULUS (X : COMPLEX_VECTOR) return REAL_VECTOR is
    RESULT: REAL_VECTOR(X'Range);
  begin
    for I in X'Range loop
      RESULT(I) := Modulus(X(I));
    end loop;
    return RESULT;
  end MODULUS;  

  function ARGUMENT (X : COMPLEX_VECTOR) return REAL_VECTOR is
    RESULT: REAL_VECTOR(X'Range);
  begin
    for I in X'Range loop
      RESULT(I) := Argument(X(I));
    end loop;
    return RESULT;
  end ARGUMENT;
  
  function ARGUMENT (X : COMPLEX_VECTOR; CYCLE : REAL) return REAL_VECTOR is
    RESULT: REAL_VECTOR(X'Range);
  begin
    for I in X'Range loop
      RESULT(I) := Argument(X(I), CYCLE);
    end loop;
    return RESULT;
  end ARGUMENT;

  function COMPOSE_FROM_POLAR (MODULUS, ARGUMENT : REAL_VECTOR) return COMPLEX_VECTOR is
    RESULT: COMPLEX_VECTOR(MODULUS'Range);
  begin
    if MODULUS'Length /= ARGUMENT'Length then
      raise ARRAY_INDEX_ERROR;
    end if;
    for I in MODULUS'Range loop
      RESULT(I) := Compose_From_Polar(MODULUS(I),
         ARGUMENT((I-MODULUS'First)+ARGUMENT'First));
    end loop;
    return RESULT;
  end COMPOSE_FROM_POLAR;

  function COMPOSE_FROM_POLAR (MODULUS, ARGUMENT : REAL_VECTOR; CYCLE : REAL) return COMPLEX_VECTOR is
    RESULT: COMPLEX_VECTOR(MODULUS'Range);
  begin
    if MODULUS'Length /= ARGUMENT'Length then
      raise ARRAY_INDEX_ERROR;
    end if;
    for I in MODULUS'Range loop
      RESULT(I) := Compose_From_Polar(MODULUS(I),
         ARGUMENT((I-MODULUS'First)+ARGUMENT'First), CYCLE);
    end loop;
    return RESULT;
  end COMPOSE_FROM_POLAR;

  -- COMPLEX_VECTOR arithmetic operations --

  function "+" (RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR is
  begin
    return RIGHT;
  end "+";

  function "-" (RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR is
    RESULT: COMPLEX_VECTOR(RIGHT'Range);
  begin
    for I in RIGHT'Range loop
      RESULT(I) := -RIGHT(I);
    end loop;
    return RESULT;
  end "-";

  function CONJUGATE (X : COMPLEX_VECTOR) return COMPLEX_VECTOR is
    RESULT: COMPLEX_VECTOR(X'Range);
  begin
    for I in X'Range loop
      RESULT(I) := Conjugate(X(I));
    end loop;
    return RESULT;
  end CONJUGATE;

  function "+" (LEFT, RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR is
    RESULT: COMPLEX_VECTOR(LEFT'Range);
  begin
    if LEFT'Length /= RIGHT'Length then
      raise ARRAY_INDEX_ERROR;
    end if;
    for I in LEFT'Range loop
      RESULT(I) := LEFT(I) + RIGHT(RIGHT'First + (I - LEFT'First));
    end loop;
    return RESULT;
  end "+";

  function "-" (LEFT, RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR is
    RESULT: COMPLEX_VECTOR(LEFT'Range);
  begin
    if LEFT'Length /= RIGHT'Length then
      raise ARRAY_INDEX_ERROR;
    end if;
    for I in LEFT'Range loop
      RESULT(I) := LEFT(I) - RIGHT(RIGHT'First + (I - LEFT'First));
    end loop;
    return RESULT;
  end "-";

  function "*" (LEFT, RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR is
    RESULT: COMPLEX_VECTOR(LEFT'Range);
  begin
    for I in LEFT'Range loop
    if LEFT'Length /= RIGHT'Length then
      raise ARRAY_INDEX_ERROR;
    end if;
      RESULT(I) := LEFT(I) * RIGHT(RIGHT'First + (I - LEFT'First));
    end loop;
    return RESULT;
  end "*";

  function "/" (LEFT, RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR is
    RESULT: COMPLEX_VECTOR(LEFT'Range);
  begin
    if LEFT'Length /= RIGHT'Length then
      raise ARRAY_INDEX_ERROR;
    end if;
    for I in LEFT'Range loop
      RESULT(I) := LEFT(I) / RIGHT(RIGHT'First + (I - LEFT'First));
    end loop;
    return RESULT;
  end "/";

  function "**" (LEFT : COMPLEX_VECTOR; RIGHT : INTEGER) return COMPLEX_VECTOR is
    RESULT: COMPLEX_VECTOR(LEFT'Range);
  begin
    for I in LEFT'Range loop
      RESULT(I) := LEFT(I) ** RIGHT;
    end loop;
    return RESULT;
  end "**";

  function "*" (LEFT, RIGHT : COMPLEX_VECTOR) return COMPLEX is
    RESULT: COMPLEX := COMPLEX_ZERO;
  begin
    if LEFT'Length /= RIGHT'Length then
      raise ARRAY_INDEX_ERROR;
    end if;
    for I in LEFT'Range loop
      RESULT := RESULT + LEFT(I) * RIGHT(RIGHT'First + (I - LEFT'First));
    end loop;
    return RESULT;
  end "*";

  -- Mixed REAL_VECTOR and COMPLEX_VECTOR arithmetic operations --

  function "+" (LEFT : REAL_VECTOR; RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR is
    RESULT: COMPLEX_VECTOR(LEFT'Range);
  begin
    if LEFT'Length /= RIGHT'Length then
      raise ARRAY_INDEX_ERROR;
    end if;
    for I in LEFT'Range loop
      RESULT(I) := LEFT(I) + RIGHT(RIGHT'First + (I - LEFT'First));
    end loop;
    return RESULT;
  end "+";

  function "+" (LEFT : COMPLEX_VECTOR; RIGHT : REAL_VECTOR) return COMPLEX_VECTOR is
    RESULT: COMPLEX_VECTOR(LEFT'Range);
  begin
    if LEFT'Length /= RIGHT'Length then
      raise ARRAY_INDEX_ERROR;
    end if;
    for I in LEFT'Range loop
      RESULT(I) := RIGHT(RIGHT'First + (I - LEFT'First)) + LEFT(I);
    end loop;
    return RESULT;
  end "+";

  function "-" (LEFT : REAL_VECTOR; RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR is
    RESULT: COMPLEX_VECTOR(LEFT'Range);
  begin
    if LEFT'Length /= RIGHT'Length then
      raise ARRAY_INDEX_ERROR;
    end if;
    for I in LEFT'Range loop
      RESULT(I) := LEFT(I) - RIGHT(RIGHT'First + (I - LEFT'First));
    end loop;
    return RESULT;
  end "-";

  function "-" (LEFT : COMPLEX_VECTOR; RIGHT : REAL_VECTOR) return COMPLEX_VECTOR is
    RESULT: COMPLEX_VECTOR(LEFT'Range);
  begin
    if LEFT'Length /= RIGHT'Length then
      raise ARRAY_INDEX_ERROR;
    end if;
    for I in LEFT'Range loop
      RESULT(I) := -RIGHT(RIGHT'First + (I - LEFT'First)) + LEFT(I);
    end loop;
    return RESULT;
  end "-";

  function "*" (LEFT : REAL_VECTOR; RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR is
    RESULT: COMPLEX_VECTOR(LEFT'Range);
  begin
    if LEFT'Length /= RIGHT'Length then
      raise ARRAY_INDEX_ERROR;
    end if;
    for I in LEFT'Range loop
      RESULT(I) := LEFT(I) * RIGHT(RIGHT'First + (I - LEFT'First));
    end loop;
    return RESULT;
  end "*";

  function "*" (LEFT : COMPLEX_VECTOR; RIGHT : REAL_VECTOR) return COMPLEX_VECTOR is
    RESULT: COMPLEX_VECTOR(LEFT'Range);
  begin
    if LEFT'Length /= RIGHT'Length then
      raise ARRAY_INDEX_ERROR;
    end if;
    for I in LEFT'Range loop
      RESULT(I) := RIGHT(RIGHT'First + (I - LEFT'First)) * LEFT(I);
    end loop;
    return RESULT;
  end "*";

  function "/" (LEFT : REAL_VECTOR; RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR is
    RESULT: COMPLEX_VECTOR(LEFT'Range);
  begin
    if LEFT'Length /= RIGHT'Length then
      raise ARRAY_INDEX_ERROR;
    end if;
    for I in LEFT'Range loop
      RESULT(I) := LEFT(I) / RIGHT(RIGHT'First + (I - LEFT'First));
    end loop;
    return RESULT;
  end "/";

  function "/" (LEFT : COMPLEX_VECTOR; RIGHT : REAL_VECTOR) return COMPLEX_VECTOR is
    RESULT: COMPLEX_VECTOR(LEFT'Range);
  begin
    if LEFT'Length /= RIGHT'Length then
      raise ARRAY_INDEX_ERROR;
    end if;
    for I in LEFT'Range loop
      RESULT(I) := LEFT(I) / RIGHT(RIGHT'First + (I - LEFT'First));
    end loop;
    return RESULT;
  end "/";

  function "*" (LEFT : REAL_VECTOR; RIGHT : COMPLEX_VECTOR) return COMPLEX is
    RESULT: COMPLEX := COMPLEX_ZERO;
  begin
    if LEFT'Length /= RIGHT'Length then
      raise ARRAY_INDEX_ERROR;
    end if;
    for I in LEFT'Range loop
      RESULT := RESULT + LEFT(I) * RIGHT(RIGHT'First + (I - LEFT'First));
    end loop;
    return RESULT;
  end "*";

  function "*" (LEFT : COMPLEX_VECTOR; RIGHT : REAL_VECTOR) return COMPLEX is
    RESULT: COMPLEX := COMPLEX_ZERO;
  begin
    if LEFT'Length /= RIGHT'Length then
      raise ARRAY_INDEX_ERROR;
    end if;
    for I in LEFT'Range loop
      RESULT := RESULT + RIGHT(RIGHT'First + (I - LEFT'First)) * LEFT(I);
    end loop;
    return RESULT;
  end "*";

  -- COMPLEX_VECTOR scaling operations -- 

  function "*" (LEFT : COMPLEX; RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR is
    RESULT: COMPLEX_VECTOR(RIGHT'Range);
  begin
    for I in RIGHT'Range loop
      RESULT(I) := LEFT * RIGHT(I);
    end loop;
    return RESULT;
  end "*";

  function "*" (LEFT : COMPLEX_VECTOR; RIGHT : COMPLEX) return COMPLEX_VECTOR is
    RESULT: COMPLEX_VECTOR(LEFT'Range);
  begin
    for I in LEFT'Range loop
      RESULT(I) := LEFT(I) * RIGHT;
    end loop;
    return RESULT;
  end "*";

  function "/" (LEFT : COMPLEX_VECTOR; RIGHT : COMPLEX) return COMPLEX_VECTOR is
    RESULT: COMPLEX_VECTOR(LEFT'Range);
  begin
    for I in LEFT'Range loop
      RESULT(I) := LEFT(I) / RIGHT;
    end loop;
    return RESULT;
  end "/";

  function "*" (LEFT : REAL; RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR is
    RESULT: COMPLEX_VECTOR(RIGHT'Range);
  begin
    for I in RIGHT'Range loop
      RESULT(I) := LEFT * RIGHT(I);
    end loop;
    return RESULT;
  end "*";

  function "*" (LEFT : COMPLEX_VECTOR; RIGHT : REAL) return COMPLEX_VECTOR is
    RESULT: COMPLEX_VECTOR(LEFT'Range);
  begin
    for I in LEFT'Range loop
      RESULT(I) := RIGHT * LEFT(I);
    end loop;
    return RESULT;
  end "*";

  function "/" (LEFT : COMPLEX_VECTOR; RIGHT : REAL) return COMPLEX_VECTOR is
    RESULT: COMPLEX_VECTOR(LEFT'Range);
  begin
    for I in LEFT'Range loop
      RESULT(I) := LEFT(I) / RIGHT;
    end loop;
    return RESULT;
  end "/";


  -- Other COMPLEX_VECTOR operations -- 

  function UNIT_VECTOR (INDEX : INTEGER; ORDER : POSITIVE; FIRST : INTEGER := 1) return COMPLEX_VECTOR is
    RESULT: COMPLEX_VECTOR(FIRST..FIRST+ORDER-1);
  begin
    if (INDEX<FIRST) or (INDEX>FIRST+ORDER-1) then
      raise ARRAY_INDEX_ERROR;
    end if;

    RESULT := (others => COMPLEX_ZERO);
    RESULT(INDEX) := COMPLEX_UNITY;
    return RESULT;
  end UNIT_VECTOR;

-- SUBPROGRAMS for COMPLEX_MATRIX TYPES --

  -- COMPLEX_MATRIX selection, conversion and composition operations -- 

  function RE (X : COMPLEX_MATRIX) return REAL_MATRIX is
    RESULT: REAL_MATRIX(X'Range(1), X'Range(2));
  begin
    for R in X'Range(1) loop
      for C in X'Range(2) loop
        RESULT(R,C) := Re(X(R,C));
      end loop;
    end loop;
    return RESULT;
  end RE;

  function IM (X : COMPLEX_MATRIX) return REAL_MATRIX is
    RESULT: REAL_MATRIX(X'Range(1), X'Range(2));
  begin
    for R in X'Range(1) loop
      for C in X'Range(2) loop
        RESULT(R,C) := Im(X(R,C));
      end loop;
    end loop;
    return RESULT;
  end IM;

  procedure SET_RE (X : in out COMPLEX_MATRIX; RE : in REAL_MATRIX) is
  begin
    if (X'Length(1) /= RE'Length(1)) or (X'Length(2) /= RE'Length(2)) then
      raise ARRAY_INDEX_ERROR;
    end if;
    for R in X'Range(1) loop
      for C in X'Range(2) loop
        SET_RE(X(R,C), RE((R-X'First(1))+RE'First(1),(C-X'First(2))+RE'First(2)));
      end loop;
    end loop;
  end SET_RE;

  procedure SET_IM (X : in out COMPLEX_MATRIX; IM : in REAL_MATRIX) is
  begin
    if (X'Length(1) /= IM'Length(1)) or (X'Length(2) /= IM'Length(2)) then
      raise ARRAY_INDEX_ERROR;
    end if;
    for R in X'Range(1) loop
      for C in X'Range(2) loop
        SET_IM(X(R,C), IM((R-X'First(1))+IM'First(1),(C-X'First(2))+IM'First(2)));
      end loop;
    end loop;
  end SET_IM;

  function COMPOSE_FROM_CARTESIAN (RE : REAL_MATRIX) return COMPLEX_MATRIX is
    RESULT: COMPLEX_MATRIX(RE'Range(1), RE'Range(2));
  begin
    for R in RE'Range(1) loop
      for C in RE'Range(2) loop
        RESULT(R,C) := COMPOSE_FROM_CARTESIAN(RE(R,C), 0.0);
      end loop;
    end loop;
    return RESULT;
  end COMPOSE_FROM_CARTESIAN;

  function COMPOSE_FROM_CARTESIAN (RE, IM : REAL_MATRIX) return COMPLEX_MATRIX is
    RESULT: COMPLEX_MATRIX(RE'Range(1), RE'Range(2));
  begin
    if (RE'Length(1) /= IM'Length(1)) or (RE'Length(2) /= IM'Length(2)) then
      raise ARRAY_INDEX_ERROR;
    end if;
    for R in RE'Range(1) loop
      for C in RE'Range(2) loop
        RESULT(R,C) := COMPOSE_FROM_CARTESIAN(RE(R,C), IM((R-RE'First(1))+IM'First(1),(C-RE'First(2))+IM'First(2)));
      end loop;
    end loop;
    return RESULT;
  end COMPOSE_FROM_CARTESIAN;

  function MODULUS (X : COMPLEX_MATRIX) return REAL_MATRIX is
    RESULT: REAL_MATRIX(X'Range(1), X'Range(2));
  begin
    for R in X'Range(1) loop
      for C in X'Range(2) loop
        RESULT(R,C) := Modulus(X(R,C));
      end loop;
    end loop;
    return RESULT;
  end MODULUS;

  function ARGUMENT (X : COMPLEX_MATRIX) return REAL_MATRIX is
    RESULT: REAL_MATRIX(X'Range(1), X'Range(2));
  begin
    for R in X'Range(1) loop
      for C in X'Range(2) loop
        RESULT(R,C) := Argument(X(R,C));
      end loop;
    end loop;
    return RESULT;
  end ARGUMENT;

  function ARGUMENT (X : COMPLEX_MATRIX; CYCLE : REAL) return REAL_MATRIX is
    RESULT: REAL_MATRIX(X'Range(1), X'Range(2));
  begin
    for R in X'Range(1) loop
      for C in X'Range(2) loop
        RESULT(R,C) := Argument(X(R,C), CYCLE);
      end loop;
    end loop;
    return RESULT;
  end ARGUMENT;

  function COMPOSE_FROM_POLAR (MODULUS, ARGUMENT : REAL_MATRIX) return COMPLEX_MATRIX is
    RESULT: COMPLEX_MATRIX(MODULUS'Range(1), MODULUS'Range(2));
  begin
    if (MODULUS'Length(1) /= ARGUMENT'Length(1)) or (MODULUS'Length(2) /= ARGUMENT'Length(2)) then
      raise ARRAY_INDEX_ERROR;
    end if;
    for R in MODULUS'Range(1) loop
      for C in MODULUS'Range(2) loop
        RESULT(R,C) := Compose_From_Polar(MODULUS(R,C),
           ARGUMENT((R-MODULUS'First(1))+ARGUMENT'First(1),
                    (C-MODULUS'First(2))+ARGUMENT'First(2)));
      end loop;
    end loop;
    return RESULT;
  end COMPOSE_FROM_POLAR;

  function COMPOSE_FROM_POLAR (MODULUS, ARGUMENT : REAL_MATRIX; CYCLE : REAL) return COMPLEX_MATRIX is
    RESULT: COMPLEX_MATRIX(MODULUS'Range(1), MODULUS'Range(2));
  begin
    if (MODULUS'Length(1) /= ARGUMENT'Length(1)) or (MODULUS'Length(2) /= ARGUMENT'Length(2)) then
      raise ARRAY_INDEX_ERROR;
    end if;
    for R in MODULUS'Range(1) loop
      for C in MODULUS'Range(2) loop
        RESULT(R,C) := Compose_From_Polar(MODULUS(R,C),
           ARGUMENT((R-MODULUS'First(1))+ARGUMENT'First(1),
                    (C-MODULUS'First(2))+ARGUMENT'First(2)),
           CYCLE);
      end loop;
    end loop;
    return RESULT;
  end COMPOSE_FROM_POLAR;


  -- COMPLEX_MATRIX arithmetic operations --

  function "+" (RIGHT : COMPLEX_MATRIX) return COMPLEX_MATRIX is
  begin
    return RIGHT;
  end "+";

  function "-" (RIGHT : COMPLEX_MATRIX) return COMPLEX_MATRIX is
    RESULT: COMPLEX_MATRIX(RIGHT'Range(1), RIGHT'Range(2));
  begin
    for R in RIGHT'Range(1) loop
      for C in RIGHT'Range(2) loop
        RESULT(R,C) := -RIGHT(R,C);
      end loop;
    end loop;
    return RESULT;
  end "-";

  function CONJUGATE (X : COMPLEX_MATRIX) return COMPLEX_MATRIX is
    RESULT: COMPLEX_MATRIX(X'Range(1), X'Range(2));
  begin
    for R in X'Range(1) loop
      for C in X'Range(2) loop
        RESULT(R,C) := Conjugate(X(R,C));
      end loop;
    end loop;
    return RESULT;
  end CONJUGATE;

  function TRANSPOSE (X : COMPLEX_MATRIX) return COMPLEX_MATRIX is
    RESULT: COMPLEX_MATRIX(X'Range(2), X'Range(1));
  begin
    for R in X'Range(1) loop
      for C in X'Range(2) loop
        RESULT(C,R) := X(R,C);
      end loop;
    end loop;
    return RESULT;
  end TRANSPOSE;

  function "+" (LEFT, RIGHT : COMPLEX_MATRIX) return COMPLEX_MATRIX is
    RESULT: COMPLEX_MATRIX(LEFT'Range(1), LEFT'Range(2));
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

  function "-" (LEFT, RIGHT : COMPLEX_MATRIX) return COMPLEX_MATRIX is
    RESULT: COMPLEX_MATRIX(LEFT'Range(1), LEFT'Range(2));
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

  function "*" (LEFT, RIGHT : COMPLEX_MATRIX) return COMPLEX_MATRIX is
    RESULT: COMPLEX_MATRIX(LEFT'Range(1), RIGHT'Range(2)) :=
      (others => (others => COMPLEX_ZERO));
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

  function "*" (LEFT, RIGHT : COMPLEX_VECTOR) return COMPLEX_MATRIX is
    RESULT: COMPLEX_MATRIX(LEFT'Range, RIGHT'Range);
  begin
    if LEFT'Length /= RIGHT'Length then
      raise ARRAY_INDEX_ERROR;
    end if;
    for R in LEFT'Range loop
      for C in RIGHT'Range loop
        RESULT(R,C) := LEFT(R) * RIGHT(C);
      end loop;
    end loop;
    return RESULT;
  end "*";

  function "*" (LEFT : COMPLEX_VECTOR; RIGHT : COMPLEX_MATRIX) return COMPLEX_VECTOR is
    RESULT: COMPLEX_VECTOR(RIGHT'Range(2)) := (others => COMPLEX_ZERO);
  begin
    if LEFT'length /= RIGHT'length(1) then
      raise ARRAY_INDEX_ERROR;
    end if;
    for C in RIGHT'Range(2) loop
      for R in RIGHT'Range(1) loop
        RESULT(C) := (RESULT(C) + RIGHT(R,C)*LEFT((R-RIGHT'First(1))+LEFT'First));
      end loop;
    end loop;
    return RESULT;
  end "*";

  function "*" (LEFT : COMPLEX_MATRIX; RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR is
    RESULT: COMPLEX_VECTOR(LEFT'Range(1)) := (others => COMPLEX_ZERO);
  begin
    if LEFT'Length(2) /= RIGHT'Length then
      raise ARRAY_INDEX_ERROR;
    end if;
    for R in LEFT'Range(1) loop
      for C in LEFT'Range(2) loop
        RESULT(R) := RESULT(R) + LEFT(R,C)*RIGHT((C-LEFT'First(2))+RIGHT'First);
      end loop;
    end loop;
    return RESULT;
  end "*";

  -- Mixed REAL_MATRIX and COMPLEX_MATRIX arithmetic operations -- 

  function "+" (LEFT : REAL_MATRIX; RIGHT : COMPLEX_MATRIX) return COMPLEX_MATRIX is
    RESULT: COMPLEX_MATRIX(LEFT'Range(1), LEFT'Range(2));
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

  function "+" (LEFT : COMPLEX_MATRIX; RIGHT : REAL_MATRIX) return COMPLEX_MATRIX is
    RESULT: COMPLEX_MATRIX(LEFT'Range(1), LEFT'Range(2));
  begin
    if (LEFT'Length(1) /= RIGHT'Length(1)) or (LEFT'Length(2) /= RIGHT'Length(2)) then
      raise ARRAY_INDEX_ERROR;
    end if;
    for R in LEFT'Range(1) loop
      for C in LEFT'Range(2) loop
        RESULT(R,C) := RIGHT(RIGHT'First(1)+(R-LEFT'First(1)),RIGHT'First(2)+(C-LEFT'First(2))) + LEFT(R,C);
      end loop;
    end loop;
    return RESULT;
  end "+";

  function "-" (LEFT : REAL_MATRIX; RIGHT : COMPLEX_MATRIX) return COMPLEX_MATRIX is
    RESULT: COMPLEX_MATRIX(LEFT'Range(1), LEFT'Range(2));
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

  function "-" (LEFT : COMPLEX_MATRIX; RIGHT : REAL_MATRIX) return COMPLEX_MATRIX is
    RESULT: COMPLEX_MATRIX(LEFT'Range(1), LEFT'Range(2));
  begin
    if (LEFT'Length(1) /= RIGHT'Length(1)) or (LEFT'Length(2) /= RIGHT'Length(2)) then
      raise ARRAY_INDEX_ERROR;
    end if;
    for R in LEFT'Range(1) loop
      for C in LEFT'Range(2) loop
        RESULT(R,C) := (-RIGHT(RIGHT'First(1)+(R-LEFT'First(1)),RIGHT'First(2)+(C-LEFT'First(2)))) + LEFT(R,C);
      end loop;
    end loop;
    return RESULT;
  end "-";

  function "*" (LEFT : REAL_MATRIX; RIGHT : COMPLEX_MATRIX) return COMPLEX_MATRIX is
    RESULT: COMPLEX_MATRIX(LEFT'Range(1), RIGHT'Range(2)) :=
      (others => (others => COMPLEX_ZERO));
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

  function "*" (LEFT : COMPLEX_MATRIX; RIGHT : REAL_MATRIX) return COMPLEX_MATRIX is
    RESULT: COMPLEX_MATRIX(LEFT'Range(1), RIGHT'Range(2)) :=
      (others => (others => COMPLEX_ZERO));
  begin
    if LEFT'Length(2) /= RIGHT'Length(1) then
      raise ARRAY_INDEX_ERROR;
    end if;
    for l_row in LEFT'Range(1) loop
      for r_col in RIGHT'Range(2) loop
        for l_col in LEFT'Range(2) loop
          RESULT(l_row,r_col) := RESULT(l_row,r_col) +
            RIGHT((l_col-LEFT'First(2))+RIGHT'First(1),r_col)*LEFT(l_row,l_col);
        end loop;
      end loop;
    end loop;
    return RESULT;
  end "*";

  function "*" (LEFT : REAL_VECTOR; RIGHT : COMPLEX_VECTOR) return COMPLEX_MATRIX is
    RESULT: COMPLEX_MATRIX(LEFT'Range, RIGHT'Range);
  begin
    for R in LEFT'Range loop
      for C in RIGHT'Range loop
        RESULT(R,C) := LEFT(R) * RIGHT(C);
      end loop;
    end loop;
    return RESULT;
  end "*";

  function "*" (LEFT : COMPLEX_VECTOR; RIGHT : REAL_VECTOR) return COMPLEX_MATRIX is
    RESULT: COMPLEX_MATRIX(LEFT'Range, RIGHT'Range);
  begin
    for R in LEFT'Range loop
      for C in RIGHT'Range loop
        RESULT(R,C) := RIGHT(C) * LEFT(R);
      end loop;
    end loop;
    return RESULT;
  end "*";

  function "*" (LEFT : REAL_VECTOR; RIGHT : COMPLEX_MATRIX) return COMPLEX_VECTOR is
    RESULT: COMPLEX_VECTOR(RIGHT'Range(2)) := (others => COMPLEX_ZERO);
  begin
    if LEFT'length /= RIGHT'length(1) then
      raise ARRAY_INDEX_ERROR;
    end if;
    for C in RIGHT'Range(2) loop
      for R in RIGHT'Range(1) loop
        RESULT(C) := RESULT(C) + LEFT((R-RIGHT'First(1))+LEFT'First)*RIGHT(R,C);
      end loop;
    end loop;
    return RESULT;
  end "*";

  function "*" (LEFT : COMPLEX_VECTOR; RIGHT : REAL_MATRIX) return COMPLEX_VECTOR is
    RESULT: COMPLEX_VECTOR(RIGHT'Range(2)) := (others => COMPLEX_ZERO);
  begin
    if LEFT'length /= RIGHT'length(1) then
      raise ARRAY_INDEX_ERROR;
    end if;
    for C in RIGHT'Range(2) loop
      for R in RIGHT'Range(1) loop
        RESULT(C) := RESULT(C) + RIGHT(R,C)*LEFT((R-RIGHT'First(1))+LEFT'First);
      end loop;
    end loop;
    return RESULT;
  end "*";

  function "*" (LEFT : REAL_MATRIX; RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR is
    RESULT: COMPLEX_VECTOR(LEFT'Range(1)) := (others => COMPLEX_ZERO);
  begin
    if LEFT'Length(2) /= RIGHT'Length then
      raise ARRAY_INDEX_ERROR;
    end if;
    for R in LEFT'Range(1) loop
      for C in LEFT'Range(2) loop
        RESULT(R) := RESULT(R) + LEFT(R,C)*RIGHT((C-LEFT'First(2))+RIGHT'First);
      end loop;
    end loop;
    return RESULT;
  end "*";

  function "*" (LEFT : COMPLEX_MATRIX; RIGHT : REAL_VECTOR) return COMPLEX_VECTOR is
    RESULT: COMPLEX_VECTOR(LEFT'Range(1)) := (others => COMPLEX_ZERO);
  begin
    if LEFT'Length(2) /= RIGHT'Length then
      raise ARRAY_INDEX_ERROR;
    end if;
    for R in LEFT'Range(1) loop
      for C in LEFT'Range(2) loop
        RESULT(R) := RESULT(R) + RIGHT((C-LEFT'First(2))+RIGHT'First)*LEFT(R,C);
      end loop;
    end loop;
    return RESULT;
  end "*";


  -- COMPLEX_MATRIX scaling operations -- 

  function "*" (LEFT : COMPLEX; RIGHT : COMPLEX_MATRIX) return COMPLEX_MATRIX is
    RESULT: COMPLEX_MATRIX(RIGHT'Range(1), RIGHT'Range(2));
  begin
    for R in RIGHT'Range(1) loop
      for C in RIGHT'Range(2) loop
        RESULT(R,C) := LEFT * RIGHT(R,C);
      end loop;
    end loop;
    return RESULT;
  end "*";

  function "*" (LEFT : COMPLEX_MATRIX; RIGHT : COMPLEX) return COMPLEX_MATRIX is
    RESULT: COMPLEX_MATRIX(LEFT'Range(1), LEFT'Range(2));
  begin
    for R in LEFT'Range(1) loop
      for C in LEFT'Range(2) loop
        RESULT(R,C) := LEFT(R,C) * RIGHT;
      end loop;
    end loop;
    return RESULT;
  end "*";

  function "/" (LEFT : COMPLEX_MATRIX; RIGHT : COMPLEX) return COMPLEX_MATRIX is
    RESULT: COMPLEX_MATRIX(LEFT'Range(1), LEFT'Range(2));
  begin
    for R in LEFT'Range(1) loop
      for C in LEFT'Range(2) loop
        RESULT(R,C) := LEFT(R,C) / RIGHT;
      end loop;
    end loop;
    return RESULT;
  end "/";

  function "*" (LEFT : REAL; RIGHT : COMPLEX_MATRIX) return COMPLEX_MATRIX is
    RESULT: COMPLEX_MATRIX(RIGHT'Range(1), RIGHT'Range(2));
  begin
    for R in RIGHT'Range(1) loop
      for C in RIGHT'Range(2) loop
        RESULT(R,C) := LEFT * RIGHT(R,C);
      end loop;
    end loop;
    return RESULT;
  end "*";

  function "*" (LEFT : COMPLEX_MATRIX; RIGHT : REAL) return COMPLEX_MATRIX is
    RESULT: COMPLEX_MATRIX(LEFT'Range(1), LEFT'Range(2));
  begin
    for R in LEFT'Range(1) loop
      for C in LEFT'Range(2) loop
        RESULT(R,C) := RIGHT * LEFT(R,C);
      end loop;
    end loop;
    return RESULT;
  end "*";

  function "/" (LEFT : COMPLEX_MATRIX; RIGHT : REAL) return COMPLEX_MATRIX is
    RESULT: COMPLEX_MATRIX(LEFT'Range(1), LEFT'Range(2));
  begin
    for R in LEFT'Range(1) loop
      for C in LEFT'Range(2) loop
        RESULT(R,C) := LEFT(R,C) / RIGHT;
      end loop;
    end loop;
    return RESULT;
  end "/";


  -- Other COMPLEX_MATRIX operations -- 

  function IDENTITY_MATRIX (ORDER : POSITIVE; FIRST_1, FIRST_2 : INTEGER := 1) return COMPLEX_MATRIX is
    RESULT: COMPLEX_MATRIX(FIRST_1..FIRST_1+ORDER-1, FIRST_2..FIRST_2+ORDER-1);
  begin
    RESULT := (others => (others => COMPLEX_ZERO));
    for I in 0..ORDER-1 loop
      RESULT(FIRST_1+I, FIRST_2+I) := COMPLEX_UNITY;
    end loop;
    return RESULT;
  end IDENTITY_MATRIX;

end GENERIC_COMPLEX_ARRAYS;
