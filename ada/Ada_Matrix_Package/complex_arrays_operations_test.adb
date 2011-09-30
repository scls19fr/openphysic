with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Numerics.Generic_Elementary_Functions;
with Ada.Numerics.Generic_Complex_Types;
with Generic_Real_Arrays;
with Generic_Complex_Arrays;
with Generic_Complex_Arrays.Operations;
use Ada.Text_IO;

procedure Complex_Arrays_Operations_Test is

  package Real_Arrays is new Generic_Real_Arrays(Float);
  package Complex_Types is new Ada.Numerics.Generic_Complex_Types(Float);
  use Real_Arrays;
  use Complex_Types;
  package Complex_Arrays is new Generic_Complex_Arrays(Float, Real_Vector,
						       Real_Matrix, Complex);
  package Complex_Arrays_Operations is new Complex_Arrays.Operations;
  use Complex_Arrays;
  use Complex_Arrays_Operations;

  V_Ptr1, V_Ptr2: Complex_Vector_Ptr;
  M_Ptr1, M_Ptr2: Complex_Matrix_Ptr;
  A: Complex_Matrix(2..5, 3..6)
    := ((( 1.0,16.0), ( 2.0,15.0), ( 3.0,14.0), ( 4.0,13.0)),
        (( 5.0,12.0), ( 6.0,11.0), ( 7.0,10.0), ( 8.0, 9.0)),
        (( 9.0, 8.0), (10.0, 7.0), (11.0, 6.0), (12.0, 5.0)),
        ((13.0, 4.0), (14.0, 3.0), (15.0, 2.0), (16.0, 1.0)));
  B: Complex_Vector(2..6) := (( 1.0, 5.0),
                              ( 2.0, 4.0),
                              ( 3.0, 3.0),
                              ( 4.0, 2.0),
                              ( 5.0, 1.0));
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

  function Compare(X1, X2: in Complex_Matrix) return Boolean is
  begin
    for R in X1'Range(1) loop
      for C in X1'Range(2) loop
        if (Re(X1(R,C)) - Re(X2(X2'First(1)+(R-X1'First(1)),
				X2'First(2)+(C-X1'FirSt(2))))) > 0.001 or
           (Im(X1(R,C)) - Im(X2(X2'First(1)+(R-X1'First(1)),
				X2'First(2)+(C-X1'FirSt(2))))) > 0.001 then
          return False;
        end if;
      end loop;
    end loop;
    return True;
  end Compare;

  function Compare(X1, X2: in Complex_Vector) return Boolean is
  begin
    for I in X1'Range loop
      if (Re(X1(I)) - Re(X2(X2'First+(I-X1'First)))) > 0.001 or
         (Im(X1(I)) - Im(X2(X2'First+(I-X1'First)))) > 0.001 then
        return False;
      end if;
    end loop;
    return True;
  end Compare;

begin

--  function Create_Vector(First, Last: in Integer)
--    return Complex_Vector_Ptr;
  Put_Line("  function Create_Vector(First, Last: in Integer)");
  Put_Line("    return Complex_Vector_Ptr;");
  New_Line;
  V_Ptr1 := Create_Vector(2, 5);
  Assert(V_Ptr1'Length = 4);
  Assert(V_Ptr1'First = 2);
  Assert(V_Ptr1'Last = 5);

--  function Create_Vector(First, Last: in Integer;
--                         Default_Value: in Complex) 
--    return Complex_Vector_Ptr;
  Put_Line("  function Create_Vector(First, Last: in Integer;");
  Put_Line("                         Default_Value: in Complex)");
  Put_Line("    return Complex_Vector_Ptr;");
  New_Line;
  V_Ptr2 := Create_Vector(1, 3, Default_Value => (-3.14, 2.87));
  Assert(V_Ptr2'Length = 3);
  Assert(V_Ptr2'First = 1);
  Assert(V_Ptr2'Last = 3);
  Assert(V_Ptr2.All = ((-3.14, 2.87),
                       (-3.14, 2.87),
                       (-3.14, 2.87)));

-- procedure Destroy_Vector(X: in out Complex_Vector_Ptr);
  Put_Line(" procedure Destroy_Vector(X: in out Complex_Vector_Ptr);");
  New_Line;
  Destroy_Vector(V_Ptr1);
  Destroy_Vector(V_Ptr2);

--  function Create_Matrix(First_row, First_col,
--                         Last_row, Last_col: in Integer)
--    return Complex_Matrix_Ptr;
  Put_Line("  function Create_Matrix(First_row, First_col,");
  Put_Line("                         Last_row, Last_col: in Integer)");
  Put_Line("    return Complex_Matrix_Ptr;");
  New_Line;
  M_Ptr1 := Create_Matrix(2, 3, 4, 4);
  Assert(M_Ptr1'Length(1) = 3);
  Assert(M_Ptr1'Length(2) = 2);
  Assert(M_Ptr1'First(1) = 2);
  Assert(M_Ptr1'Last(1) = 4);
  Assert(M_Ptr1'First(2) = 3);
  Assert(M_Ptr1'Last(2) = 4);

--  function Create_Matrix(First_Row, First_Col,
--                         Last_Row, Last_Col: in Integer;
--                         Default_Value: in Complex)
--    return Complex_Matrix_Ptr;
  Put_Line("  function Create_Matrix(First_Row, First_Col,");
  Put_Line("                         Last_Row, Last_Col: in Integer;");
  Put_Line("                         Default_Value: in Complex)");
  Put_Line("    return Complex_Matrix_Ptr;");
  New_Line;
  M_Ptr2 := Create_Matrix(3, 4, 5, 5, Default_Value => (-3.14, 2.87));
  Assert(M_Ptr2'Length(1) = 3);
  Assert(M_Ptr2'Length(2) = 2);
  Assert(M_Ptr2'First(1) = 3);
  Assert(M_Ptr2'Last(1) = 5);
  Assert(M_Ptr2'First(2) = 4);
  Assert(M_Ptr2'Last(2) = 5);
  Assert(M_Ptr2.all = (((-3.14, 2.87), (-3.14, 2.87)),
                       ((-3.14, 2.87), (-3.14, 2.87)),
                       ((-3.14, 2.87), (-3.14, 2.87))));

-- procedure Destroy_Matrix(X: in out Complex_Matrix_Ptr);
  Put_Line(" procedure Destroy_Matrix(X: in out Complex_Matrix_Ptr);");
  New_Line;
  Destroy_Matrix(M_Ptr1);
  Destroy_Matrix(M_Ptr2);

--  function Create_Matrix(first, last: in Integer)
--    return Complex_Matrix_Ptr;
  Put_Line("  function Create_Matrix(first, last: in Integer)");
  Put_Line("    return Complex_Matrix_Ptr;");
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
--                         default_value: in Complex)
--    return Complex_Matrix_Ptr;
  Put_Line("  function Create_Matrix(first, last: in Integer;");
  Put_Line("                         default_value: in Complex)");
  Put_Line("    return Complex_Matrix_Ptr;");
  New_Line;
  M_Ptr1 := Create_Matrix(3, 5, Default_Value => (-3.14, 2.87));
  Assert(M_Ptr1'Length(1) = 3);
  Assert(M_Ptr1'Length(2) = 3);
  Assert(M_Ptr1'First(1) = 3);
  Assert(M_Ptr1'Last(1) = 5);
  Assert(M_Ptr1'First(2) = 3);
  Assert(M_Ptr1'Last(2) = 5);
  Assert(M_Ptr1.all = (((-3.14, 2.87), (-3.14, 2.87), (-3.14, 2.87)),
                       ((-3.14, 2.87), (-3.14, 2.87), (-3.14, 2.87)),
                       ((-3.14, 2.87), (-3.14, 2.87), (-3.14, 2.87))));

--  function Row(X: in Complex_Matrix;
--               row: in Integer) return Complex_Vector;
  Put_Line("  function Row(X: in Complex_Matrix;");
  Put_Line("               row: in Integer) return Complex_Vector;");
  New_Line;
  for I in A'Range(1) loop
     O := Float((I-A'First(1))*A'Length(2));
     Assert(Row(A, I) = (( 1.0+O, 16.0-O),
                         ( 2.0+O, 15.0-O),
                         ( 3.0+O, 14.0-O),
                         ( 4.0+O, 13.0-O)));
  end loop;

--  function Column(X: in Complex_Matrix;
--                  col: in Integer) return Complex_Vector;
  Put_Line("  function Column(X: in Complex_Matrix;");
  Put_Line("                  col: in Integer) return Complex_Vector;");
  New_Line;
  for I in A'Range(2) loop
    O := Float(I-A'First(2));
    Assert(Column(A, I) = (( 1.0+O,16.0-O),
                           ( 5.0+O,12.0-O),
                           ( 9.0+O, 8.0-O),
                           (13.0+O, 4.0-O)));
  end loop;

--  function Diagonal(X: in Complex_Matrix) return Complex_Vector;
  Put_Line("  function Diagonal(X: in Complex_Matrix) return Complex_Vector;");
  New_Line;
  Assert(Diagonal(A) = (( 1.0,16.0),
                        ( 6.0,11.0),
                        (11.0, 6.0),
                        (16.0, 1.0)));

--  function Subvector(X: in Complex_Vector; first, last: in Integer)
--    return Complex_Vector;
  Put_Line("  function Subvector(X: in Complex_Vector; first, last: in Integer)");
  Put_Line("    return Complex_Vector;");
  New_Line;
  for I in 1..B'Length-1 loop
    O := Float(I);
    Assert(Subvector(B, I+(B'First-1), I+(B'First)) = ((O, 6.0-O),
                                                       (O+1.0, 5.0-O)));
  end loop;
  for I in 1..B'Length-2 loop
    O := Float(I);
    Assert(Subvector(B, I+(B'First-1), I+(B'First+1)) = ((O, 6.0-O),
                                                         (O+1.0, 5.0-O),
                                                         (O+2.0, 4.0-O)));
  end loop;
  for I in 1..B'Length-3 loop
    O := Float(I);
    Assert(Subvector(B, I+(B'First-1), I+(B'First+2)) = ((O, 6.0-O),
                                                         (O+1.0, 5.0-O),
                                                         (O+2.0, 4.0-O),
                                                         (O+3.0, 3.0-O)));
  end loop;
  for I in 1..B'Length-4 loop
    O := Float(I);
    Assert(Subvector(B, I+(B'First-1), I+(B'First+3)) = ((O, 6.0-O),
                                                         (O+1.0, 5.0-O),
                                                         (O+2.0, 4.0-O),
                                                         (O+3.0, 3.0-O),
                                                         (O+4.0, 2.0-O)));
  end loop;
  Assert(Subvector(B, B'First, B'Last) = ((1.0, 5.0),
                                          (2.0, 4.0),
                                          (3.0, 3.0),
                                          (4.0, 2.0),
                                          (5.0, 1.0)));
 
--  function Subvector(X: in Complex_Vector; first, last: in Integer;
--                     First_Index: in Integer)
--    return Complex_Vector;
  Put_Line("  function Subvector(X: in Complex_Vector; First, Last: in Integer;");
  Put_Line("                     First_Index: in Integer)");
  Put_Line("    return Complex_Vector;");
  New_Line;
  for I in 1..B'Length-1 loop
    O := Float(I);
    Assert(Subvector(B, I+(B'First-1), I+(B'First),
                     First_Index => 7) = ((O, 6.0-O),
					  (O+1.0, 5.0-O)));
  end loop;
  for I in 1..B'Length-2 loop
    O := Float(I);
    Assert(Subvector(B, I+(B'First-1), I+(B'First+1),
                     First_Index => 7) = ((O, 6.0-O),
                                          (O+1.0, 5.0-O),
                                          (O+2.0, 4.0-O)));
  end loop;
  for I in 1..B'Length-3 loop
    O := Float(I);
    Assert(Subvector(B, I+(B'First-1), I+(B'First+2),
           First_Index => 7) = ((O, 6.0-O),
                                (O+1.0, 5.0-O),
                                (O+2.0, 4.0-O),
                                (O+3.0, 3.0-O)));
  end loop;
  for I in 1..B'Length-4 loop
    O := Float(I);
    Assert(Subvector(B, I+(B'First-1), I+(B'First+3),
                     First_Index => 7) = ((O, 6.0-O),
                                          (O+1.0, 5.0-O),
                                          (O+2.0, 4.0-O),
                                          (O+3.0, 3.0-O),
                                          (O+4.0, 2.0-O)));
  end loop;
  Assert(Subvector(B, B'First, B'Last,
                   First_Index => 7) = ((1.0, 5.0),
                                        (2.0, 4.0),
                                        (3.0, 3.0),
                                        (4.0, 2.0),
                                        (5.0, 1.0)));

--  function Submatrix(X: in Complex_Matrix;
--                     First_Row, First_Col, Last_Row, Last_Col: in Integer)
--    return Complex_Matrix;
  Put_Line("  function Submatrix(X: in Complex_Matrix;");
  Put_Line("                     First_Row, First_Col, Last_Row, Last_Col: in Integer)");
  Put_Line("    return Complex_Matrix;");
  New_Line;
  for I in A'Range(1) loop
    O := Float(4*(I-A'First(1)));
    Assert(Submatrix(A, I, A'First(2), I, A'Last(2))
           = (1 =>((O+1.0, 16.0-O),
                   (O+2.0, 15.0-O),
                   (O+3.0, 14.0-O),
                   (O+4.0, 13.0-O))));
  end loop;
  for I in A'Range(2) loop
    O := Float(1+(I-A'First(2)));
    Assert(Submatrix(A, A'First(1), I, A'Last(1), I)
           = ((1 => (O+ 0.0,17.0-O)),
              (1 => (O+ 4.0,13.0-O)),
              (1 => (O+ 8.0, 9.0-O)),
              (1 => (O+12.0, 5.0-O))));
  end loop;
  for R in A'First(1)..A'Last(1)-2 loop
    for C in A'First(2)..A'Last(2)-2 loop
      O := Float((C-A'First(2))+4*(R-A'First(1)));
      Assert(Submatrix(A, R, C, R+2, C+2)
             = ((( 1.0+O, 16.0-O), ( 2.0+O, 15.0-O), ( 3.0+O, 14.0-O)),
                (( 5.0+O, 12.0-O), ( 6.0+O, 11.0-O), ( 7.0+O, 10.0-O)),
                (( 9.0+O,  8.0-O), (10.0+O,  7.0-O), (11.0+O,  6.0-O))));
    end loop;
  end loop;	

--  function Submatrix(X: in Complex_Matrix;
--                     First_Row, First_Col, Last_Row, Last_Col: in Integer;
--                     First_Row_Index, First_Col_Index: in Integer)
--    return Complex_Matrix;
  Put_Line("  function Submatrix(X: in Complex_Matrix;");
  Put_Line("                     First_row, First_col, Last_row, Last_col: in Integer;");
  Put_Line("                     First_row_index, First_col_index: in Integer)");
  Put_Line("    return Complex_Matrix;");
  New_Line;
  for I in A'Range(1) loop
    O := Float(4*(I-A'First(1)));
    Assert(Submatrix(A, I, A'First(2), I, A'Last(2),
                     First_Row_Index => 15, First_Col_Index => -10)
           = (1 =>((O+1.0, 16.0-O),
                   (O+2.0, 15.0-O),
                   (O+3.0, 14.0-O),
                   (O+4.0, 13.0-O))));
  end loop;
  for I in A'Range(2) loop
    O := Float(1+(I-A'First(2)));
    Assert(Submatrix(A, A'First(1), I, A'Last(1), I,
                     First_Row_Index => 15, First_Col_Index => -10)
           = ((1 => (O+ 0.0,17.0-O)),
              (1 => (O+ 4.0,13.0-O)),
              (1 => (O+ 8.0, 9.0-O)),
              (1 => (O+12.0, 5.0-O))));
  end loop;
  for R in A'First(1)..A'Last(1)-2 loop
    for C in A'First(2)..A'Last(2)-2 loop
      O := Float((C-A'First(2))+4*(R-A'First(1)));
      Assert(Submatrix(A, R, C, R+2, C+2,
                       First_Row_Index => 15, First_Col_Index => -10)
             = ((( 1.0+O, 16.0-O), ( 2.0+O, 15.0-O), ( 3.0+O, 14.0-O)),
                (( 5.0+O, 12.0-O), ( 6.0+O, 11.0-O), ( 7.0+O, 10.0-O)),
                (( 9.0+O,  8.0-O), (10.0+O,  7.0-O), (11.0+O,  6.0-O))));
    end loop;
  end loop;	

--  function Det(X : in Complex_Matrix) return Complex;
  Put_Line("  function Det(X : in Complex_Matrix) return Complex;");
  New_Line;
  Assert(Det((1=>(1=>(-7.0, 3.0)))) = (-7.0, 3.0));
  Assert(Det(A) = (0.0, 0.0));
  Assert(Det(((( 1.0,-1.0), (-2.0, 1.0)),
              ((-3.0,-1.0), ( 4.0, 1.0)))) = (-2.0, -2.0));

  Ada.Text_IO.Put("Number of failures:");
  Ada.Integer_Text_IO.Put(Tests_Failed);

end Complex_Arrays_Operations_Test;
