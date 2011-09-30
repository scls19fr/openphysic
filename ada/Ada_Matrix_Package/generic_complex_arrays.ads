-- Instantiating this package:
-- To instantiate this package, you must include the following
-- as parameters:
--
--  the base floating-point type used as real/imaginary components
--  the real vector type defined using this base type
--  the real matrix type defined using this base type
--  the complex type based on the base floating-point type
--
-- The complex array operations and complex number operations must also
-- be visible at the point of instantiation of the complex array package,
-- to allow them to be inherited.
--
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

with ARRAY_EXCEPTIONS, ADA.NUMERICS;

generic

  type REAL is digits <>;
  type REAL_VECTOR is array (INTEGER range <>) of REAL;
  type REAL_MATRIX is array (INTEGER range <>,
                             INTEGER range <>) of REAL; 

  type COMPLEX is private;

  with function RE (X : COMPLEX) return REAL is <>; 
  with function IM (X : COMPLEX) return REAL is <>;
  with procedure SET_RE (X  : in out COMPLEX;
                        RE  : in REAL) is <>;
  with procedure SET_IM (X  : in out COMPLEX;
                         IM : in REAL) is <>;
  with function COMPOSE_FROM_CARTESIAN
     (RE, IM : REAL) return COMPLEX is <>;

  with function MODULUS (X : COMPLEX) return REAL is <>;
  with function ARGUMENT (X : COMPLEX) return REAL is <>; 
  with function ARGUMENT (X     : COMPLEX;
                          CYCLE : REAL) return REAL is <>; 
  with function COMPOSE_FROM_POLAR
     (MODULUS, ARGUMENT : REAL) return COMPLEX is <>; 
  with function COMPOSE_FROM_POLAR
     (MODULUS, ARGUMENT, CYCLE : REAL) return COMPLEX is <>;

  with function "-" (RIGHT : COMPLEX) return COMPLEX is <>;
  with function CONJUGATE (X : COMPLEX) return COMPLEX is <>; 

  with function "+" (LEFT, RIGHT : COMPLEX) return COMPLEX is <>;
  with function "-" (LEFT, RIGHT : COMPLEX) return COMPLEX is <>; 
  with function "*" (LEFT, RIGHT : COMPLEX) return COMPLEX is <>;
  with function "/" (LEFT, RIGHT : COMPLEX) return COMPLEX is <>; 
  with function "**" (LEFT  : COMPLEX;
                      RIGHT : INTEGER) return COMPLEX is <>; 

  with function "+" (LEFT  : REAL;
                     RIGHT : COMPLEX) return COMPLEX is <>; 
  with function "-" (LEFT  : REAL;
                     RIGHT : COMPLEX) return COMPLEX is <>; 
  with function "*" (LEFT  : REAL;
                     RIGHT : COMPLEX) return COMPLEX is <>; 
  with function "/" (LEFT  : REAL;
                     RIGHT : COMPLEX) return COMPLEX is <>; 
  with function "/" (LEFT  : COMPLEX;
                     RIGHT : REAL) return COMPLEX is <>;

package GENERIC_COMPLEX_ARRAYS is

-- TYPES --

  type COMPLEX_VECTOR is array (INTEGER range <>) of COMPLEX; 
  type COMPLEX_MATRIX is array (INTEGER range <>,
                                INTEGER range <>) of COMPLEX; 

-- SUBPROGRAMS for COMPLEX_VECTOR types -- 

  -- COMPLEX_VECTOR selection, conversion and composition operations --

  function RE (X : COMPLEX_VECTOR) return REAL_VECTOR;
  function IM (X : COMPLEX_VECTOR) return REAL_VECTOR; 

  procedure SET_RE (X  : in out COMPLEX_VECTOR;
                    RE : in     REAL_VECTOR); 
  procedure SET_IM (X  : in out COMPLEX_VECTOR; 
                    IM : in     REAL_VECTOR); 

  function COMPOSE_FROM_CARTESIAN
     (RE : REAL_VECTOR) return COMPLEX_VECTOR;
  function COMPOSE_FROM_CARTESIAN
     (RE, IM : REAL_VECTOR) return COMPLEX_VECTOR;

  function MODULUS (X : COMPLEX_VECTOR) return REAL_VECTOR;
  function "abs" (RIGHT : COMPLEX_VECTOR) return REAL_VECTOR
     renames MODULUS;
  function ARGUMENT (X : COMPLEX_VECTOR) return REAL_VECTOR;
  function ARGUMENT (X     : COMPLEX_VECTOR;
                     CYCLE : REAL) return REAL_VECTOR;

  function COMPOSE_FROM_POLAR
     (MODULUS, ARGUMENT : REAL_VECTOR) return COMPLEX_VECTOR;
  function COMPOSE_FROM_POLAR
     (MODULUS, ARGUMENT : REAL_VECTOR;
      CYCLE             : REAL) return COMPLEX_VECTOR;

  -- COMPLEX_VECTOR arithmetic operations --

  function "+" (RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR; 
  function "-" (RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR;
  function CONJUGATE (X : COMPLEX_VECTOR) return COMPLEX_VECTOR; 

  function "+" (LEFT, RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR;
  function "-" (LEFT, RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR; 
  function "*" (LEFT, RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR;
  function "/" (LEFT, RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR; 
  function "**" (LEFT  : COMPLEX_VECTOR;
                 RIGHT : INTEGER) return COMPLEX_VECTOR; 

  function "*" (LEFT, RIGHT : COMPLEX_VECTOR) return COMPLEX;

  -- Mixed REAL_VECTOR and COMPLEX_VECTOR arithmetic operations --

  function "+" (LEFT  : REAL_VECTOR;
                RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR;
  function "+" (LEFT  : COMPLEX_VECTOR;
                RIGHT : REAL_VECTOR) return COMPLEX_VECTOR;
  function "-" (LEFT  : REAL_VECTOR;
                RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR;
  function "-" (LEFT  : COMPLEX_VECTOR;
                RIGHT : REAL_VECTOR) return COMPLEX_VECTOR;
  function "*" (LEFT  : REAL_VECTOR;
                RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR;
  function "*" (LEFT  : COMPLEX_VECTOR;
                RIGHT : REAL_VECTOR) return COMPLEX_VECTOR;
  function "/" (LEFT  : REAL_VECTOR;
                RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR;
  function "/" (LEFT  : COMPLEX_VECTOR;
                RIGHT : REAL_VECTOR) return COMPLEX_VECTOR;
  function "*" (LEFT  : REAL_VECTOR;
                RIGHT : COMPLEX_VECTOR) return COMPLEX;
  function "*" (LEFT  : COMPLEX_VECTOR;
                RIGHT : REAL_VECTOR) return COMPLEX;

  -- COMPLEX_VECTOR scaling operations -- 

  function "*" (LEFT  : COMPLEX;
                RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR; 
  function "*" (LEFT  : COMPLEX_VECTOR;
                RIGHT : COMPLEX) return COMPLEX_VECTOR; 
  function "/" (LEFT  : COMPLEX_VECTOR;
                RIGHT : COMPLEX) return COMPLEX_VECTOR; 
  function "*" (LEFT  : REAL;
                RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR; 
  function "*" (LEFT  : COMPLEX_VECTOR;
                RIGHT : REAL) return COMPLEX_VECTOR; 
  function "/" (LEFT  : COMPLEX_VECTOR;
                RIGHT : REAL) return COMPLEX_VECTOR; 

  -- Other COMPLEX_VECTOR operations -- 

  function UNIT_VECTOR (INDEX : INTEGER;
                        ORDER : POSITIVE;
                        FIRST : INTEGER := 1) return COMPLEX_VECTOR;

-- SUBPROGRAMS for COMPLEX_MATRIX TYPES --

  -- COMPLEX_MATRIX selection, conversion and composition operations -- 

  function RE (X : COMPLEX_MATRIX) return REAL_MATRIX;
  function IM (X : COMPLEX_MATRIX) return REAL_MATRIX;

  procedure SET_RE (X  : in out COMPLEX_MATRIX;
                    RE : in REAL_MATRIX);
  procedure SET_IM (X  : in out COMPLEX_MATRIX;
                    IM : in REAL_MATRIX);

  function COMPOSE_FROM_CARTESIAN
     (RE : REAL_MATRIX) return COMPLEX_MATRIX; 
  function COMPOSE_FROM_CARTESIAN
     (RE, IM : REAL_MATRIX) return COMPLEX_MATRIX;

  function MODULUS (X : COMPLEX_MATRIX) return REAL_MATRIX; 
  function "abs" (RIGHT : COMPLEX_MATRIX) return REAL_MATRIX
     renames MODULUS;

  function ARGUMENT (X : COMPLEX_MATRIX) return REAL_MATRIX; 
  function ARGUMENT (X     : COMPLEX_MATRIX;
                     CYCLE : REAL) return REAL_MATRIX; 

  function COMPOSE_FROM_POLAR
     (MODULUS, ARGUMENT : REAL_MATRIX) return COMPLEX_MATRIX; 
  function COMPOSE_FROM_POLAR
     (MODULUS, ARGUMENT : REAL_MATRIX;
      CYCLE             : REAL) return COMPLEX_MATRIX;

  -- COMPLEX_MATRIX arithmetic operations --

  function "+" (RIGHT : COMPLEX_MATRIX) return COMPLEX_MATRIX; 
  function "-" (RIGHT : COMPLEX_MATRIX) return COMPLEX_MATRIX;
  function CONJUGATE (X : COMPLEX_MATRIX) return COMPLEX_MATRIX; 
  function TRANSPOSE (X : COMPLEX_MATRIX) return COMPLEX_MATRIX;

  function "+" (LEFT, RIGHT : COMPLEX_MATRIX) return COMPLEX_MATRIX; 
  function "-" (LEFT, RIGHT : COMPLEX_MATRIX) return COMPLEX_MATRIX;
  function "*" (LEFT, RIGHT : COMPLEX_MATRIX) return COMPLEX_MATRIX; 

  function "*" (LEFT, RIGHT : COMPLEX_VECTOR) return COMPLEX_MATRIX;
  function "*" (LEFT  : COMPLEX_VECTOR;
                RIGHT : COMPLEX_MATRIX) return COMPLEX_VECTOR;
  function "*" (LEFT  : COMPLEX_MATRIX;
                RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR;

  -- Mixed REAL_MATRIX and COMPLEX_MATRIX arithmetic operations -- 

  function "+" (LEFT  : REAL_MATRIX;
                RIGHT : COMPLEX_MATRIX) return COMPLEX_MATRIX; 
  function "+" (LEFT  : COMPLEX_MATRIX;
                RIGHT : REAL_MATRIX) return COMPLEX_MATRIX; 
  function "-" (LEFT  : REAL_MATRIX;
                RIGHT : COMPLEX_MATRIX) return COMPLEX_MATRIX; 
  function "-" (LEFT  : COMPLEX_MATRIX;
                RIGHT : REAL_MATRIX) return COMPLEX_MATRIX; 
  function "*" (LEFT  : REAL_MATRIX;
                RIGHT : COMPLEX_MATRIX) return COMPLEX_MATRIX; 
  function "*" (LEFT  : COMPLEX_MATRIX;
                RIGHT : REAL_MATRIX) return COMPLEX_MATRIX; 

  function "*" (LEFT  : REAL_VECTOR;
                RIGHT : COMPLEX_VECTOR) return COMPLEX_MATRIX; 
  function "*" (LEFT  : COMPLEX_VECTOR;
                RIGHT : REAL_VECTOR) return COMPLEX_MATRIX; 
  function "*" (LEFT  : REAL_VECTOR;
                RIGHT : COMPLEX_MATRIX) return COMPLEX_VECTOR; 
  function "*" (LEFT  : COMPLEX_VECTOR;
                RIGHT : REAL_MATRIX) return COMPLEX_VECTOR; 
  function "*" (LEFT  : REAL_MATRIX;
                RIGHT : COMPLEX_VECTOR) return COMPLEX_VECTOR; 
  function "*" (LEFT  : COMPLEX_MATRIX;
                RIGHT : REAL_VECTOR) return COMPLEX_VECTOR; 

  -- COMPLEX_MATRIX scaling operations -- 

  function "*" (LEFT  : COMPLEX;
                RIGHT : COMPLEX_MATRIX) return COMPLEX_MATRIX; 
  function "*" (LEFT  : COMPLEX_MATRIX;
                RIGHT : COMPLEX) return COMPLEX_MATRIX; 
  function "/" (LEFT  : COMPLEX_MATRIX;
                RIGHT : COMPLEX) return COMPLEX_MATRIX; 

  function "*" (LEFT  : REAL; RIGHT : COMPLEX_MATRIX) return COMPLEX_MATRIX; 
  function "*" (LEFT  : COMPLEX_MATRIX;
                RIGHT : REAL) return COMPLEX_MATRIX; 
  function "/" (LEFT  : COMPLEX_MATRIX;
                RIGHT : REAL) return COMPLEX_MATRIX; 

  -- Other COMPLEX_MATRIX operations -- 

  function IDENTITY_MATRIX (ORDER : POSITIVE;
                            FIRST_1, FIRST_2 : INTEGER := 1) return COMPLEX_MATRIX;

-- EXCEPTIONS -- 

ARGUMENT_ERROR: exception renames ADA.NUMERICS.ARGUMENT_ERROR;
ARRAY_INDEX_ERROR: exception renames ARRAY_EXCEPTIONS.ARRAY_INDEX_ERROR; 

end GENERIC_COMPLEX_ARRAYS;
