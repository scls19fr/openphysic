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
-- $FILE: generic_complex_arrays-operations.adb
-- $LAST_MODIFIED: 11/20/96
-- $AUTHORS: Chris Papademetrious, Xiaoxun Zhu, Moshe Kam
--

with Ada.Unchecked_Deallocation;

package body Generic_Complex_Arrays.Operations is

  Complex_Zero: constant COMPLEX := COMPOSE_FROM_CARTESIAN(0.0, 0.0);
  Complex_Unity: constant COMPLEX := COMPOSE_FROM_CARTESIAN(1.0, 0.0);

  procedure Free_Matrix is new Ada.Unchecked_Deallocation(Complex_Matrix, Complex_Matrix_Ptr);


  procedure Free_Vector is new Ada.Unchecked_Deallocation(Complex_Vector, Complex_Vector_Ptr);


  function Create_Vector(First, last: in Integer) return Complex_Vector_Ptr is
  begin
    return new Complex_Vector(First..Last);
  end Create_Vector;


  function Create_Vector(First, Last: in Integer;
                         default_value: in Complex)
    return Complex_Vector_Ptr is
    Result: Complex_Vector_Ptr;
  begin
    Result := Create_Vector(First, Last);
    Result.all := (others => Default_Value);
    return Result;
  end Create_Vector;

 
  function Create_Matrix(First_Row, First_Col,
                         Last_Row, Last_Col: in Integer)
    return Complex_Matrix_Ptr is
  begin
    return new Complex_Matrix(First_Row..Last_Row, First_Col..Last_Col);
  end Create_Matrix;


  function Create_Matrix(First_Row, First_Col,
                         Last_Row, Last_Col: in Integer;
                         Default_Value: in Complex) return Complex_Matrix_Ptr is
    Result: Complex_Matrix_Ptr;
  begin    
    Result := Create_Matrix(First_Row, First_Col, Last_Row, Last_Col);
    Result.all := (others => (others => Default_Value));
    return Result;
  end Create_Matrix;


  function Create_Matrix(First, Last: in Integer) return Complex_Matrix_Ptr is
    Result: Complex_Matrix_Ptr;
  begin
    return Create_Matrix(First, First, Last,Last);
  end Create_Matrix;


  function Create_Matrix(First, Last: in Integer;
                         Default_Value: in Complex) return Complex_Matrix_Ptr is
    Result: Complex_Matrix_Ptr;
  begin
    return Create_Matrix(First, First, Last, Last, Default_Value);
  end Create_Matrix;


  procedure Destroy_Vector(X: in out Complex_Vector_Ptr) is
  begin
    Free_Vector(X);
  end Destroy_Vector;


  procedure Destroy_Matrix(X: in out Complex_Matrix_Ptr) is
  begin
    Free_Matrix(X);
  end Destroy_Matrix;


  function Row(X: in Complex_Matrix;
               Row: in Integer) return Complex_Vector is
    Result: Complex_Vector(X'Range(2));
  begin
    for I in X'Range(2) loop
      Result(I) := X(Row, I);
    end loop;
    return Result;
  end Row;


  function Column(X: in Complex_Matrix;
                  Col: in Integer) return Complex_Vector is
    Result: Complex_Vector(X'Range(1));
  begin
    for I in X'Range(1) loop
      Result(I) := X(I, Col);
    end loop;
    return Result;
  end Column;


  function Diagonal(X: in Complex_Matrix) return Complex_Vector is
    Result: Complex_Vector(X'Range(1));
  begin
    if X'Length(1) /= X'Length(2) then
      raise Array_Index_Error;
    end if;
    for I in X'Range(1) loop
      Result(I) := X(I, (I-X'First(1))+X'First(2));
    end loop;
    return Result;
  end Diagonal;


  function SubVector(X: in Complex_Vector; First, Last: in Integer)
    return Complex_Vector
  is
    Result: Complex_Vector(First..Last);
  begin
    for I in First..Last loop
      Result(I) := X(I);
    end loop;
    return Result;
  end SubVector;


  function SubVector(X: in Complex_Vector; First, Last: in Integer;
                     First_index: in Integer)
    return Complex_Vector
  is
    Result: Complex_Vector(First_index..First_index+(Last-First));
  begin
    for I in First..Last loop
      Result(First_index+(I-First)) := X(I);
    end loop;
    return Result;
  end SubVector;


  function SubMatrix(X: in Complex_Matrix;
                     First_Row, First_Col,
                     Last_Row, Last_Col: in Integer)
    return Complex_Matrix
  is
    Result: Complex_Matrix(First_Row..Last_Row,First_Col..Last_Col);
  begin
    for R in First_Row..Last_Row loop
      for C in First_Col..Last_Col loop
        Result(R, C) := X(R, C);
      end loop;
    end loop;
    return Result;
  end SubMatrix;


  function SubMatrix(X: in Complex_Matrix;
                     First_Row, First_Col,
                     Last_Row, Last_Col: in Integer;
                     First_Row_index, First_Col_index: in Integer)
    return Complex_Matrix
  is
    Result: Complex_Matrix(First_Row_index..First_Row_index+(Last_Row-First_Row), 
                        First_Col_index..First_Col_index+(Last_Col-First_Col));
  begin
    for R in First_Row..Last_Row loop
      for C in First_Col..Last_Col loop
        Result(First_Row_index+(R-First_Row),
               First_Col_index+(C-First_Col)) := X(R, C);
      end loop;
    end loop;
    return Result;
  end SubMatrix;


  function Det(X: in Complex_Matrix) return Complex is
    Result: Complex;
  begin
    if X'Length(1) /= X'Length(2) then
      raise Array_Index_Error;
    end if;

    case X'Length(1) is
    when 1 =>
      Result := X(X'First(1), X'First(2));
    when 2 =>
      Result := X(X'First(1), X'First(2)) * X(X'Last(1), X'Last(2)) - 
                X(X'First(1), X'Last(2)) * X(X'Last(1),  X'First(2));
    when others =>
      Result := Complex_Zero;
      declare
        submat : Complex_Matrix_Ptr := 
             new Complex_Matrix(X'First(1)+1..X'Last(1),
                             X'First(2)..X'Last(2)-1);
        unity_sign: Complex := Complex_Unity;
      begin
        for COL in X'Range(2) loop
          if COL /= X'First(2) then
            for SUBCOL in X'First(2)..COL-1 loop
              for ROW in X'First(1)+1..X'Last(1) loop
                submat(ROW,SUBCOL) := X(ROW,SUBCOL);
              end loop;
            end loop;
          end if;
          if COL /= X'Last(2) then
            for SUBCOL in COL+1..X'Last(2) loop
              for ROW in X'First(1)+1..X'Last(1) loop
                submat(ROW,SUBCOL-1) := X(ROW,SUBCOL);
              end loop;
            end loop;
          end if;
          Result := Result + unity_sign * X(X'First(1), COL) * Det(submat.all);
          unity_sign := -unity_sign;
        end loop;
        Destroy_Matrix(submat);
      end;
    end case;
    return Result;
  end Det;


end GENERIC_Complex_Arrays.Operations;
