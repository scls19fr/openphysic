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
-- $FILE: generic_real_arrays-operations.ads
-- $LAST_MODIFIED: 07/31/96
-- $AUTHORS: Chris Papademetrious, Xiaoxun Zhu, Moshe Kam
--
-- Instantiating this package:
-- To instantiate this package, you must first instantiate
-- Generic_Real_Arrays, then refer to this as a child package. 
-- Example:
--
-- package Real_Arrays is new Generic_Real_Arrays(Float);
-- package Real_Arrays_Operations is new Real_Arrays.Operations;

generic

package Generic_Real_Arrays.Operations is


  -- type Real_Vector_Ptr
  -- Allows indirect access to Real_Vector objects.
  type Real_Vector_Ptr is access Real_Vector;

  -- type Real_Matrix_Ptr
  -- Allows indirect access to Real_Matrix objects.
  type Real_Matrix_Ptr is access Real_Matrix;


  -- function Create_Vector
  -- Allocates a Real_Vector of range (First..Last), with the items
  -- in the vector uninitialized.
  function Create_Vector(First, Last: in Integer)
    return Real_Vector_Ptr;

  -- function Create_Vector
  -- Allocates a Real_Vector of range (First..Last), with the items
  -- in the vector initialized to (Default_Value).
  function Create_Vector(First, Last: in Integer;
                         Default_Value: in Real) 
    return Real_Vector_Ptr;

  -- function Create_Matrix
  -- Allocates a Real_Matrix of range (First_Row..Last_Row,
  -- First_Col..Last_Col), with the items in the matrix
  -- uninitialized.
  function Create_Matrix(First_row, First_col,
                         Last_row, Last_col: in Integer)
    return Real_Matrix_Ptr;

  -- function Create_Matrix
  -- Allocates a Real_Matrix of range (First_Row..Last_Row,
  -- First_Col..Last_Col), with the items in the matrix
  -- initialized to (Default_Value).
  function Create_Matrix(First_row, First_col,
                         Last_row, Last_col: in Integer;
                         Default_Value: in Real)
    return Real_Matrix_Ptr;

  -- function Create_Matrix
  -- Allocates a square Real_Matrix of range (First..Last, First..Last),
  -- with the items in the matrix uninitialized.
  function Create_Matrix(First, Last: in Integer)
    return Real_Matrix_Ptr;

  -- function Create_Matrix
  -- Allocates a square Real_Matrix of range (First..Last, First..Last),
  -- with the items in the matrix initialized to (Default_Value).
  function Create_Matrix(First, Last: in Integer;
                         Default_Value: in Real)
    return Real_Matrix_Ptr;


  -- procedure Destroy_Vector
  -- Deallocates a Real_Vector allocated with Create_Vector.
  procedure Destroy_Vector(X: in out Real_Vector_Ptr);

  -- procedure Destroy_Matrix
  -- Deallocates a Real_Matrix allocated with Create_Vector.
  procedure Destroy_Matrix(X: in out Real_Matrix_Ptr);


  -- function Row
  -- Returns the Row'th row from Real_Matrix X as a Real_Vector
  -- with range X'Range(2).
  function Row(X: in Real_Matrix;
               Row: in Integer) return Real_Vector;

  -- function Column
  -- Returns the Col'th column from Real_Matrix X as a Real_Vector
  -- with range X'Range(1).
  function Column(X: in Real_Matrix;
                  Col: in Integer) return Real_Vector;

  -- function Diagonal
  -- Returns the diagonal elements from square Real_Matrix X as a
  -- Real_Vector with range X'Range(1).
  --
  -- Exceptions possible:
  -- Array_Index_Error (matrix not square)
  function Diagonal(X: in Real_Matrix) return Real_Vector;

  -- function Subvector
  -- Returns items from Real_Vector X(First..Last) as a Real_Vector
  -- of range (First..Last).
  function SubVector(X: in Real_Vector; First, Last: in Integer)
    return Real_Vector;

  -- function Subvector
  -- Returns items from Real_Vector X(First..Last) as a Real_Vector
  -- of range (First_Index..First_Index+X'Length-1).
  function SubVector(X: in Real_Vector; First, Last: in Integer;
                     First_Index: in Integer)
    return Real_Vector;

  -- function Submatrix
  -- Returns items from Real_Matrix X(First_Row..Last_Row,
  -- First_Col..Last..Col) as a Real_Matrix of range
  -- (First_Row..Last_Row, First_Col..Last_Col).
  function SubMatrix(X: in Real_Matrix;
                     First_Row, First_Col, Last_Row, Last_Col: in Integer)
    return Real_Matrix;

  -- function Submatrix
  -- Returns items from Real_Matrix X(First_Row..Last_Row,
  -- First_Col..Last..Col) as a Real_Matrix of range
  -- (First_Row_Index..First_Row_Index+X'Length(1)-1,
  --  First_Col_Index..First_Col_Index+X'Length(2)-1).
  function SubMatrix(X: in Real_Matrix;
                     First_Row, First_Col, Last_Row, Last_Col: in Integer;
                     First_Row_index, First_Col_Index: in Integer)
    return Real_Matrix;


  -- function Magnitude
  -- Determines the magnitude of the Real_Vector X.
  function Magnitude(X: in Real_Vector) return Real;


  -- procedure Normalize
  -- Scales the Real_Vector X such that its magnitude is (1.0).
  procedure Normalize(X: in out Real_Vector);


  -- function Det
  -- Compute the determinant of the Real_Matrix X.
  --
  -- Exceptions possible:
  -- Array_Index_Error (matrix not square)
  function Det(X: in Real_Matrix) return Real;

  -- function Inverse
  -- Calculate the inverse of the Real_Matrix X.
  --
  -- Exceptions possible:
  -- Array_Index_Error (matrix was not square)
  -- Matrix_Singular (matrix is too near singular)
  function Inverse(X: Real_Matrix) return Real_Matrix;


  -- procedure Singular_Value_Decomposition
  -- Calculate the SVD of a square Real_Matrix A, placing the
  -- results in Real_Matrices U, W, and V.
  --
  -- Exceptions possible:
  -- Array_Index_Error (matrix not square)
  -- Matrix_Convergence (could not converge on a solution)
  procedure Singular_Value_Decomposition
  ( A: in Real_Matrix;
    U: out Real_Matrix;
    W: out Real_Matrix;
    V: out Real_Matrix);


  -- Exception needed in the package.
  Matrix_Singular: exception;
  Matrix_Convergence: exception;

end Generic_Real_Arrays.Operations;


