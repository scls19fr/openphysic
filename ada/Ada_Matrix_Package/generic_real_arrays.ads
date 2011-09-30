-- Instantiating this package:
-- To instantiate this package, you must include the floating point
-- type of the array elements as a parameter.  Example:
--
-- package Real_Arrays is new Generic_Real_Arrays(Float);

with ARRAY_EXCEPTIONS;

generic

  type REAL is digits <>;

package GENERIC_REAL_ARRAYS is

-- TYPES -- 

  type REAL_VECTOR is array (INTEGER range <>) of REAL;
  type REAL_MATRIX is array (INTEGER range <>,
                             INTEGER range <>) of REAL;
 
-- SUBPROGRAMS for REAL_VECTOR TYPES -- 

  -- REAL_VECTOR arithmetic operations -- 

  function "+" (RIGHT : REAL_VECTOR) return REAL_VECTOR;
  function "-" (RIGHT : REAL_VECTOR) return REAL_VECTOR;
  function "abs" (RIGHT : REAL_VECTOR) return REAL_VECTOR;

  function "+" (LEFT, RIGHT : REAL_VECTOR) return REAL_VECTOR; 
  function "-" (LEFT, RIGHT : REAL_VECTOR) return REAL_VECTOR;
  function "*" (LEFT, RIGHT : REAL_VECTOR) return REAL_VECTOR;
  function "/" (LEFT, RIGHT : REAL_VECTOR) return REAL_VECTOR; 
  function "**" (LEFT : REAL_VECTOR;
                 RIGHT : INTEGER) return REAL_VECTOR; 

  function "*" (LEFT, RIGHT : REAL_VECTOR) return REAL;

  -- REAL_VECTOR scaling operations -- 

  function "*" (LEFT : REAL;
                RIGHT : REAL_VECTOR) return REAL_VECTOR; 
  function "*" (LEFT : REAL_VECTOR; 
                RIGHT : REAL) return REAL_VECTOR; 
  function "/" (LEFT : REAL_VECTOR; 
                RIGHT : REAL) return REAL_VECTOR; 

  -- Other REAL_VECTOR operations -- 

  function UNIT_VECTOR (INDEX : INTEGER; 
                        ORDER : POSITIVE;
                        FIRST : INTEGER := 1) return REAL_VECTOR;

-- SUBPROGRAMS for REAL_MATRIX TYPES --  

  -- REAL_MATRIX arithmetic operations --

  function "+" (RIGHT : REAL_MATRIX) return REAL_MATRIX;
  function "-" (RIGHT : REAL_MATRIX) return REAL_MATRIX; 
  function "abs" (RIGHT : REAL_MATRIX) return REAL_MATRIX;
  function TRANSPOSE (X : REAL_MATRIX) return REAL_MATRIX;

  function "+" (LEFT, RIGHT : REAL_MATRIX) return REAL_MATRIX;
  function "-" (LEFT, RIGHT : REAL_MATRIX) return REAL_MATRIX; 
  function "*" (LEFT, RIGHT : REAL_MATRIX) return REAL_MATRIX;

  function "*" (LEFT, RIGHT : REAL_VECTOR) return REAL_MATRIX;
  function "*" (LEFT : REAL_VECTOR;
                RIGHT : REAL_MATRIX) return REAL_VECTOR;
  function "*" (LEFT : REAL_MATRIX;
                RIGHT : REAL_VECTOR) return REAL_VECTOR;

  -- REAL_MATRIX scaling operations -- 

  function "*" (LEFT : REAL;
                RIGHT : REAL_MATRIX) return REAL_MATRIX; 
  function "*" (LEFT : REAL_MATRIX;
                RIGHT : REAL) return REAL_MATRIX; 
  function "/" (LEFT : REAL_MATRIX;
                RIGHT : REAL) return REAL_MATRIX; 

  -- Other REAL_MATRIX operations -- 

  function IDENTITY_MATRIX (ORDER : POSITIVE;
                            FIRST_1, FIRST_2 : INTEGER := 1) return REAL_MATRIX;

-- EXCEPTIONS -- 

  ARRAY_INDEX_ERROR: exception renames ARRAY_EXCEPTIONS.ARRAY_INDEX_ERROR;

end GENERIC_REAL_ARRAYS;
