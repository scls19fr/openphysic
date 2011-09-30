with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Numerics.Generic_Elementary_Functions;
with Ada.Numerics.Generic_Complex_Types;
with Generic_Real_Arrays;
with Generic_Complex_Arrays;

use Ada.Text_IO;

procedure Complex_Arrays_Test is

  package Real_Arrays is new Generic_Real_Arrays(Float);
  package Complex_Types is new Ada.Numerics.Generic_Complex_Types(Float);
  use Real_Arrays;
  use Complex_Types;
  package Complex_Arrays is new Generic_Complex_Arrays(Float, Real_Vector, Real_Matrix, Complex);
  use Complex_Arrays;
  package Elementary_Functions is new Ada.Numerics.Generic_Elementary_Functions(Float);

  A: constant Complex_Vector(1..3) := ((-1.0, 0.0),
                                       ( 2.0, 1.0),
                                       ( 3.0,-1.0));
  B: constant Complex_Vector(2..4) := (( 2.0,-2.0),
                                       (-4.0, 3.0),
                                       ( 5.0, 2.0));
  C: constant Complex_Matrix(1..2, 1..2) := ((( 1.0, 4.0), ( 2.0, 3.0)),
                                             (( 3.0, 2.0), ( 4.0, 1.0)));
  D: constant Complex_Matrix(2..3, 3..4) := ((( 1.0,-1.0), (-1.0, 1.0)),
                                             ((-1.0, 1.0), ( 1.0,-1.0)));
  E: constant Complex_Vector(1..2) := (( 2.0, 2.0),
                                       (-3.0, 3.0));
  F: constant Complex_Vector(3..4) := (( 1.0, -2.0),
                                       ( 2.0, -1.0));
  G: constant Complex_Matrix(3..5, 3..4) := ((( 1.0,-0.5), ( 2.0, 2.0)),
                                             ((-1.0, 1.0), ( 1.0,-1.0)), 
                                             (( 2.0, 2.0), (-0.5, 1.0)));
  A_Scratch: Complex_Vector(1..3);
  C_Scratch: Complex_Matrix(1..2, 1..2);
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

  function Compare(X1, X2: in Complex_Matrix) return Boolean is
  begin
    for R in X1'Range(1) loop
      for C in X1'Range(2) loop
        if (Re(X1(R,C)) - Re(X2(X2'First(1)+(R-X1'First(1)), 
                                X2'First(2)+(C-X1'First(2))))) > 0.001 or
           (Im(X1(R,C)) - Im(X2(X2'First(1)+(R-X1'First(1)), 
                                X2'First(2)+(C-X1'First(2))))) > 0.001 then
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

  function Compare(X1, X2: in Float) return Boolean is
  begin
    if (abs (X1 - X2)) > 0.001 then
      return False;
    end if;
  return True;
  end Compare;

begin

--   function RE (X : COMPLEX_VECTOR) return REAL_VECTOR;
  Put_Line("   function RE (X : COMPLEX_VECTOR) return REAL_VECTOR;");
  New_Line;
  Assert((Re(A)) = (-1.0, 2.0, 3.0));
  Assert((Re(B)) = ( 2.0,-4.0, 5.0));

--   function IM (X : COMPLEX_VECTOR) return REAL_VECTOR; 
  Put_Line("   function IM (X : COMPLEX_VECTOR) return REAL_VECTOR; ");
  New_Line;
  Assert((Im(A)) = ( 0.0, 1.0,-1.0));
  Assert((Im(B)) = (-2.0, 3.0, 2.0));

--   procedure SET_RE (X  : in out COMPLEX_VECTOR;
--                     RE : in     REAL_VECTOR); 
  Put_Line("   procedure SET_RE (X  : in out COMPLEX_VECTOR; ");
  Put_Line("                     RE : in     REAL_VECTOR); ");
  New_Line;
  A_Scratch := ((0.0, 0.0), (0.0, 0.0), (0.0, 0.0));
  Set_Re(A_Scratch, Im(B));
  Assert(A_Scratch = ((-2.0, 0.0), (3.0, 0.0), (2.0, 0.0)));
  Set_Re(A_Scratch, Re(B));
  Assert(A_Scratch = (( 2.0, 0.0), (-4.0, 0.0), (5.0, 0.0)));

--   procedure SET_IM (X  : in out COMPLEX_VECTOR; 
--                     IM : in     REAL_VECTOR); 
  Put_Line("   procedure SET_IM (X  : in out COMPLEX_VECTOR; "); 
  Put_Line("                     IM : in     REAL_VECTOR); ");
  New_Line;
  A_Scratch := ((0.0, 0.0), (0.0, 0.0), (0.0, 0.0));
  Set_Im(A_Scratch, Im(B));
  Assert(A_Scratch = ((0.0, -2.0), (0.0, 3.0), (0.0, 2.0)));
  Set_Im(A_Scratch, Re(B));
  Assert(A_Scratch = ((0.0, 2.0), (0.0, -4.0), (0.0, 5.0)));

--   function COMPOSE_FROM_CARTESIAN
--      (RE : REAL_VECTOR) return COMPLEX_VECTOR;
  Put_Line("   function COMPOSE_FROM_CARTESIAN");
  Put_Line("      (RE : REAL_VECTOR) return COMPLEX_VECTOR; ");
  New_Line;
  A_Scratch := ((0.0, 0.0), (0.0, 0.0), (0.0, 0.0));
  A_Scratch := Compose_From_Cartesian((1.0, 2.0, 3.0));
  Assert(A_Scratch = ((1.0, 0.0), (2.0, 0.0), (3.0, 0.0)));
  A_Scratch := Compose_From_Cartesian(Re(B));
  Assert(A_Scratch = ((2.0, 0.0), (-4.0, 0.0), (5.0, 0.0)));
  
--   function COMPOSE_FROM_CARTESIAN
--      (RE, IM : REAL_VECTOR) return COMPLEX_VECTOR;
  Put_Line("   function COMPOSE_FROM_CARTESIAN");
  Put_Line("      (RE, IM : REAL_VECTOR) return COMPLEX_VECTOR; ");
  New_Line;
  A_Scratch := ((0.0, 0.0), (0.0, 0.0), (0.0, 0.0));
  A_Scratch := Compose_From_Cartesian(Re(A), Im(A));
  Assert(A_Scratch = A);
  A_Scratch := Compose_From_Cartesian(Re(B), Im(B));
  Assert(A_Scratch = B);

--   function MODULUS (X : COMPLEX_VECTOR) return REAL_VECTOR;
--   function "abs" (RIGHT : COMPLEX_VECTOR) return REAL_VECTOR
--      renames MODULUS;
  Put_Line("   function MODULUS (X : COMPLEX_VECTOR) return REAL_VECTOR; ");
  Put_Line("   function 'abs' (RIGHT : COMPLEX_VECTOR) return REAL_VECTOR");
  Put_Line("      renames MODULUS; ");
  New_Line;
  Assert(Modulus(Complex_Vector'(( 3.0, 4.0),
                                 (-4.0, 3.0),
                                 ( 4.0,-3.0),
                                 (-3.0,-4.0)))
         = Real_Vector'(5.0, 5.0, 5.0, 5.0));
  Assert(abs Complex_Vector'(( 3.0, 4.0),
                             (-4.0, 3.0),
                             ( 4.0,-3.0),
                             (-3.0,-4.0))
         = Real_Vector'(5.0, 5.0, 5.0, 5.0));

--   function ARGUMENT (X : COMPLEX_VECTOR) return REAL_VECTOR;
  Put_Line("   function ARGUMENT (X : COMPLEX_VECTOR) return REAL_VECTOR; ");
  New_Line;
  Assert(Compare(Argument(Complex_Vector'(( 2.0, 1.0),
                                          ( 1.0, 2.0),
                                          (-1.0, 2.0),
                                          (-2.0, 1.0),
                                          (-2.0,-1.0),
                                          (-1.0,-2.0),
                                          ( 1.0,-2.0),
                                          ( 2.0,-1.0))),
                 Real_Vector'(Argument(( 2.0, 1.0)),
                              Argument(( 1.0, 2.0)),
                              Argument((-1.0, 2.0)),
                              Argument((-2.0, 1.0)),
                              Argument((-2.0,-1.0)),
                              Argument((-1.0,-2.0)),
                              Argument(( 1.0,-2.0)),
                              Argument(( 2.0,-1.0)))));

--   function ARGUMENT (X     : COMPLEX_VECTOR;
--                      CYCLE : REAL) return REAL_VECTOR;
  Put_Line("   function ARGUMENT (X     : COMPLEX_VECTOR; ");
  Put_Line("                      CYCLE : REAL) return REAL_VECTOR; ");
  New_Line;
  Assert(Compare(Argument(Complex_Vector'(( 2.0, 1.0),
                                          ( 1.0, 2.0),
                                          (-1.0, 2.0),
                                          (-2.0, 1.0),
                                          (-2.0,-1.0),
                                          (-1.0,-2.0),
                                          ( 1.0,-2.0),
                                          ( 2.0,-1.0)), Cycle => 3.0),
                 Real_Vector'(Argument(( 2.0, 1.0), Cycle => 3.0),
                              Argument(( 1.0, 2.0), Cycle => 3.0),
                              Argument((-1.0, 2.0), Cycle => 3.0),
                              Argument((-2.0, 1.0), Cycle => 3.0),
                              Argument((-2.0,-1.0), Cycle => 3.0),
                              Argument((-1.0,-2.0), Cycle => 3.0),
                              Argument(( 1.0,-2.0), Cycle => 3.0),
                              Argument(( 2.0,-1.0), Cycle => 3.0))));

--   function COMPOSE_FROM_POLAR
--      (MODULUS, ARGUMENT : REAL_VECTOR) return COMPLEX_VECTOR;
  Put_Line("   function COMPOSE_FROM_POLAR");
  Put_Line("      (MODULUS, ARGUMENT : REAL_VECTOR) return COMPLEX_VECTOR; ");
  New_Line;
  Assert(Compare(Compose_From_Polar(Real_Vector'(1.0, 2.0, 3.0, 4.0),
                                    Real_Vector'(1.0, 2.0, 3.0, 4.0)),
                 Complex_Vector'(Compose_From_Polar(1.0, 1.0),
                                 Compose_From_Polar(2.0, 2.0),
                                 Compose_From_Polar(3.0, 3.0),
                                 Compose_From_Polar(4.0, 4.0))));

--   function COMPOSE_FROM_POLAR
--      (MODULUS, ARGUMENT : REAL_VECTOR;
--       CYCLE             : REAL) return COMPLEX_VECTOR;
  Put_Line("   function COMPOSE_FROM_POLAR");
  Put_Line("      (MODULUS, ARGUMENT : REAL_VECTOR; ");
  Put_Line("       CYCLE             : REAL) return COMPLEX_VECTOR; ");
  New_Line;
  Assert(Compare(Compose_From_Polar(Real_Vector'(1.0, 2.0, 3.0, 4.0),
                                    Real_Vector'(1.0, 2.0, 3.0, 4.0),
                                    Cycle => 3.0),
                 Complex_Vector'(Compose_From_Polar(1.0, 1.0, Cycle => 3.0),
                                 Compose_From_Polar(2.0, 2.0, Cycle => 3.0),
                                 Compose_From_Polar(3.0, 3.0, Cycle => 3.0),
                                 Compose_From_Polar(4.0, 4.0, Cycle => 3.0))));

--   function "+" (RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR; 
  Put_Line("   function '+' (RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR; ");
  New_Line;
  Assert((+A) = ((-1.0, 0.0), ( 2.0, 1.0), ( 3.0,-1.0)));
  Assert((+B) = (( 2.0,-2.0), (-4.0, 3.0), ( 5.0, 2.0)));
  Assert((+E) = (( 2.0, 2.0), (-3.0, 3.0)));
  Assert((+F) = (( 1.0,-2.0), ( 2.0,-1.0)));

--   function "-" (RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR;
  Put_Line("   function '-' (RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR; ");
  New_Line;
  Assert((-A) = (( 1.0,-0.0), (-2.0,-1.0), (-3.0, 1.0)));
  Assert((-B) = ((-2.0, 2.0), ( 4.0,-3.0), (-5.0,-2.0)));
  Assert((-E) = ((-2.0,-2.0), ( 3.0,-3.0)));
  Assert((-F) = ((-1.0, 2.0), (-2.0, 1.0)));

--   function CONJUGATE (X : COMPLEX_VECTOR) return COMPLEX_VECTOR; 
  Put_Line("   function CONJUGATE (X : COMPLEX_VECTOR) return COMPLEX_VECTOR; ");
  New_Line;
  Assert(Conjugate(A) = ((-1.0,-0.0), ( 2.0,-1.0), ( 3.0, 1.0)));
  Assert(Conjugate(B) = (( 2.0, 2.0), (-4.0,-3.0), ( 5.0,-2.0)));
  Assert(Conjugate(E) = (( 2.0,-2.0), (-3.0,-3.0)));
  Assert(Conjugate(F) = (( 1.0, 2.0), ( 2.0, 1.0)));

--   function "+" (LEFT, RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR;
  Put_Line("   function '+' (LEFT, RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR; ");
  New_Line;
  Assert((A+B) = (( 1.0,-2.0), (-2.0, 4.0), ( 8.0, 1.0)));
  Assert((B+A) = (( 1.0,-2.0), (-2.0, 4.0), ( 8.0, 1.0)));
  Assert((E+F) = (( 3.0, 0.0), (-1.0, 2.0)));
  Assert((F+E) = (( 3.0, 0.0), (-1.0, 2.0)));

--   function "-" (LEFT, RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR; 
  Put_Line("   function '-' (LEFT, RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR; ");
  New_Line;
  Assert((A-B) = ((-3.0, 2.0), ( 6.0,-2.0), (-2.0,-3.0)));
  Assert((B-A) = (( 3.0,-2.0), (-6.0, 2.0), ( 2.0, 3.0)));
  Assert((E-F) = (( 1.0, 4.0), (-5.0, 4.0)));
  Assert((F-E) = ((-1.0,-4.0), ( 5.0,-4.0)));

--   function "*" (LEFT, RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR;
  Put_Line("   function '*' (LEFT, RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR; ");
  New_Line;
  Assert(Complex_Vector'(A*B) = (( -2.0,  2.0), (-11.0,  2.0), ( 17.0,  1.0)));
  Assert(Complex_Vector'(B*A) = (( -2.0,  2.0), (-11.0,  2.0), ( 17.0,  1.0)));
  Assert(Complex_Vector'(E*F) = ((  6.0, -2.0), ( -3.0,  9.0)));
  Assert(Complex_Vector'(F*E) = ((  6.0, -2.0), ( -3.0,  9.0)));

--   function "/" (LEFT, RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR; 
  Put_Line("   function '/' (LEFT, RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR; ");
  New_Line;
  Assert((A/B) = ((-0.25, -0.25), (-0.2, -0.4), ((3.0, -1.0)/(5.0, 2.0))));
  Assert((B/A) = ((-2.0, 2.0), (-1.0, 2.0), (1.3, 1.1)));
  Assert((E/F) = ((-0.4, 1.2), ( -1.8, 0.6)));
  Assert((F/E) = ((-0.25, -0.75), ((2.0, -1.0)/(-3.0, 3.0))));

--   function "**" (LEFT  : COMPLEX_VECTOR;
--                  RIGHT : INTEGER) return COMPLEX_VECTOR; 
  Put_Line("   function '**' (LEFT  : COMPLEX_VECTOR; ");
  Put_Line("                  RIGHT : INTEGER) return COMPLEX_VECTOR; ");
  New_Line;
  Assert((A**2) = (( 1.0, 0.0), ( 3.0, 4.0), ( 8.0,-6.0)));
  Assert((B**2) = (( 0.0,-8.0), ( 7.0,-24.0), (21.0,20.0)));
  Assert((E**2) = (( 0.0, 8.0), ( 0.0,-18.0)));
  Assert((F**2) = ((-3.0,-4.0), ( 3.0,-4.0)));

--   function "*" (LEFT, RIGHT : COMPLEX_VECTOR) return COMPLEX;
  Put_Line("   function '*' (LEFT, RIGHT : COMPLEX_VECTOR) return COMPLEX; ");
  New_Line;
  Assert(Complex'(A*B) = (4.0, 5.0));
  Assert(Complex'(B*A) = (4.0, 5.0));
  Assert(Complex'(E*F) = (3.0, 7.0));
  Assert(Complex'(F*E) = (3.0, 7.0));

--   function "+" (LEFT  : REAL_VECTOR;
--                 RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR;
  Put_Line("   function '+' (LEFT  : REAL_VECTOR; ");
  Put_Line("                 RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR; ");
  New_Line;
  Assert((Re(A)+B) = (( 1.0,-2.0), (-2.0, 3.0), ( 8.0, 2.0)));
  Assert((Re(B)+A) = (( 1.0, 0.0), (-2.0, 1.0), ( 8.0,-1.0)));
  Assert((Re(E)+F) = (( 3.0,-2.0), (-1.0,-1.0)));
  Assert((Re(F)+E) = (( 3.0, 2.0), (-1.0, 3.0)));

--   function "+" (LEFT  : COMPLEX_VECTOR;
--                 RIGHT : REAL_VECTOR) return COMPLEX_VECTOR;
  Put_Line("   function '+' (LEFT  : COMPLEX_VECTOR; ");
  Put_Line("                 RIGHT : REAL_VECTOR) return COMPLEX_VECTOR; ");
  New_Line;
  Assert((B+Re(A)) = (( 1.0,-2.0), (-2.0, 3.0), ( 8.0, 2.0)));
  Assert((A+Re(B)) = (( 1.0, 0.0), (-2.0, 1.0), ( 8.0,-1.0)));
  Assert((F+Re(E)) = (( 3.0,-2.0), (-1.0,-1.0)));
  Assert((E+Re(F)) = (( 3.0, 2.0), (-1.0, 3.0)));

--   function "-" (LEFT  : REAL_VECTOR;
--                 RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR;
  Put_Line("   function '-' (LEFT  : REAL_VECTOR; ");
  Put_Line("                 RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR; ");
  New_Line;
  Assert((Re(A)-B) = ((-3.0, 2.0), ( 6.0,-3.0), (-2.0,-2.0)));
  Assert((Re(B)-A) = (( 3.0, 0.0), (-6.0,-1.0), ( 2.0, 1.0)));
  Assert((Re(E)-F) = (( 1.0, 2.0), (-5.0, 1.0)));
  Assert((Re(F)-E) = ((-1.0,-2.0), ( 5.0,-3.0)));

--   function "-" (LEFT  : COMPLEX_VECTOR;
--                 RIGHT : REAL_VECTOR) return COMPLEX_VECTOR;
  Put_Line("   function '-' (LEFT  : COMPLEX_VECTOR; ");
  Put_Line("                 RIGHT : REAL_VECTOR) return COMPLEX_VECTOR; ");
  New_Line;
  Assert((B-Re(A)) = (( 3.0,-2.0), (-6.0, 3.0), ( 2.0, 2.0)));
  Assert((A-Re(B)) = ((-3.0, 0.0), ( 6.0, 1.0), (-2.0,-1.0)));
  Assert((F-Re(E)) = ((-1.0,-2.0), ( 5.0,-1.0)));
  Assert((E-Re(F)) = (( 1.0, 2.0), (-5.0, 3.0)));

--   function "*" (LEFT  : REAL_VECTOR;
--                 RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR;
  Put_Line("   function '*' (LEFT  : REAL_VECTOR; ");
  Put_Line("                 RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR; ");
  New_Line;
  Assert(Complex_Vector'(Re(A)*B) = ((-2.0, 2.0), (-8.0, 6.0), (15.0, 6.0)));
  Assert(Complex_Vector'(Re(B)*A) = ((-2.0, 0.0), (-8.0,-4.0), (15.0,-5.0)));
  Assert(Complex_Vector'(Re(E)*F) = (( 2.0,-4.0), (-6.0, 3.0)));
  Assert(Complex_Vector'(Re(F)*E) = (( 2.0, 2.0), (-6.0, 6.0)));

--   function "*" (LEFT  : COMPLEX_VECTOR;
--                 RIGHT : REAL_VECTOR) return COMPLEX_VECTOR;
  Put_Line("   function '*' (LEFT  : COMPLEX_VECTOR; ");
  Put_Line("                 RIGHT : REAL_VECTOR) return COMPLEX_VECTOR; ");
  New_Line;
  Assert(Complex_Vector'(B*Re(A)) = ((-2.0, 2.0), (-8.0, 6.0), (15.0, 6.0)));
  Assert(Complex_Vector'(A*Re(B)) = ((-2.0, 0.0), (-8.0,-4.0), (15.0,-5.0)));
  Assert(Complex_Vector'(F*Re(E)) = (( 2.0,-4.0), (-6.0, 3.0)));
  Assert(Complex_Vector'(E*Re(F)) = (( 2.0, 2.0), (-6.0, 6.0)));

--   function "/" (LEFT  : REAL_VECTOR;
--                 RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR;
  Put_Line("   function '/' (LEFT  : REAL_VECTOR; ");
  Put_Line("                 RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR; ");
  New_Line;
  Assert(Complex_Vector'(Re(A)/B) = ((-0.25,-0.25), (-0.32,-0.24), 3.0/(5.0, 2.0)));
  Assert(Complex_Vector'(Re(B)/A) = ((-2.0, 0.0), (-1.6, 0.8), (1.5, 0.5)));
  Assert(Complex_Vector'(Re(E)/F) = (( 0.4, 0.8), (-1.2,-0.6)));
  Assert(Complex_Vector'(Re(F)/E) = (( 0.25,-0.25), 2.0/(-3.0, 3.0)));

--   function "/" (LEFT  : COMPLEX_VECTOR;
--                 RIGHT : REAL_VECTOR) return COMPLEX_VECTOR;
  Put_Line("   function '/' (LEFT  : COMPLEX_VECTOR; ");
  Put_Line("                 RIGHT : REAL_VECTOR) return COMPLEX_VECTOR; ");
  New_Line;
  Assert(Complex_Vector'(B/Re(A)) = ((2.0, -2.0)/(-1.0), (-4.0, 3.0)/(2.0), (5.0, 2.0)/(3.0)));
  Assert(Complex_Vector'(A/Re(B)) = ((-1.0, 0.0)/(2.0), (2.0, 1.0)/(-4.0), (3.0, -1.0)/(5.0)));
  Assert(Complex_Vector'(F/Re(E)) = (( 1.0,-2.0)/(2.0), ( 2.0,-1.0)/(-3.0)));
  Assert(Complex_Vector'(E/Re(F)) = (( 2.0, 2.0)/(1.0), (-3.0, 3.0)/( 2.0)));

--   function "*" (LEFT  : REAL_VECTOR;
--                 RIGHT : COMPLEX_VECTOR) return COMPLEX;
  Put_Line("   function '*' (LEFT  : REAL_VECTOR; ");
  Put_Line("                 RIGHT : COMPLEX_VECTOR) return COMPLEX; ");
  New_Line;
  Assert(Complex'(Re(A)*B) = ( 5.0,14.0));
  Assert(Complex'(Re(B)*A) = ( 5.0,-9.0));
  Assert(Complex'(Re(E)*F) = (-4.0,-1.0));
  Assert(Complex'(Re(F)*E) = (-4.0, 8.0));

--   function "*" (LEFT  : COMPLEX_VECTOR;
--                 RIGHT : REAL_VECTOR) return COMPLEX;
  Put_Line("   function '*' (LEFT  : COMPLEX_VECTOR; ");
  Put_Line("                 RIGHT : REAL_VECTOR) return COMPLEX; ");
  New_Line;
  Assert(Complex'(B*Re(A)) = ( 5.0,14.0));
  Assert(Complex'(A*Re(B)) = ( 5.0,-9.0));
  Assert(Complex'(F*Re(E)) = (-4.0,-1.0));
  Assert(Complex'(E*Re(F)) = (-4.0, 8.0));

--   function "*" (LEFT  : COMPLEX;
--                 RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR; 
  Put_Line("   function '*' (LEFT  : COMPLEX; ");
  Put_Line("                 RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR; ");
  New_Line;
  Assert(Complex_Vector'(Complex'(1.0, 1.0)*A) = ((-1.0,-1.0), ( 1.0, 3.0), ( 4.0, 2.0)));
  Assert(Complex_Vector'(Complex'(1.0, 1.0)*B) = (( 4.0, 0.0), (-7.0,-1.0), ( 3.0, 7.0)));
  Assert(Complex_Vector'(Complex'(1.0, 1.0)*E) = (( 0.0, 4.0), (-6.0, 0.0)));
  Assert(Complex_Vector'(Complex'(1.0, 1.0)*F) = (( 3.0,-1.0), ( 3.0, 1.0)));

--   function "*" (LEFT  : COMPLEX_VECTOR;
--                 RIGHT : COMPLEX) return COMPLEX_VECTOR; 
  Put_Line("   function '*' (LEFT  : COMPLEX_VECTOR; ");
  Put_Line("                 RIGHT : COMPLEX) return COMPLEX_VECTOR; ");
  New_Line;
  Assert(Complex_Vector'(A*Complex'(1.0, 1.0)) = ((-1.0,-1.0), ( 1.0, 3.0), ( 4.0, 2.0)));
  Assert(Complex_Vector'(B*Complex'(1.0, 1.0)) = (( 4.0, 0.0), (-7.0,-1.0), ( 3.0, 7.0)));
  Assert(Complex_Vector'(E*Complex'(1.0, 1.0)) = (( 0.0, 4.0), (-6.0, 0.0)));
  Assert(Complex_Vector'(F*Complex'(1.0, 1.0)) = (( 3.0,-1.0), ( 3.0, 1.0)));

--   function "/" (LEFT  : COMPLEX_VECTOR;
--                 RIGHT : COMPLEX) return COMPLEX_VECTOR; 
  Put_Line("   function '/' (LEFT  : COMPLEX_VECTOR; ");
  Put_Line("                 RIGHT : COMPLEX) return COMPLEX_VECTOR; ");
  New_Line;
  Assert(Complex_Vector'(A/Complex'(0.5,-0.5)) = ((-1.0,-1.0), ( 1.0, 3.0), ( 4.0, 2.0)));
  Assert(Complex_Vector'(B/Complex'(0.5,-0.5)) = (( 4.0, 0.0), (-7.0,-1.0), ( 3.0, 7.0)));
  Assert(Complex_Vector'(E/Complex'(0.5,-0.5)) = (( 0.0, 4.0), (-6.0, 0.0)));
  Assert(Complex_Vector'(F/Complex'(0.5,-0.5)) = (( 3.0,-1.0), ( 3.0, 1.0)));

--   function "*" (LEFT  : REAL;
--                 RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR; 
  Put_Line("   function '*' (LEFT  : REAL; ");
  Put_Line("                 RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR; ");
  New_Line;
  Assert(Complex_Vector'((-2.0)*A) = (( 2.0, 0.0), (-4.0, -2.0), (-6.0, 2.0)));
  Assert(Complex_Vector'((-2.0)*B) = ((-4.0, 4.0), ( 8.0, -6.0), (-10.0,-4.0)));
  Assert(Complex_Vector'((-2.0)*E) = ((-4.0,-4.0), ( 6.0,-6.0)));
  Assert(Complex_Vector'((-2.0)*F) = ((-2.0, 4.0), (-4.0, 2.0)));

--   function "*" (LEFT  : COMPLEX_VECTOR;
--                 RIGHT : REAL) return COMPLEX_VECTOR; 
  Put_Line("   function '*' (LEFT  : COMPLEX_VECTOR; ");
  Put_Line("                 RIGHT : REAL) return COMPLEX_VECTOR; ");
  New_Line;
  Assert(Complex_Vector'(A*(-2.0)) = (( 2.0, 0.0), (-4.0, -2.0), (-6.0, 2.0)));
  Assert(Complex_Vector'(B*(-2.0)) = ((-4.0, 4.0), ( 8.0, -6.0), (-10.0,-4.0)));
  Assert(Complex_Vector'(E*(-2.0)) = ((-4.0,-4.0), ( 6.0,-6.0)));
  Assert(Complex_Vector'(F*(-2.0)) = ((-2.0, 4.0), (-4.0, 2.0)));

--   function "/" (LEFT  : COMPLEX_VECTOR;
--                 RIGHT : REAL) return COMPLEX_VECTOR; 
  Put_Line("   function '/' (LEFT  : COMPLEX_VECTOR; ");
  Put_Line("                 RIGHT : REAL) return COMPLEX_VECTOR; ");
  New_Line;
  Assert(Complex_Vector'(A/(-0.5)) = (( 2.0, 0.0), (-4.0, -2.0), (-6.0, 2.0)));
  Assert(Complex_Vector'(B/(-0.5)) = ((-4.0, 4.0), ( 8.0, -6.0), (-10.0,-4.0)));
  Assert(Complex_Vector'(E/(-0.5)) = ((-4.0,-4.0), ( 6.0,-6.0)));
  Assert(Complex_Vector'(F/(-0.5)) = ((-2.0, 4.0), (-4.0, 2.0)));

--   function UNIT_VECTOR (INDEX : INTEGER;
--                         ORDER : POSITIVE;
--                         FIRST : INTEGER := 1) return COMPLEX_VECTOR;
  Put_Line("   function UNIT_VECTOR (INDEX : INTEGER; ");
  Put_Line("                         ORDER : POSITIVE; ");
  Put_Line("                         FIRST : INTEGER := 1) return COMPLEX_VECTOR; ");
  New_Line;
  Assert(Unit_Vector(2, 3) = Complex_Vector'((0.0, 0.0), (1.0, 0.0), (0.0, 0.0)));
  Assert(Unit_Vector(Index => 4, Order => 4, First => 2) = Complex_Vector'((0.0, 0.0), (0.0, 0.0), (1.0, 0.0), (0.0, 0.0)));

--   function RE (X : COMPLEX_MATRIX) return REAL_MATRIX;
  Put_Line("   function RE (X : COMPLEX_MATRIX) return REAL_MATRIX; ");
  New_Line;
  Assert((Re(C)) = ((1.0, 2.0), (3.0, 4.0)));
  Assert((Re(D)) = ((1.0, -1.0), (-1.0, 1.0)));

--   function IM (X : COMPLEX_MATRIX) return REAL_MATRIX;
  Put_Line("   function IM (X : COMPLEX_MATRIX) return REAL_MATRIX; ");
  New_Line;
  Assert((Im(C)) = ((4.0, 3.0), (2.0, 1.0)));
  Assert((Im(D)) = ((-1.0, 1.0), (1.0, -1.0)));

--   procedure SET_RE (X  : in out COMPLEX_MATRIX;
--                     RE : in REAL_MATRIX);
  Put_Line("   procedure SET_RE (X  : in out COMPLEX_MATRIX; ");
  Put_Line("                     RE : in REAL_MATRIX); ");
  New_Line;
  C_Scratch := (((0.0, 0.0), (0.0, 0.0)), ((0.0, 0.0), (0.0, 0.0)));
  Set_Re(C_Scratch, Im(C));
  Assert(C_Scratch = (((4.0, 0.0), (3.0, 0.0)),
                      ((2.0, 0.0), (1.0, 0.0))));
  Set_Re(C_Scratch, Re(C));
  Assert(C_Scratch = (((1.0, 0.0), (2.0, 0.0)),
                      ((3.0, 0.0), (4.0, 0.0))));

--   procedure SET_IM (X  : in out COMPLEX_MATRIX;
--                     IM : in REAL_MATRIX);
  Put_Line("   procedure SET_IM (X  : in out COMPLEX_MATRIX; ");
  Put_Line("                     IM : in REAL_MATRIX); ");
  New_Line;
  C_Scratch := (((0.0, 0.0), (0.0, 0.0)), ((0.0, 0.0), (0.0, 0.0)));
  Set_Im(C_Scratch, Im(C));
  Assert(C_Scratch = (((0.0, 4.0), (0.0, 3.0)),
                      ((0.0, 2.0), (0.0, 1.0))));
  Set_Im(C_Scratch, Re(C));
  Assert(C_Scratch = (((0.0, 1.0), (0.0, 2.0)),
                      ((0.0, 3.0), (0.0, 4.0))));

--   function COMPOSE_FROM_CARTESIAN
--      (RE : REAL_MATRIX) return COMPLEX_MATRIX; 
  Put_Line("   function COMPOSE_FROM_CARTESIAN");
  Put_Line("      (RE : REAL_MATRIX) return COMPLEX_MATRIX; ");
  New_Line;
  C_Scratch := (((0.0, 0.0), (0.0, 0.0)), ((0.0, 0.0), (0.0, 0.0)));
  C_Scratch := Compose_From_Cartesian(((1.0, 2.0), (3.0, 4.0)));
  Assert(C_Scratch = (((1.0, 0.0), (2.0, 0.0)),
                      ((3.0, 0.0), (4.0, 0.0))));
  C_Scratch := Compose_From_Cartesian(Re(D));
  Assert(C_Scratch = ((( 1.0, 0.0), (-1.0, 0.0)),
                      ((-1.0, 0.0), ( 1.0, 0.0))));

--   function COMPOSE_FROM_CARTESIAN
--      (RE, IM : REAL_MATRIX) return COMPLEX_MATRIX;
  Put_Line("   function COMPOSE_FROM_CARTESIAN");
  Put_Line("      (RE, IM : REAL_MATRIX) return COMPLEX_MATRIX; ");
  New_Line;
  C_Scratch := (((0.0, 0.0), (0.0, 0.0)), ((0.0, 0.0), (0.0, 0.0)));
  C_Scratch := Compose_From_Cartesian(Re(C), Im(C));
  Assert(C_Scratch = C);
  C_Scratch := Compose_From_Cartesian(Re(D), Im(D));
  Assert(C_Scratch = D);

--   function MODULUS (X : COMPLEX_MATRIX) return REAL_MATRIX; ");
--   function "abs" (RIGHT : COMPLEX_MATRIX) return REAL_MATRIX
--      renames MODULUS;
  Put_Line("   function MODULUS (X : COMPLEX_MATRIX) return REAL_MATRIX; ");
  Put_Line("   function 'abs' (RIGHT : COMPLEX_MATRIX) return REAL_MATRIX");
  Put_Line("      renames MODULUS; ");
  New_Line;
  Assert(Modulus(((( 3.0, 4.0), (-4.0, 3.0)),
                  (( 4.0,-3.0), (-3.0,-4.0))))
         = Real_Matrix'((5.0, 5.0), (5.0, 5.0)));
  Assert(abs Complex_Matrix'((( 3.0, 4.0), (-4.0, 3.0)),
                             (( 4.0,-3.0), (-3.0,-4.0)))
         = Real_Matrix'((5.0, 5.0), (5.0, 5.0)));

--   function ARGUMENT (X : COMPLEX_MATRIX) return REAL_MATRIX; 
  Put_Line("   function ARGUMENT (X : COMPLEX_MATRIX) return REAL_MATRIX; ");
  New_Line;
  Assert(Compare(Argument(Complex_Matrix'((( 2.0, 1.0), ( 1.0, 2.0)),
                                          ((-1.0, 2.0), (-2.0, 1.0)),
                                          ((-2.0,-1.0), (-1.0,-2.0)),
                                          (( 1.0,-2.0), ( 2.0,-1.0)))),
                 Real_Matrix'((Argument(( 2.0, 1.0)), Argument(( 1.0, 2.0))),
                              (Argument((-1.0, 2.0)), Argument((-2.0, 1.0))),
                              (Argument((-2.0,-1.0)), Argument((-1.0,-2.0))),
                              (Argument(( 1.0,-2.0)), Argument(( 2.0,-1.0))))));

--   function ARGUMENT (X     : COMPLEX_MATRIX;
--                      CYCLE : REAL) return REAL_MATRIX; 
  Put_Line("   function ARGUMENT (X     : COMPLEX_MATRIX; ");
  Put_Line("                      CYCLE : REAL) return REAL_MATRIX; ");
  New_Line;
  Assert(Compare(Argument(Complex_Matrix'((( 2.0, 1.0), ( 1.0, 2.0)),
                                          ((-1.0, 2.0), (-2.0, 1.0)),
                                          ((-2.0,-1.0), (-1.0,-2.0)),
                                          (( 1.0,-2.0), ( 2.0,-1.0))),
                          Cycle => 3.0),
                 Real_Matrix'((Argument(( 2.0, 1.0), Cycle => 3.0), Argument(( 1.0, 2.0), Cycle => 3.0)),
                              (Argument((-1.0, 2.0), Cycle => 3.0), Argument((-2.0, 1.0), Cycle => 3.0)),
                              (Argument((-2.0,-1.0), Cycle => 3.0), Argument((-1.0,-2.0), Cycle => 3.0)),
                              (Argument(( 1.0,-2.0), Cycle => 3.0), Argument(( 2.0,-1.0), Cycle => 3.0)))));

--   function COMPOSE_FROM_POLAR
--      (MODULUS, ARGUMENT : REAL_MATRIX) return COMPLEX_MATRIX; 
  Put_Line("   function COMPOSE_FROM_POLAR");
  Put_Line("      (MODULUS, ARGUMENT : REAL_MATRIX) return COMPLEX_MATRIX; ");
  New_Line;
  Assert(Compare(Compose_From_Polar(Real_Matrix'((1.0, 2.0),
                                                 (3.0, 4.0)),
                                    Real_Matrix'((1.0, 2.0),
                                                 (3.0, 4.0))),
                 Complex_Matrix'((Compose_From_Polar(1.0, 1.0), Compose_From_Polar(2.0, 2.0)),
                                 (Compose_From_Polar(3.0, 3.0), Compose_From_Polar(4.0, 4.0)))));

--   function COMPOSE_FROM_POLAR
--      (MODULUS, ARGUMENT : REAL_MATRIX;
--       CYCLE             : REAL) return COMPLEX_MATRIX;
  Put_Line("   function COMPOSE_FROM_POLAR");
  Put_Line("      (MODULUS, ARGUMENT : REAL_MATRIX; ");
  Put_Line("       CYCLE             : REAL) return COMPLEX_MATRIX; ");
  New_Line;
  Assert(Compare(Compose_From_Polar(Real_Matrix'((1.0, 2.0),
                                                 (3.0, 4.0)),
                                    Real_Matrix'((1.0, 2.0),
                                                 (3.0, 4.0)),
                                    Cycle => 3.0),
                 Complex_Matrix'((Compose_From_Polar(1.0, 1.0, Cycle => 3.0), Compose_From_Polar(2.0, 2.0, Cycle => 3.0)),
                                 (Compose_From_Polar(3.0, 3.0, Cycle => 3.0), Compose_From_Polar(4.0, 4.0, Cycle => 3.0)))));

--   function "+" (RIGHT : COMPLEX_MATRIX) return COMPLEX_MATRIX; ");
  Put_Line("   function '+' (RIGHT : COMPLEX_MATRIX) return COMPLEX_MATRIX; ");
  New_Line;
  Assert((+C) = ((( 1.0, 4.0), ( 2.0, 3.0)),
                 (( 3.0, 2.0), ( 4.0, 1.0))));
  Assert((+D) = ((( 1.0,-1.0), (-1.0, 1.0)),
                 ((-1.0, 1.0), ( 1.0,-1.0))));
  Assert((+G) = ((( 1.0,-0.5), ( 2.0, 2.0)),
                 ((-1.0, 1.0), ( 1.0,-1.0)),
                 (( 2.0, 2.0), (-0.5, 1.0))));

--   function "-" (RIGHT : COMPLEX_MATRIX) return COMPLEX_MATRIX; ");
  Put_Line("   function '-' (RIGHT : COMPLEX_MATRIX) return COMPLEX_MATRIX; ");
  New_Line;
  Assert((-C) = (((-1.0,-4.0), (-2.0,-3.0)),
                 ((-3.0,-2.0), (-4.0,-1.0))));
  Assert((-D) = (((-1.0, 1.0), ( 1.0,-1.0)),
                 (( 1.0,-1.0), (-1.0, 1.0))));
  Assert((-G) = (((-1.0, 0.5), (-2.0,-2.0)),
                 (( 1.0,-1.0), (-1.0, 1.0)),
                 ((-2.0,-2.0), ( 0.5,-1.0))));

--   function CONJUGATE (X : COMPLEX_MATRIX) return COMPLEX_MATRIX; ");
  Put_Line("   function CONJUGATE (X : COMPLEX_MATRIX) return COMPLEX_MATRIX; ");
  New_Line;
  Assert(Conjugate(C) = ((( 1.0,-4.0), ( 2.0,-3.0)),
                         (( 3.0,-2.0), ( 4.0,-1.0))));
  Assert(Conjugate(D) = ((( 1.0, 1.0), (-1.0,-1.0)),
                         ((-1.0,-1.0), ( 1.0, 1.0))));
  Assert(Conjugate(G) = ((( 1.0, 0.5), ( 2.0,-2.0)),
                         ((-1.0,-1.0), ( 1.0, 1.0)),
                         (( 2.0,-2.0), (-0.5,-1.0))));

--   function TRANSPOSE (X : COMPLEX_MATRIX) return COMPLEX_MATRIX; ");
  Put_Line("   function TRANSPOSE (X : COMPLEX_MATRIX) return COMPLEX_MATRIX; ");
  New_Line;
  Assert(Transpose(C) = ((( 1.0, 4.0), ( 3.0, 2.0)),
                         (( 2.0, 3.0), ( 4.0, 1.0))));
  Assert(Transpose(D) = D);

--   function "+" (LEFT, RIGHT : COMPLEX_MATRIX) return COMPLEX_MATRIX; ");
  Put_Line("   function '+' (LEFT, RIGHT : COMPLEX_MATRIX) return COMPLEX_MATRIX; ");
  New_Line;
  Assert((C+D) = ((( 2.0, 3.0), ( 1.0, 4.0)),
                  (( 2.0, 3.0), ( 5.0, 0.0))));
  Assert((D+C) = ((( 2.0, 3.0), ( 1.0, 4.0)),
                  (( 2.0, 3.0), ( 5.0, 0.0))));

--   function "-" (LEFT, RIGHT : COMPLEX_MATRIX) return COMPLEX_MATRIX; ");
  Put_Line("   function '-' (LEFT, RIGHT : COMPLEX_MATRIX) return COMPLEX_MATRIX; ");
  New_Line;
  Assert((C-D) = ((( 0.0, 5.0), ( 3.0, 2.0)),
                  (( 4.0, 1.0), ( 3.0, 2.0))));
  Assert((D-C) = ((( 0.0,-5.0), (-3.0,-2.0)),
                  ((-4.0,-1.0), (-3.0,-2.0))));

--   function "*" (LEFT, RIGHT : COMPLEX_MATRIX) return COMPLEX_MATRIX; ");
  Put_Line("   function '*' (LEFT, RIGHT : COMPLEX_MATRIX) return COMPLEX_MATRIX; ");
  New_Line;
  Assert((C*D) = ((( 0.0, 2.0), ( 0.0,-2.0)),
                  (( 0.0, 2.0), ( 0.0,-2.0))));
  Assert((D*C) = ((( 0.0, 4.0), ( 0.0, 4.0)),
                  (( 0.0,-4.0), ( 0.0,-4.0))));

--   function "*" (LEFT, RIGHT : COMPLEX_VECTOR) return COMPLEX_MATRIX; ");
  Put_Line("   function '*' (LEFT, RIGHT : COMPLEX_VECTOR) return COMPLEX_MATRIX; ");
  New_Line;
  Assert(Complex_Matrix'(A*B) = ((( -2.0,  2.0), (  4.0, -3.0), ( -5.0, -2.0)),
                                 ((  6.0, -2.0), (-11.0,  2.0), (  8.0,  9.0)),
                                 ((  4.0, -8.0), ( -9.0, 13.0), ( 17.0,  1.0))));
  Assert(Complex_Matrix'(B*A) = ((( -2.0,  2.0), (  6.0, -2.0), (  4.0, -8.0)),
                                 ((  4.0, -3.0), (-11.0,  2.0), ( -9.0, 13.0)),
                                 (( -5.0, -2.0), (  8.0,  9.0), ( 17.0,  1.0))));

--   function "*" (LEFT  : COMPLEX_VECTOR;
--                 RIGHT : COMPLEX_MATRIX) return COMPLEX_VECTOR;
  Put_Line("   function '*' (LEFT  : COMPLEX_VECTOR; ");
  Put_Line("                 RIGHT : COMPLEX_MATRIX) return COMPLEX_VECTOR; ");
  New_Line;
  Assert((E*C) = ((-21.0,  13.0), (-17.0, 19.0)));
  Assert((E*D) = ((  4.0,  -6.0), ( -4.0,  6.0)));
  Assert((F*C) = (( 17.0,   3.0), ( 17.0, -3.0)));
  Assert((F*D) = (( -2.0,   0.0), (  2.0,  0.0)));

--   function "*" (LEFT  : COMPLEX_MATRIX;
--                 RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR;
  Put_Line("   function '*' (LEFT  : COMPLEX_MATRIX; ");
  Put_Line("                 RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR; ");
  New_Line;
  Assert((C*E) = ((-21.0,   7.0), (-13.0, 19.0)));
  Assert((D*E) = ((  4.0,  -6.0), ( -4.0,  6.0)));
  Assert((C*F) = (( 16.0,   6.0), ( 16.0, -6.0)));
  Assert((D*F) = (( -2.0,   0.0), (  2.0,  0.0)));

--   function "+" (LEFT  : REAL_MATRIX;
--                 RIGHT : COMPLEX_MATRIX) return COMPLEX_MATRIX; 
  Put_Line("   function '+' (LEFT  : REAL_MATRIX; ");
  Put_Line("                 RIGHT : COMPLEX_MATRIX) return COMPLEX_MATRIX; ");
  New_Line;
  Assert((Re(C)+D) = ((( 2.0,-1.0), ( 1.0, 1.0)),
                      (( 2.0, 1.0), ( 5.0,-1.0))));
  Assert((Re(D)+C) = ((( 2.0, 4.0), ( 1.0, 3.0)),
                      (( 2.0, 2.0), ( 5.0, 1.0))));

--   function "+" (LEFT  : COMPLEX_MATRIX;
--                 RIGHT : REAL_MATRIX) return COMPLEX_MATRIX; 
  Put_Line("   function '+' (LEFT  : COMPLEX_MATRIX; ");
  Put_Line("                 RIGHT : REAL_MATRIX) return COMPLEX_MATRIX; ");
  New_Line;
  Assert((D+Re(C)) = ((( 2.0,-1.0), ( 1.0, 1.0)),
                      (( 2.0, 1.0), ( 5.0,-1.0))));
  Assert((C+Re(D)) = ((( 2.0, 4.0), ( 1.0, 3.0)),
                      (( 2.0, 2.0), ( 5.0, 1.0))));

--   function "-" (LEFT  : REAL_MATRIX;
--                 RIGHT : COMPLEX_MATRIX) return COMPLEX_MATRIX; 
  Put_Line("   function '-' (LEFT  : REAL_MATRIX; ");
  Put_Line("                 RIGHT : COMPLEX_MATRIX) return COMPLEX_MATRIX; ");
  New_Line;
  Assert((Re(C)-D) = ((( 0.0, 1.0), ( 3.0,-1.0)),
                      (( 4.0,-1.0), ( 3.0, 1.0))));
  Assert((Re(D)-C) = ((( 0.0,-4.0), (-3.0,-3.0)),
                      ((-4.0,-2.0), (-3.0,-1.0))));

--   function "-" (LEFT  : COMPLEX_MATRIX;
--                 RIGHT : REAL_MATRIX) return COMPLEX_MATRIX; 
  Put_Line("   function '-' (LEFT  : COMPLEX_MATRIX; ");
  Put_Line("                 RIGHT : REAL_MATRIX) return COMPLEX_MATRIX; ");
  New_Line;
  Assert((D-Re(C)) = ((( 0.0,-1.0), (-3.0, 1.0)),
                      ((-4.0, 1.0), (-3.0,-1.0))));
  Assert((C-Re(D)) = ((( 0.0, 4.0), ( 3.0, 3.0)),
                      (( 4.0, 2.0), ( 3.0, 1.0))));

--   function "*" (LEFT  : REAL_MATRIX;
--                 RIGHT : COMPLEX_MATRIX) return COMPLEX_MATRIX; 
  Put_Line("   function '*' (LEFT  : REAL_MATRIX; ");
  Put_Line("                 RIGHT : COMPLEX_MATRIX) return COMPLEX_MATRIX; ");
  New_Line;
  Assert((Re(C)*D) = (((-1.0, 1.0), ( 1.0,-1.0)),
                      ((-1.0, 1.0), ( 1.0,-1.0))));
  Assert((Re(D)*C) = (((-2.0, 2.0), (-2.0, 2.0)),
                      (( 2.0,-2.0), ( 2.0,-2.0))));

--   function "*" (LEFT  : COMPLEX_MATRIX;
--                 RIGHT : REAL_MATRIX) return COMPLEX_MATRIX; 
  Put_Line("   function '*' (LEFT  : COMPLEX_MATRIX; ");
  Put_Line("                 RIGHT : REAL_MATRIX) return COMPLEX_MATRIX; ");
  New_Line;
  Assert((C*Re(D)) = (((-1.0, 1.0), ( 1.0,-1.0)),
                      ((-1.0, 1.0), ( 1.0,-1.0))));
  Assert((D*Re(C)) = (((-2.0, 2.0), (-2.0, 2.0)),
                      (( 2.0,-2.0), ( 2.0,-2.0))));

--   function "*" (LEFT  : REAL_VECTOR;
--                 RIGHT : COMPLEX_VECTOR) return COMPLEX_MATRIX; 
  Put_Line("   function '*' (LEFT  : REAL_VECTOR; ");
  Put_Line("                 RIGHT : COMPLEX_VECTOR) return COMPLEX_MATRIX; ");
  New_Line;
  Assert(Complex_Matrix'(Re(A)*B) = ((( -2.0,  2.0), (  4.0, -3.0), ( -5.0, -2.0)),
                                     ((  4.0, -4.0), ( -8.0,  6.0), ( 10.0,  4.0)),
                                     ((  6.0, -6.0), (-12.0,  9.0), ( 15.0,  6.0))));   
  Assert(Complex_Matrix'(Re(B)*A) = ((( -2.0,  0.0), (  4.0,  2.0), (  6.0, -2.0)),
                                     ((  4.0,  0.0), ( -8.0, -4.0), (-12.0,  4.0)),
                                     (( -5.0,  0.0), ( 10.0,  5.0), ( 15.0, -5.0))));   

--   function "*" (LEFT  : COMPLEX_VECTOR;
--                 RIGHT : REAL_VECTOR) return COMPLEX_MATRIX; 
  Put_Line("   function '*' (LEFT  : COMPLEX_VECTOR; ");
  Put_Line("                 RIGHT : REAL_VECTOR) return COMPLEX_MATRIX; ");
  New_Line;

--   function "*" (LEFT  : REAL_VECTOR;
--                 RIGHT : COMPLEX_MATRIX) return COMPLEX_VECTOR; 
  Put_Line("   function '*' (LEFT  : REAL_VECTOR; ");
  Put_Line("                 RIGHT : COMPLEX_MATRIX) return COMPLEX_VECTOR; ");
  New_Line;
  Assert((Re(E)*C) = (( -7.0,   2.0), ( -8.0,  3.0)));
  Assert((Re(E)*D) = ((  5.0,  -5.0), ( -5.0,  5.0)));
  Assert((Re(F)*C) = ((  7.0,   8.0), ( 10.0,  5.0)));
  Assert((Re(F)*D) = (( -1.0,   1.0), (  1.0, -1.0)));

--   function "*" (LEFT  : COMPLEX_VECTOR;
--                 RIGHT : REAL_MATRIX) return COMPLEX_VECTOR; 
  Put_Line("   function '*' (LEFT  : COMPLEX_VECTOR; ");
  Put_Line("                 RIGHT : REAL_MATRIX) return COMPLEX_VECTOR; ");
  New_Line;
  Assert((E*Re(C)) = (( -7.0, 11.0), ( -8.0, 16.0)));
  Assert((E*Re(D)) = ((  5.0, -1.0), ( -5.0,  1.0)));
  Assert((F*Re(C)) = ((  7.0, -5.0), ( 10.0, -8.0)));
  Assert((F*Re(D)) = (( -1.0, -1.0), (  1.0,  1.0)));

--   function "*" (LEFT  : REAL_MATRIX;
--                 RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR; 
  Put_Line("   function '*' (LEFT  : REAL_MATRIX; ");
  Put_Line("                 RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR; ");
  New_Line;
  Assert((Re(C)*E) = (( -4.0,  8.0), ( -6.0, 18.0)));
  Assert((Re(D)*E) = ((  5.0, -1.0), ( -5.0,  1.0)));
  Assert((Re(C)*F) = ((  5.0, -4.0), ( 11.0,-10.0)));
  Assert((Re(D)*F) = (( -1.0, -1.0), (  1.0,  1.0)));

--   function "*" (LEFT  : COMPLEX_MATRIX;
--                 RIGHT : REAL_VECTOR) return COMPLEX_VECTOR; 
  Put_Line("   function '*' (LEFT  : COMPLEX_MATRIX; ");
  Put_Line("                 RIGHT : REAL_VECTOR) return COMPLEX_VECTOR; ");
  New_Line;
  Assert((C*Re(E)) = (( -4.0, -1.0), ( -6.0,  1.0)));
  Assert((D*Re(E)) = ((  5.0, -5.0), ( -5.0,  5.0)));
  Assert((C*Re(F)) = ((  5.0, 10.0), ( 11.0,  4.0)));
  Assert((D*Re(F)) = (( -1.0,  1.0), (  1.0, -1.0)));

--   function "*" (LEFT  : COMPLEX;
--                 RIGHT : COMPLEX_MATRIX) return COMPLEX_MATRIX; 
  Put_Line("   function '*' (LEFT  : COMPLEX; ");
  Put_Line("                 RIGHT : COMPLEX_MATRIX) return COMPLEX_MATRIX; ");
  New_Line;
  Assert((Complex'(1.0, 1.0)*C) = (((-3.0, 5.0), (-1.0, 5.0)),
                                   (( 1.0, 5.0), ( 3.0, 5.0))));
  Assert((Complex'(1.0, 1.0)*D) = ((( 2.0, 0.0), (-2.0, 0.0)),
                                   ((-2.0, 0.0), ( 2.0, 0.0))));
  Assert((Complex'(1.0, 1.0)*G) = ((( 1.5, 0.5), ( 0.0, 4.0)),
                                   ((-2.0, 0.0), ( 2.0, 0.0)),
                                   (( 0.0, 4.0), (-1.5, 0.5))));

--   function "*" (LEFT  : COMPLEX_MATRIX;
--                 RIGHT : COMPLEX) return COMPLEX_MATRIX; 
  Put_Line("   function '*' (LEFT  : COMPLEX_MATRIX; ");
  Put_Line("                 RIGHT : COMPLEX) return COMPLEX_MATRIX; ");
  New_Line;
  Assert((C*Complex'(1.0, 1.0)) = (((-3.0, 5.0), (-1.0, 5.0)),
                                   (( 1.0, 5.0), ( 3.0, 5.0))));
  Assert((D*Complex'(1.0, 1.0)) = ((( 2.0, 0.0), (-2.0, 0.0)),
                                   ((-2.0, 0.0), ( 2.0, 0.0))));
  Assert((G*Complex'(1.0, 1.0)) = ((( 1.5, 0.5), ( 0.0, 4.0)),
                                   ((-2.0, 0.0), ( 2.0, 0.0)),
                                   (( 0.0, 4.0), (-1.5, 0.5))));

--   function "/" (LEFT  : COMPLEX_MATRIX;
--                 RIGHT : COMPLEX) return COMPLEX_MATRIX; 
  Put_Line("   function '/' (LEFT  : COMPLEX_MATRIX; ");
  Put_Line("                 RIGHT : COMPLEX) return COMPLEX_MATRIX; ");
  New_Line;
  Assert((C/Complex'(0.5,-0.5)) = (((-3.0, 5.0), (-1.0, 5.0)),
                                   (( 1.0, 5.0), ( 3.0, 5.0))));
  Assert((D/Complex'(0.5,-0.5)) = ((( 2.0, 0.0), (-2.0, 0.0)),
                                   ((-2.0, 0.0), ( 2.0, 0.0))));
  Assert((G/Complex'(0.5,-0.5)) = ((( 1.5, 0.5), ( 0.0, 4.0)),
                                   ((-2.0, 0.0), ( 2.0, 0.0)),
                                   (( 0.0, 4.0), (-1.5, 0.5))));

--   function "*" (LEFT  : REAL; RIGHT : COMPLEX_MATRIX) return COMPLEX_MATRIX; 
  Put_Line("   function '*' (LEFT  : REAL; RIGHT : COMPLEX_MATRIX) return COMPLEX_MATRIX; ");
  New_Line;
  Assert((-2.0*C) = (((-2.0,-8.0), (-4.0,-6.0)),
                     ((-6.0,-4.0), (-8.0,-2.0))));
  Assert((-2.0*D) = (((-2.0, 2.0), ( 2.0,-2.0)),
                     (( 2.0,-2.0), (-2.0, 2.0))));

--   function "*" (LEFT  : COMPLEX_MATRIX;
--                 RIGHT : REAL) return COMPLEX_MATRIX; 
  Put_Line("   function '*' (LEFT  : COMPLEX_MATRIX; ");
  Put_Line("                 RIGHT : REAL) return COMPLEX_MATRIX; ");
  New_Line;
  Assert((C*(-2.0)) = (((-2.0,-8.0), (-4.0,-6.0)),
                       ((-6.0,-4.0), (-8.0,-2.0))));
  Assert((D*(-2.0)) = (((-2.0, 2.0), ( 2.0,-2.0)),
                       (( 2.0,-2.0), (-2.0, 2.0))));

--   function "/" (LEFT  : COMPLEX_MATRIX;
--                 RIGHT : REAL) return COMPLEX_MATRIX; 
  Put_Line("   function '/' (LEFT  : COMPLEX_MATRIX; ");
  Put_Line("                 RIGHT : REAL) return COMPLEX_MATRIX; ");
  New_Line;
  Assert((C/(-0.5)) = (((-2.0,-8.0), (-4.0,-6.0)),
                       ((-6.0,-4.0), (-8.0,-2.0))));
  Assert((D/(-0.5)) = (((-2.0, 2.0), ( 2.0,-2.0)),
                       (( 2.0,-2.0), (-2.0, 2.0))));

--   function IDENTITY_MATRIX (ORDER : POSITIVE;
--                            FIRST_1, FIRST_2 : INTEGER := 1) return COMPLEX_MATRIX;
  Put_Line("   function IDENTITY_MATRIX (ORDER : POSITIVE; ");
  Put_Line("                            FIRST_1, FIRST_2 : INTEGER := 1) return COMPLEX_MATRIX; ");
  New_Line;
  Assert(Identity_Matrix(3) = Complex_Matrix'((( 1.0, 0.0), ( 0.0, 0.0), ( 0.0, 0.0)),
                                              (( 0.0, 0.0), ( 1.0, 0.0), ( 0.0, 0.0)),
                                              (( 0.0, 0.0), ( 0.0, 0.0), ( 1.0, 0.0))));
  Assert(Identity_Matrix(Order => 2, First_1 => 2, First_2 => 3)
         = Complex_Matrix'(((1.0, 0.0), (0.0, 0.0)),
                           ((0.0, 0.0), (1.0, 0.0))));

  Ada.Text_IO.Put("Number of failures: ");
  Ada.Integer_Text_IO.Put(Tests_Failed);

end Complex_Arrays_Test;

