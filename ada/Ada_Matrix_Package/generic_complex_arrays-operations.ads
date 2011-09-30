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
-- $FILE: generic_complex_arrays-operations.ads
-- $LAST_MODIFIED: 08/01/96
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
--  package Complex_Arrays_Operations is new Complex_Arrays.Operations;


generic

package Generic_Complex_Arrays.Operations is


  -- type Complex_Vector_Ptr
  -- Allows indirect access to Complex_Vector objects.
  type Complex_Vector_Ptr is access Complex_Vector;

  -- type Complex_Matrix_Ptr
  -- Allows indirect access to Complex_Matrix objects.
  type Complex_Matrix_Ptr is access Complex_Matrix;


  -- function Create_Vector
  -- Allocates a Complex_Vector of range (First..Last), with the items
  -- in the vector uninitialized.
  function Create_Vector(First, Last: in Integer)
    return Complex_Vector_Ptr;

  -- function Create_Vector
  -- Allocates a Complex_Vector of range (First..Last), with the items
  -- in the vector initialized to (Default_Value).
  function Create_Vector(First, Last: in Integer;
                         Default_Value: in Complex) 
    return Complex_Vector_Ptr;

  -- function Create_Matrix
  -- Allocates a Real_Matrix of range (First_Row..Last_Row,
  -- First_Col..Last_Col), with the items in the matrix
  -- uninitialized.
  function Create_Matrix(First_row, First_col,
                         Last_row, Last_col: in Integer)
    return Complex_Matrix_Ptr;

  -- function Create_Matrix
  -- Allocates a Complex_Matrix of range (First_Row..Last_Row,
  -- First_Col..Last_Col), with the items in the matrix
  -- initialized to (Default_Value).
  function Create_Matrix(First_row, First_col,
                         Last_row, Last_col: in Integer;
                         Default_Value: in Complex)
    return Complex_Matrix_Ptr;

  -- function Create_Matrix
  -- Allocates a square Complex_Matrix of range (First..Last, First..Last),
  -- with the items in the matrix uninitialized.
  function Create_Matrix(First, Last: in Integer)
    return Complex_Matrix_Ptr;

  -- function Create_Matrix
  -- Allocates a square Complex_Matrix of range (First..Last, First..Last),
  -- with the items in the matrix initialized to (Default_Value).
  function Create_Matrix(First, Last: in Integer;
                         Default_Value: in Complex)
    return Complex_Matrix_Ptr;


  -- procedure Destroy_Vector
  -- Deallocates a Complex_Vector allocated with Create_Vector.
  procedure Destroy_Vector(X: in out Complex_Vector_Ptr);

  -- procedure Destroy_Matrix
  -- Deallocates a Complex_Matrix allocated with Create_Vector.
  procedure Destroy_Matrix(X: in out Complex_Matrix_Ptr);


  -- function Row
  -- Returns the Row'th row from Complex_Matrix X as a Complex_Vector
  -- with range X'Range(2).
  function Row(X: in Complex_Matrix;
               Row: in Integer) return Complex_Vector;

  -- function Column
  -- Returns the Col'th column from Complex_Matrix X as a Complex_Vector
  -- with range X'Range(1).
  function Column(X: in Complex_Matrix;
                  Col: in Integer) return Complex_Vector;

  -- function Diagonal
  -- Returns the diagonal elements from square Complex_Matrix X as a
  -- Complex_Vector with range X'Range(1).
  --
  -- Exceptions possible:
  -- Array_Index_Error (matrix not square)
  function Diagonal(X: in Complex_Matrix) return Complex_Vector;

  -- function Subvector
  -- Returns items from Complex_Vector X(First..Last) as a Complex_Vector
  -- of range (First..Last).
  function SubVector(X: in Complex_Vector; First, Last: in Integer)
    return Complex_Vector;

  -- function Subvector
  -- Returns items from Complex_Vector X(First..Last) as a Complex_Vector
  -- of range (First_Index..First_Index+X'Length-1).
  function SubVector(X: in Complex_Vector; First, Last: in Integer;
                     First_Index: in Integer)
    return Complex_Vector;

  -- function Submatrix
  -- Returns items from Complex_Matrix X(First_Row..Last_Row,
  -- First_Col..Last..Col) as a Complex_Matrix of range
  -- (First_Row..Last_Row, First_Col..Last_Col).
  function SubMatrix(X: in Complex_Matrix;
                     First_Row, First_Col, Last_Row, Last_Col: in Integer)
    return Complex_Matrix;

  -- function Submatrix
  -- Returns items from Complex_Matrix X(First_Row..Last_Row,
  -- First_Col..Last..Col) as a Complex_Matrix of range
  -- (First_Row_Index..First_Row_Index+X'Length(1)-1,
  --  First_Col_Index..First_Col_Index+X'Length(2)-1).
  function SubMatrix(X: in Complex_Matrix;
                     First_Row, First_Col, Last_Row, Last_Col: in Integer;
                     First_Row_index, First_Col_Index: in Integer)
    return Complex_Matrix;


  -- function Det
  -- Compute the determinant of the Complex_Matrix X.
  --
  -- Exceptions possible:
  -- Array_Index_Error (matrix not square)
  function Det(X: in Complex_Matrix) return Complex;


  -- Exception needed in the package.
  Matrix_Singular: exception;
  Matrix_Convergence: exception;

end Generic_Complex_Arrays.Operations;







