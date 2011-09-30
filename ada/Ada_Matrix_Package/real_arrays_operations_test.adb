with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Generic_Real_Arrays;
with Generic_Real_Arrays.Operations;

use Ada.Text_IO;

procedure Real_Arrays_Operations_Test is

  package Real_Arrays is new Generic_Real_Arrays(FLOAT);
  package Real_Arrays_Operations is new Real_Arrays.Operations;
  use Real_Arrays;
  use Real_Arrays_Operations;

  V_Ptr1, V_Ptr2: Real_Vector_Ptr;
  M_Ptr1, M_Ptr2: Real_Matrix_Ptr;
  A: Real_Matrix(2..6, 3..7) := (( 1.0,  2.0,  3.0,  4.0,  5.0),
                                 ( 6.0,  7.0,  8.0,  9.0, 10.0),
                                 (11.0, 12.0, 13.0, 14.0, 15.0),
                                 (16.0, 17.0, 18.0, 19.0, 20.0),
                                 (21.0, 22.0, 23.0, 24.0, 25.0));
  B: Real_Vector(2..6) := ( 1.0, 2.0, 3.0, 4.0, 5.0);
  C: Real_Matrix(1..5, 1..5) := ((  3.0,  0.0,  0.0,  0.0,  0.0),
                                 (  0.0, -1.0,  0.0,  0.0,  0.0),
                                 (  3.0,  0.0,  0.0,  0.0,  4.0),
                                 (  0.0,  0.0,  5.0,-12.0,  0.0),
                                 (  1.0, -2.0,  3.0, -4.0,  5.0));
  D: Real_Vector(1..5);
  E: Real_Matrix := ((-1.0, 2.0, 3.0), (2.0, 2.0, 2.0), (1.0, 2.0, 4.0));
  U, W, V: Real_Matrix(1..3, 1..3);
  SVD_Mat: Real_Matrix := ((1.0, 1.0, 1.0),
                           (1.0, 2.0, 3.0),
                           (1.0, 4.0, 9.0));
  O: Float;

  Tests_Failed: Integer := 0;

  procedure Assert(Test_Case: in Boolean) is
  begin
    if not Test_Case then
      Ada.Text_IO.New_Line;
      Ada.Text_IO.Put_Line("-=====================-");
      Ada.Text_IO.Put_Line("-====== FAILED =======-");
      Ada.Text_IO.Put_Line("-=====================-");
      Tests_Failed := Tests_Failed + 1;
    end if;
  end;

  function Compare(X1, X2: in Real_Matrix) return Boolean is
  begin
    for R in X1'Range(1) loop
      for C in X1'Range(2) loop
        if (X1(R,C) - X2(X2'First(1)+(R-X1'First(1)), X2'First(2)+(C-X1'First(2)))) > 0.001 then
          return False;
        end if;
      end loop;
    end loop;
    return True;
  end Compare;

  function Compare(X1, X2: in Real_Vector) return Boolean is
  begin
    for I in X1'Range loop
      if (X1(I) - X2(X2'First+(I-X1'First))) > 0.001 then
        return False;
      end if;
    end loop;
    return True;
  end Compare;

begin

--  function Create_Vector(First, Last: in Integer)
--    return Real_Vector_Ptr;
  Put_Line("  function Create_Vector(First, Last: in Integer)");
  Put_Line("    return Real_Vector_Ptr;");
  New_Line;
  V_Ptr1 := Create_Vector(2, 5);
  Assert(V_Ptr1'Length = 4);
  Assert(V_Ptr1'First = 2);
  Assert(V_Ptr1'Last = 5);

--  function Create_Vector(First, Last: in Integer;
--                         Default_Value: in Real) 
--    return Real_Vector_Ptr;
  Put_Line("  function Create_Vector(First, Last: in Integer;");
  Put_Line("                         Default_Value: in Real)");
  Put_Line("    return Real_Vector_Ptr;");
  New_Line;
  V_Ptr2 := Create_Vector(1, 3, Default_Value => -3.14);
  Assert(V_Ptr2'Length = 3);
  Assert(V_Ptr2'First = 1);
  Assert(V_Ptr2'Last = 3);
  Assert(V_Ptr2.All = (-3.14, -3.14, -3.14));

-- procedure Destroy_Vector(X: in out Real_Vector_Ptr);
  Put_Line(" procedure Destroy_Vector(X: in out Real_Vector_Ptr);");
  New_Line;
  Destroy_Vector(V_Ptr1);
  Destroy_Vector(V_Ptr2);

--  function Create_Matrix(first_row, first_col,
--                         last_row, last_col: in Integer)
--    return Real_Matrix_Ptr;
  Put_Line("  function Create_Matrix(first_row, first_col,");
  Put_Line("                         last_row, last_col: in Integer)");
  Put_Line("    return Real_Matrix_Ptr;");
  New_Line;
  M_Ptr1 := Create_Matrix(2, 3, 4, 4);
  Assert(M_Ptr1'Length(1) = 3);
  Assert(M_Ptr1'Length(2) = 2);
  Assert(M_Ptr1'First(1) = 2);
  Assert(M_Ptr1'Last(1) = 4);
  Assert(M_Ptr1'First(2) = 3);
  Assert(M_Ptr1'Last(2) = 4);

--  function Create_Matrix(first_row, first_col,
--                         last_row, last_col: in Integer;
--                         default_value: in Real)
--    return Real_Matrix_Ptr;
  Put_Line("  function Create_Matrix(first_row, first_col,");
  Put_Line("                         last_row, last_col: in Integer;");
  Put_Line("                         default_value: in Real)");
  Put_Line("    return Real_Matrix_Ptr;");
  New_Line;
  M_Ptr2 := Create_Matrix(3, 4, 5, 5, Default_Value => -3.14);
  Assert(M_Ptr2'Length(1) = 3);
  Assert(M_Ptr2'Length(2) = 2);
  Assert(M_Ptr2'First(1) = 3);
  Assert(M_Ptr2'Last(1) = 5);
  Assert(M_Ptr2'First(2) = 4);
  Assert(M_Ptr2'Last(2) = 5);
  Assert(M_Ptr2.all = ((-3.14, -3.14), (-3.14, -3.14), (-3.14, -3.14)));

-- procedure Destroy_Matrix(X: in out Real_Matrix_Ptr);
  Put_Line(" procedure Destroy_Matrix(X: in out Real_Matrix_Ptr);");
  New_Line;
  Destroy_Matrix(M_Ptr1);
  Destroy_Matrix(M_Ptr2);

--  function Create_Matrix(first, last: in Integer)
--    return Real_Matrix_Ptr;
  Put_Line("  function Create_Matrix(first, last: in Integer)");
  Put_Line("    return Real_Matrix_Ptr;");
  New_Line;
  M_Ptr1 := Create_Matrix(3, 7);
  Assert(M_Ptr1'Length(1) = 5);
  Assert(M_Ptr1'Length(2) = 5);
  Assert(M_Ptr1'First(1) = 3);
  Assert(M_Ptr1'Last(1) = 7);
  Assert(M_Ptr1'First(2) = 3);
  Assert(M_Ptr1'Last(2) = 7);
  Destroy_Matrix(M_Ptr1);

--  function Create_Matrix(first, last: in Integer;
--                         default_value: in Real)
--    return Real_Matrix_Ptr;
  Put_Line("  function Create_Matrix(first, last: in Integer;");
  Put_Line("                         default_value: in Real)");
  Put_Line("    return Real_Matrix_Ptr;");
  New_Line;
  M_Ptr1 := Create_Matrix(3, 5, Default_Value => -3.14);
  Assert(M_Ptr1'Length(1) = 3);
  Assert(M_Ptr1'Length(2) = 3);
  Assert(M_Ptr1'First(1) = 3);
  Assert(M_Ptr1'Last(1) = 5);
  Assert(M_Ptr1'First(2) = 3);
  Assert(M_Ptr1'Last(2) = 5);
  Assert(M_Ptr1.all = ((-3.14, -3.14, -3.14), (-3.14, -3.14, -3.14), (-3.14, -3.14, -3.14)));
  Destroy_Matrix(M_Ptr1);

--  function Row(X: in Real_Matrix;
--               row: in Integer) return Real_Vector;
  Put_Line("  function Row(X: in Real_Matrix;");
  Put_Line("               row: in Integer) return Real_Vector;");
  New_Line;
  for I in A'Range(1) loop
    O := Float((I-A'First(1))*A'Length(2));
    Assert(Row(A, I) = (1.0+O, 2.0+O, 3.0+O, 4.0+O, 5.0+O));
  end loop;

--  function Column(X: in Real_Matrix;
--                  col: in Integer) return Real_Vector;
  Put_Line("  function Column(X: in Real_Matrix;");
  Put_Line("                  col: in Integer) return Real_Vector;");
  New_Line;
  for I in A'Range(2) loop
    O := Float(I-A'First(2));
    Assert(Column(A, I) = (1.0+O, 6.0+O, 11.0+O, 16.0+O, 21.0+O));
  end loop;

--  function Diagonal(X: in Real_Matrix) return Real_Vector;
  Put_Line("  function Diagonal(X: in Real_Matrix) return Real_Vector;");
  New_Line;
  Assert(Diagonal(A) = (1.0, 7.0, 13.0, 19.0, 25.0));

--  function Subvector(X: in Real_Vector; first, last: in Integer)
--    return Real_Vector;
  Put_Line("  function Subvector(X: in Real_Vector; first, last: in Integer)");
  Put_Line("    return Real_Vector;");
  New_Line;
  for I in 1..B'Length-1 loop
    O := Float(I);
    Assert(Subvector(B, I+(B'First-1), I+(B'First)) = (O, O+1.0));
  end loop;
  for I in 1..B'Length-2 loop
    O := Float(I);
    Assert(Subvector(B, I+(B'First-1), I+(B'First+1)) = (O, O+1.0, O+2.0));
  end loop;
  for I in 1..B'Length-3 loop
    O := Float(I);
    Assert(Subvector(B, I+(B'First-1), I+(B'First+2)) = (O, O+1.0, O+2.0, O+3.0));
  end loop;
  for I in 1..B'Length-4 loop
    O := Float(I);
    Assert(Subvector(B, I+(B'First-1), I+(B'First+3)) = (O, O+1.0, O+2.0, O+3.0, O+4.0));
  end loop;
  Assert(Subvector(B, B'First, B'Last) = (1.0, 2.0, 3.0, 4.0, 5.0));

--  function Subvector(X: in Real_Vector; first, last: in Integer;
--                     first_index: in Integer)
--    return Real_Vector;
  Put_Line("  function Subvector(X: in Real_Vector; first, last: in Integer;");
  Put_Line("                     first_index: in Integer)");
  Put_Line("    return Real_Vector;");
  New_Line;
  for I in 1..B'Length-1 loop
    O := Float(I);
    Assert(Subvector(B, I+(B'First-1), I+(B'First), First_Index => 7) = (O, O+1.0));
  end loop;
  for I in 1..B'Length-2 loop
    O := Float(I);
    Assert(Subvector(B, I+(B'First-1), I+(B'First+1), First_Index => 7) = (O, O+1.0, O+2.0));
  end loop;
  for I in 1..B'Length-3 loop
    O := Float(I);
    Assert(Subvector(B, I+(B'First-1), I+(B'First+2), First_Index => 7) = (O, O+1.0, O+2.0, O+3.0));
  end loop;
  for I in 1..B'Length-4 loop
    O := Float(I);
    Assert(Subvector(B, I+(B'First-1), I+(B'First+3), First_Index => 7) = (O, O+1.0, O+2.0, O+3.0, O+4.0));
  end loop;
  Assert(Subvector(B, B'First, B'Last, First_Index => 7) = (1.0, 2.0, 3.0, 4.0, 5.0));

--  function Submatrix(X: in Real_Matrix;
--                     first_row, first_col, last_row, last_col: in Integer)
--    return Real_Matrix;
  Put_Line("  function Submatrix(X: in Real_Matrix;");
  Put_Line("                     first_row, first_col, last_row, last_col: in Integer)");
  Put_Line("    return Real_Matrix;");
  New_Line;
  for I in A'Range(1) loop
    O := Float(5*(I-A'First(1)));
    Assert(Submatrix(A, I, A'First(2), I, A'Last(2)) = (1 =>(O+1.0, O+2.0, O+3.0, O+4.0, O+5.0)));
  end loop;
  for I in A'Range(2) loop
    O := Float(1+(I-A'First(2)));
    Assert(Submatrix(A, A'First(1), I, A'Last(1), I) = ((1 => O+ 0.0),
                                                        (1 => O+ 5.0),
                                                        (1 => O+10.0),
                                                        (1 => O+15.0),
                                                        (1 => O+20.0)));
  end loop;
  for R in A'First(1)..A'Last(1)-2 loop
    for C in A'First(2)..A'Last(2)-2 loop
      O := Float((C-A'First(2))+5*(R-A'First(1)));
      Assert(Submatrix(A, R, C, R+2, C+2) = (( 1.0+O,  2.0+O,  3.0+O),
                                             ( 6.0+O,  7.0+O,  8.0+O),
                                             (11.0+O, 12.0+O, 13.0+O)));
    end loop;
  end loop;	

--  function Submatrix(X: in Real_Matrix;
--                     first_row, first_col, last_row, last_col: in Integer;
--                     first_row_index, first_col_index: in Integer)
--    return Real_Matrix;
  Put_Line("  function Submatrix(X: in Real_Matrix;");
  Put_Line("                     first_row, first_col, last_row, last_col: in Integer;");
  Put_Line("                     first_row_index, first_col_index: in Integer)");
  Put_Line("    return Real_Matrix;");
  New_Line;
  for I in A'Range(1) loop
    O := Float(5*(I-A'First(1)));
    Assert(Submatrix(A, I, A'First(2), I, A'Last(2), First_Row_Index => 27, First_Col_Index => 18) = (1 =>(O+1.0, O+2.0, O+3.0, O+4.0, O+5.0)));
  end loop;
  for I in A'Range(2) loop
    O := Float(1+(I-A'First(2)));
    Assert(Submatrix(A, A'First(1), I, A'Last(1), I,
                     First_Row_Index => 27,
                     First_Col_Index => 18) = ((1 => O+ 0.0),
                                               (1 => O+ 5.0),
                                               (1 => O+10.0),
                                               (1 => O+15.0),
                                               (1 => O+20.0)));
  end loop;
  for R in A'First(1)..A'Last(1)-2 loop
    for C in A'First(2)..A'Last(2)-2 loop
      O := Float((C-A'First(2))+5*(R-A'First(1)));
      Assert(Submatrix(A, R, C, R+2, C+2,
                       First_Row_Index => 27,
                       First_Col_Index => 18) = (( 1.0+O,  2.0+O,  3.0+O),
                                                 ( 6.0+O,  7.0+O,  8.0+O),
                                                 (11.0+O, 12.0+O, 13.0+O)));
    end loop;
  end loop;	

--  function Magnitude(X : in Real_Vector) return Real;
  Put_Line("  function Magnitude(X : in Real_Vector) return Real;");
  New_Line;
  Assert(Magnitude((1 => 0.0)) = 0.0);
  Assert(Magnitude((0.0, 0.0, 0.0, 0.0)) = 0.0);
  Assert(Magnitude((1 => 5.0)) = 5.0);
  Assert(Magnitude((1 => -5.0)) = 5.0);
  Assert(Magnitude((0.0, 0.0, 0.0, 3.0)) = 3.0);
  Assert(Magnitude((-4.0, 0.0, 0.0, 3.0)) = 5.0);
  Assert(Magnitude((-3.0, 4.0, 0.0)) = 5.0);

--  procedure Normalize(X : in out Real_Vector);
  Put_Line("  procedure Normalize(X : in out Real_Vector);");
  New_Line;
  for I in C'Range(1) loop
    D := Row(C, I);
    O := Magnitude(D);
    Normalize(D);
    Assert(Magnitude(D) = 1.0);
    for J in D'Range loop
      Assert(D(J) = C(I, J)/O);
    end loop;
  end loop;

--  function Det(X : in Real_Matrix) return Real;
  Put_Line("  function Det(X : in Real_Matrix) return Real;");
  New_Line;
  Assert(Det((1=>(1=>-7.0))) = -7.0);
  Assert(Det((( 1.0, -2.0),
              (-3.0,  4.0))) = -2.0);
  Assert(Det((( 1.0, -2.0,  3.0),
              (-4.0,  5.0, -6.0),
              ( 7.0, -8.0,  9.0))) = 0.0);

--  function Inverse(X : Real_Matrix) return Real_Matrix;
  Put_Line("  function Inverse(X : Real_Matrix) return Real_Matrix;");
  New_Line;
  Assert(Compare(Inverse(((1.0, 2.0), (2.0, 3.0))), ((-3.0, 2.0), (2.0, -1.0))));
  Assert(Compare(Inverse(((1.0, 1.0), (1.0, 2.0))), ((2.0, -1.0), (-1.0, 1.0))));
  Assert(Compare(Inverse(E)*E, Identity_Matrix(3)));  

--  procedure Singular_Value_Decomposition
--  ( A: in Real_Matrix;
--    U: out Real_Matrix;
--    W: out Real_Matrix;
--    V: out Real_Matrix);
  Put_Line("  procedure Singular_Value_Decomposition");
  Put_Line("  ( A: in Real_Matrix;");
  Put_Line("    U: out Real_Matrix;");
  Put_Line("    W: out Real_Matrix;");
  Put_Line("    V: out Real_Matrix);");
  New_Line;
  Singular_Value_Decomposition(SVD_Mat, U, W, V);
  Assert(Compare(U*W*Transpose(V), SVD_Mat));
  Assert(Compare(U*Transpose(U), Identity_Matrix(3)));
  Assert(Compare(V*Transpose(V), Identity_Matrix(3)));

  Ada.Text_IO.Put("Number of failures: ");
  Ada.Integer_Text_IO.Put(Tests_Failed);

end Real_Arrays_Operations_Test;
