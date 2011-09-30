with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Generic_Real_Arrays;

use Ada.Text_IO;

procedure Real_Arrays_Test is

  package Real_Arrays is new Generic_Real_Arrays(Float);
  use Real_Arrays;

  A: constant Real_Vector(1..3) := (-1.0, 2.0, 3.0);
  B: constant Real_Vector(2..4) := (2.0, -4.0, 5.0);
  C: constant Real_Matrix(1..2, 1..2) := ((1.0, 2.0),  (3.0, 4.0));
  D: constant Real_Matrix(2..3, 3..4) := ((1.0, -1.0), (-1.0, 1.0));
  E: constant Real_Vector(1..2) := (2.0, -3.0);
  F: constant Real_Vector(3..4) := (-1.0, 2.0);
  G: constant Real_Matrix(3..5, 3..4) := ((1.0, 2.0), (-1.0, 1.0), (2.0, -0.5));

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

begin

--  function "+" (Right : Real_Vector) return Real_Vector;
  Put_Line("  function '+' (Right : Real_Vector) return Real_Vector;");
  New_Line;
  Assert((+A) = (-1.0, 2.0, 3.0));
  Assert((+B) = (2.0, -4.0, 5.0));

--  function "-" (Right : Real_Vector) return Real_Vector;
  Put_Line("  function '-' (Right : Real_Vector) return Real_Vector;");
  New_Line;
  Assert((-A) = (1.0, -2.0, -3.0));
  Assert((-B) = (-2.0, 4.0, -5.0));
  Ada.Text_IO.New_Line;  

--  function "abs" (Right : Real_Vector) return Real_Vector;
  Put_Line("  function 'abs' (Right : Real_Vector) return Real_Vector;");
  New_Line;
  Assert((abs A) = (1.0, 2.0, 3.0));
  Assert((abs B) = (2.0, 4.0, 5.0));

--  function "+" (Left, Right : Real_Vector) return Real_Vector; 
  Put_Line("  function '+' (Left, Right : Real_Vector) return Real_Vector;");
  New_Line;
  Assert((A+B) = (1.0, -2.0, 8.0));
  Assert((B+A) = (1.0, -2.0, 8.0));

--  function "-" (Left, Right : Real_Vector) return Real_Vector;
  Put_Line("  function '-' (Left, Right : Real_Vector) return Real_Vector;");
  New_Line;
  Assert((A-B) = (-3.0, 6.0, -2.0));
  Assert((B-A) = (3.0, -6.0, 2.0));
  Assert((B-A) = -(A-B));

--  function "*" (Left, Right : Real_Vector) return Real_Vector;
  Put_Line("  function '*' (Left, Right : Real_Vector) return Real_Vector;");
  New_Line;
  Assert(Real_Vector'(A*B) = (-2.0, -8.0, 15.0));
  Assert(Real_Vector'(B*A) = (-2.0, -8.0, 15.0));

--  function "/" (Left, Right : Real_Vector) return Real_Vector;");
  Put_Line("  function '/' (Left, Right : Real_Vector) return Real_Vector;");
  New_Line;
  Assert((A/B) = ((-1.0/2.0), (-2.0/4.0), (3.0/5.0)));
  Assert((B/A) = ((-2.0/1.0), (-4.0/2.0), (5.0/3.0)));

--  function "**" (Left : Real_Vector;
--                 Right : Integer) return Real_Vector; 
  Put_Line("  function '**' (Left : Real_Vector;");
  Put_Line("                 Right : Integer) return Real_Vector;");
  New_Line;
  Assert((A**2) = (1.0, 4.0, 9.0));
  Assert((B**3) = (8.0, -64.0, 125.0));

--  function "*" (Left, Right : Real_Vector) return Real;
  Put_Line("  function '*' (Left, Right : Real_Vector) return Real;");
  New_Line;
  Assert((A*B) = 5.0);
  Assert((B*A) = 5.0);

--  function "*" (Left : Real;
--                Right : Real_Vector) return Real_Vector; 
  Put_Line("  function '*' (Left : Real;");
  Put_Line("                Right : Real_Vector) return Real_Vector;");
  New_Line;
  Assert((2.0*A) = (-2.0, 4.0, 6.0));
  Assert((-0.5*B) = (-1.0, 2.0, -2.5));

--  function "*" (Left : Real_Vector; 
--                Right : Real) return Real_Vector; 
  Put_Line("  function '*' (Left : Real_Vector;");
  Put_Line("                Right : Real) return Real_Vector;");
  New_Line;
  Assert((A*2.0) = (-2.0, 4.0, 6.0));
  Assert((B*(-0.5)) = (-1.0, 2.0, -2.5));

--  function "/" (Left : Real_Vector; 
--                Right : Real) return Real_Vector; 
  Put_Line("  function '/' (Left : Real_Vector;");
  Put_Line("                Right : Real) return Real_Vector;");
  New_Line;
  Assert((A/2.0) = (-0.5, 1.0, 1.5));
  Assert((B/(-0.5)) = (-4.0, 8.0, -10.0));

--  function UNIT_VECTOR (INDEX : Integer; 
--                        ORDER : POSITIVE;
--                        FIRST : Integer := 1) return Real_Vector;
  Put_Line("  function UNIT_VECTOR (INDEX : Integer;");
  Put_Line("                        ORDER : POSITIVE;");
  Put_Line("                        FIRST : Integer := 1) return Real_Vector;");
  New_Line;
  Assert(Unit_Vector(2, 3) = (0.0, 1.0, 0.0));
  Assert(Unit_Vector(Index => 4, Order => 4, First => 2) = (0.0, 0.0, 1.0, 0.0));

--  function "+" (Right : Real_Matrix) return Real_Matrix;
  Put_Line("  function '+' (Right : Real_Matrix) return Real_Matrix;");
  New_Line;
  Assert((+C) = ((1.0, 2.0), (3.0, 4.0)));
  Assert((+D) = ((1.0, -1.0), (-1.0, 1.0)));

--  function "-" (Right : Real_Matrix) return Real_Matrix; 
  Put_Line("  function '-' (Right : Real_Matrix) return Real_Matrix;");
  New_Line;
  Assert((-C) = ((-1.0, -2.0), (-3.0, -4.0)));
  Assert((-D) = ((-1.0, 1.0), (1.0, -1.0)));

--  function "abs" (Right : Real_Matrix) return Real_Matrix;
  Put_Line("  function 'abs' (Right : Real_Matrix) return Real_Matrix;");
  New_Line;
  Assert((abs C) = ((1.0, 2.0), (3.0, 4.0)));
  Assert((abs D) = ((1.0, 1.0), (1.0, 1.0)));

--  function TRANSPOSE (X : Real_Matrix) return Real_Matrix;
  Put_Line("  function TRANSPOSE (X : Real_Matrix) return Real_Matrix;");
  New_Line;
  Assert(Transpose(C) = ((1.0, 3.0), (2.0, 4.0)));
  Assert(Transpose(D) = ((1.0, -1.0), (-1.0, 1.0)));
  Assert(Transpose(D) = D);

--  function "+" (Left, Right : Real_Matrix) return Real_Matrix;
  Put_Line("  function '+' (Left, Right : Real_Matrix) return Real_Matrix;");
  New_Line;
  Assert((C+D) = ((2.0, 1.0), (2.0, 5.0)));
  Assert((D+C) = ((2.0, 1.0), (2.0, 5.0)));
  Assert(Transpose(D) = D);

--  function "-" (Left, Right : Real_Matrix) return Real_Matrix; 
  Put_Line("  function '-' (Left, Right : Real_Matrix) return Real_Matrix;");
  New_Line;
  Assert((C-D) = ((0.0, 3.0), (4.0, 3.0)));
  Assert((D-C) = ((0.0, -3.0), (-4.0, -3.0)));
  Assert((D-C) = -(C-D));

--  function "*" (Left, Right : Real_Matrix) return Real_Matrix;
  Put_Line("  function '*' (Left, Right : Real_Matrix) return Real_Matrix;");
  New_Line;
  Assert((C*D) = ((-1.0, 1.0), (-1.0, 1.0)));
  Assert((D*C) = ((-2.0, -2.0), (2.0, 2.0)));
  Assert((C*C) = ((7.0, 10.0), (15.0, 22.0)));
  Assert((D*D) = ((2.0, -2.0), (-2.0, 2.0)));
  Assert((G*C) = ((7.0, 10.0), (2.0, 2.0), (0.5, 2.0)));
  Assert((G*D) = ((-1.0, 1.0), (-2.0, 2.0), (2.5, -2.5)));
  Assert((G*Transpose(G)) = ((5.0, 1.0, 1.0), (1.0, 2.0, -2.5), (1.0, -2.5, 4.25)));
  Assert((Transpose(G)*G) = ((6.0, 0.0), (0.0, 5.25)));

--  function "*" (Left, Right : Real_Vector) return Real_Matrix;
  Put_Line("  function '*' (Left, Right : Real_Vector) return Real_Matrix;");
  New_Line;
  Assert(Real_Matrix'(A*B) = ((-2.0, 4.0, -5.0), (4.0, -8.0, 10.0), (6.0, -12.0, 15.0)));
  Assert(Real_Matrix'(B*A) = ((-2.0, 4.0, 6.0), (4.0, -8.0, -12.0), (-5.0, 10.0, 15.0)));
  Assert((A*B) = Transpose(B*A));

--  function "*" (Left : Real_Vector;
--                Right : Real_Matrix) return Real_Vector;
  Put_Line("  function '*' (Left : Real_Vector;");
  Put_Line("                Right : Real_Matrix) return Real_Vector;");
  New_Line;
  Assert((E*C) = (-7.0, -8.0));
  Assert((E*D) = (5.0, -5.0));
  Assert((F*C) = (5.0, 6.0));
  Assert((F*D) = (-3.0, 3.0));
  Assert((A*G) = (3.0, -1.5));
  Assert((B*G) = (16.0, -2.5));
  Assert((E*Transpose(C)) = (-4.0, -6.0));
  Assert((E*Transpose(D)) = (5.0, -5.0));
  Assert((F*Transpose(C)) = (3.0, 5.0));
  Assert((F*Transpose(D)) = (-3.0, 3.0));

--  function "*" (Left : Real_Matrix;
--                Right : Real_Vector) return Real_Vector;
  Put_Line("  function '*' (Left : Real_Matrix;");
  Put_Line("                Right : Real_Vector) return Real_Vector;");
  New_Line;
  Assert((C*E) = (-4.0, -6.0));
  Assert((D*E) = (5.0, -5.0));
  Assert((C*F) = (3.0, 5.0));
  Assert((D*F) = (-3.0, 3.0));
  Assert((G*E) = (-4.0, -5.0, 5.5));
  Assert((G*F) = (3.0, 3.0, -3.0));
  Assert((Transpose(G)*A) = (3.0, -1.5));
  Assert((Transpose(G)*B) = (16.0, -2.5));

--  function "*" (Left : Real;
--                Right : Real_Matrix) return Real_Matrix; 
  Put_Line("  function '*' (Left : Real;");
  Put_Line("                Right : Real_Matrix) return Real_Matrix;");
  New_Line;
  Assert((2.0*C) = ((2.0, 4.0), (6.0, 8.0)));
  Assert((-3.0*C) = ((-3.0, -6.0), (-9.0, -12.0)));
  Assert((2.0*D) = ((2.0, -2.0), (-2.0, 2.0)));
  Assert((-3.0*D) = ((-3.0, 3.0), (3.0, -3.0)));

--  function "*" (Left : Real_Matrix;
--                Right : Real) return Real_Matrix; 
  Put_Line("  function '*' (Left : Real_Matrix; ");
  Put_Line("                Right : Real) return Real_Matrix;");
  New_Line;
  Assert((C*2.0) = ((2.0, 4.0), (6.0, 8.0)));
  Assert((C*(-3.0)) = ((-3.0, -6.0), (-9.0, -12.0)));
  Assert((D*2.0) = ((2.0, -2.0), (-2.0, 2.0)));
  Assert((D*(-3.0)) = ((-3.0, 3.0), (3.0, -3.0)));

--  function "/" (Left : Real_Matrix;
--                Right : Real) return Real_Matrix; 
  Put_Line("  function '/' (Left : Real_Matrix;");
  Put_Line("                Right : Real) return Real_Matrix;");
  New_Line;
  Assert((C*F) = (3.0, 5.0));
  Assert((D*F) = (-3.0, 3.0));
  Assert((G*E) = (-4.0, -5.0, 5.5));
  Assert((G*F) = (3.0, 3.0, -3.0));
  Assert((Transpose(G)*A) = (3.0, -1.5));
  Assert((Transpose(G)*B) = (16.0, -2.5));

--  function "*" (Left : Real;
--                Right : Real_Matrix) return Real_Matrix; 
  Put_Line("  function '*' (Left : Real;");
  Put_Line("                Right : Real_Matrix) return Real_Matrix;");
  New_Line;
  Assert((2.0*C) = ((2.0, 4.0), (6.0, 8.0)));
  Assert((-3.0*C) = ((-3.0, -6.0), (-9.0, -12.0)));
  Assert((2.0*D) = ((2.0, -2.0), (-2.0, 2.0)));
  Assert((-3.0*D) = ((-3.0, 3.0), (3.0, -3.0)));

--  function "*" (Left : Real_Matrix;
--                Right : Real) return Real_Matrix; 
  Put_Line("  function '*' (Left : Real_Matrix; ");
  Put_Line("                Right : Real) return Real_Matrix;");
  New_Line;
  Assert((C*2.0) = ((2.0, 4.0), (6.0, 8.0)));
  Assert((C*(-3.0)) = ((-3.0, -6.0), (-9.0, -12.0)));
  Assert((D*2.0) = ((2.0, -2.0), (-2.0, 2.0)));
  Assert((D*(-3.0)) = ((-3.0, 3.0), (3.0, -3.0)));

--  function "/" (Left : Real_Matrix;
--                Right : Real) return Real_Matrix; 
  Put_Line("  function '/' (Left : Real_Matrix;");
  Put_Line("                Right : Real) return Real_Matrix;");
  New_Line;
  Assert((C*F) = (3.0, 5.0));
  Assert((D*F) = (-3.0, 3.0));
  Assert((G*E) = (-4.0, -5.0, 5.5));
  Assert((G*F) = (3.0, 3.0, -3.0));
  Assert((Transpose(G)*A) = (3.0, -1.5));
  Assert((Transpose(G)*B) = (16.0, -2.5));

--  function Identity_Matrix (Order : Positive;
--                            First_1, First_2 : Integer := 1) return Real_Matrix;
  Put_Line("  function Identity_Matrix (Order : Positive;");
  Put_Line("                            First_1, First_2 : Integer := 1) return Real_Matrix;");
  New_Line;
  Assert(Identity_Matrix(3) = ((1.0, 0.0, 0.0), (0.0, 1.0, 0.0), (0.0, 0.0, 1.0)));
  Assert(Identity_Matrix(Order => 2, First_1 => 2, First_2 => 3) = ((1.0, 0.0), (0.0, 1.0)));

  Ada.Text_IO.Put("Number of failures: ");
  Ada.Integer_Text_IO.Put(Tests_Failed);

end Real_Arrays_Test;

