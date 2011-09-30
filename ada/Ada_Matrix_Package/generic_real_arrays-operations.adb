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
-- $FILE: generic_real_arrays-operations.adb
-- $LAST_MODIFIED: 11/17/96
-- $AUTHORS: Chris Papademetrious, Xiaoxun Zhu, Moshe Kam
--

with Ada.Unchecked_Deallocation;
with Ada.Numerics.Generic_Elementary_Functions;

package body Generic_Real_Arrays.Operations is

  package Real_Elementary_Functions is new
    Ada.Numerics.Generic_Elementary_Functions(Real);

  procedure Free_Matrix is new Ada.Unchecked_Deallocation(Real_Matrix, Real_Matrix_Ptr);


  procedure Free_Vector is new Ada.Unchecked_Deallocation(Real_Vector, Real_Vector_Ptr);


  function Create_Vector(First, last: in Integer) return Real_Vector_Ptr is
  begin
    return new Real_Vector(First..Last);
  end Create_Vector;


  function Create_Vector(First, Last: in Integer;
                         default_value: in Real)
    return Real_Vector_Ptr is
    Result: Real_Vector_Ptr;
  begin
    Result := Create_Vector(First, Last);
    Result.all := (others => Default_Value);
    return Result;
  end Create_Vector;

 
  function Create_Matrix(First_Row, First_Col,
                         Last_Row, Last_Col: in Integer)
    return Real_Matrix_Ptr is
  begin
    return new Real_Matrix(First_Row..Last_Row, First_Col..Last_Col);
  end Create_Matrix;


  function Create_Matrix(First_Row, First_Col,
                         Last_Row, Last_Col: in Integer;
                         Default_Value: in Real) return Real_Matrix_Ptr is
    Result: Real_Matrix_Ptr;
  begin    
    Result := Create_Matrix(First_Row, First_Col, Last_Row, Last_Col);
    Result.all := (others => (others => Default_Value));
    return Result;
  end Create_Matrix;


  function Create_Matrix(First, Last: in Integer) return Real_Matrix_Ptr is
    Result: Real_Matrix_Ptr;
  begin
    return Create_Matrix(First, First, Last,Last);
  end Create_Matrix;


  function Create_Matrix(First, Last: in Integer;
                         Default_Value: in Real) return Real_Matrix_Ptr is
    Result: Real_Matrix_Ptr;
  begin
    return Create_Matrix(First, First, Last, Last, Default_Value);
  end Create_Matrix;


  procedure Destroy_Vector(X: in out Real_Vector_Ptr) is
  begin
    Free_Vector(X);
  end Destroy_Vector;


  procedure Destroy_Matrix(X: in out Real_Matrix_Ptr) is
  begin
    Free_Matrix(X);
  end Destroy_Matrix;


  function Row(X: in Real_Matrix;
               Row: in Integer) return Real_Vector is
    Result: Real_Vector(X'Range(2));
  begin
    for I in X'Range(2) loop
      Result(I) := X(Row, I);
    end loop;
    return Result;
  end Row;


  function Column(X: in Real_Matrix;
                  Col: in Integer) return Real_Vector is
    Result: Real_Vector(X'Range(1));
  begin
    for I in X'Range(1) loop
      Result(I) := X(I, Col);
    end loop;
    return Result;
  end Column;


  function Diagonal(X: in Real_Matrix) return Real_Vector is
    Result: Real_Vector(X'Range(1));
  begin
    if X'Length(1) /= X'Length(2) then
      raise Array_Index_Error;
    end if;
    for I in X'Range(1) loop
      Result(I) := X(I, (I-X'First(1))+X'First(2));
    end loop;
    return Result;
  end Diagonal;


  function SubVector(X: in Real_Vector; First, Last: in Integer)
    return Real_Vector
  is
    Result: Real_Vector(First..Last);
  begin
    for I in First..Last loop
      Result(I) := X(I);
    end loop;
    return Result;
  end SubVector;


  function SubVector(X: in Real_Vector; First, Last: in Integer;
                     First_index: in Integer)
    return Real_Vector
  is
    Result: Real_Vector(First_index..First_index+(Last-First));
  begin
    for I in First..Last loop
      Result(First_index+(I-First)) := X(I);
    end loop;
    return Result;
  end SubVector;


  function SubMatrix(X: in Real_Matrix;
                     First_Row, First_Col,
                     Last_Row, Last_Col: in Integer)
    return Real_Matrix
  is
    Result: Real_Matrix(First_Row..Last_Row,First_Col..Last_Col);
  begin
    for R in First_Row..Last_Row loop
      for C in First_Col..Last_Col loop
        Result(R, C) := X(R, C);
      end loop;
    end loop;
    return Result;
  end SubMatrix;


  function SubMatrix(X: in Real_Matrix;
                     First_Row, First_Col,
                     Last_Row, Last_Col: in Integer;
                     First_Row_index, First_Col_index: in Integer)
    return Real_Matrix
  is
    Result: Real_Matrix(First_Row_index..First_Row_index+(Last_Row-First_Row), 
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


  function Magnitude(X: in Real_Vector) return Real is
    sum_squares: Real := 0.0;
  begin
    for I in X'range loop
      sum_squares := sum_squares + (X(i) * X(i));
    end loop;
    return Real_Elementary_Functions.Sqrt(sum_squares);
  end Magnitude;


  procedure Normalize(X: in out Real_Vector) is
  begin
    X := X / Magnitude(X);
  end Normalize;


  function Det(X: in Real_Matrix) return Real is
    Result: Real;
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
      Result := 0.0;
      declare
        submat : Real_Matrix_Ptr := 
             new Real_Matrix(X'First(1)+1..X'Last(1),
                             X'First(2)..X'Last(2)-1);
        unity_sign: Real := 1.0;
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


  -- This routine was adapted from code taken from the Public Ada Library
  -- (PAL), at the following location:
  --
  -- http://wuarchive.wustl.edu/languages/ada/userdocs/html/cardcat/matrix.html
  function Inverse(X: Real_Matrix) return Real_Matrix is
    B: Real_Matrix(1..X'Length(1), 1..X'Length(2));
    Result: Real_Matrix(X'Range(1), X'Range(2));
    I_PIVOT,J_PIVOT: Integer range 1..X'Length(1);
    BIG_ENTRY, TEMP, EPSILON: Real ;
    L, M: array(1..X'Length(1)) of Integer;

    -- *******************************************************************
    --   This function performs the square Real_Matrix operation of " Real_Matrix A
    --   raise to Integer power P ".  When  P is negative , say P = -N ,
    --   A**(-N) = (inverse(A))**N , that is, the inverse of A raise to
    --   power N .  In this case, Real_Matrix A must be non-singular.
    --   Exceptions will be raised if the Real_Matrix A is not a square Real_Matrix,
    --   or if Real_Matrix A is singular.
    -- *******************************************************************
  begin
    if X'Length(1) /= X'Length(2) then
      raise Array_Index_Error;
    end if;

    B := X;

    -- initiate the Row and Column interchange information

    for K in B'range(1) loop
      L(K) := K ; -- Row interchage information
      M(K) := K ; -- Column interchange information
    end loop;

    -- major loop for inverse

    for K in B'range(1) loop

      -- & search for Row and Column Integer I_PIVOT, J_PIVOT 
      -- & both in (K .. B'LAST(1) ) for maximum B(I,J)
      -- & in absolute value :BIG_ENTRY

      BIG_ENTRY := 0.0 ;
      --
      -- check Real_Matrix singularity
      --
      for I in K..B'Last(1) loop
        for J in K..B'Last(1) loop
          if abs(B(I,J)) > abs(BIG_ENTRY) then
            BIG_ENTRY := B(I,J) ;
            I_PIVOT := I ;
            J_PIVOT := J ;
          end if;
        end loop;
      end loop;
      if K = B'First(1) then
        if BIG_ENTRY = 0.0 then
          raise Matrix_SINGULAR;
        else
          EPSILON := Real(B'length(1))*abs(BIG_ENTRY)
          *0.000001;
        end if;
      else
        if abs(BIG_ENTRY) < EPSILON then
          raise Matrix_sINGULAR;
        end if;
      end if;

      -- interchange Row and Column

      --& interchange K-th and I_PIVOT-th Rows
      if I_PIVOT/=K then
        for J in B'range(1) loop
          TEMP := B(I_PIVOT,J);
          B(I_PIVOT,J) := B(K,J) ;
          B(K,J) := TEMP ;
        end loop;
        L(K) := I_PIVOT ;
      end if;
      --& interchange K-th and J_PIVOT-th Columns
      if J_PIVOT/=K then
        for I in B'range(1) loop
          TEMP := B(I,J_PIVOT) ;
          B(I,J_PIVOT) := B(I,K) ;
          B(I,K) := TEMP ;
        end loop ;
        M(K) := J_PIVOT ;
      end if ;

      --& divide K-th Column by minus pivot (-BIG_ENTRY)

      for I in B'range(1) loop
        if I/=K then
          B(I,K) := B(I,K)/(-BIG_ENTRY) ;
        end if;
      end loop ;

      -- reduce Real_Matrix Row by Row

      for I in B'range(1) loop
        if I/=K then
          for J in B'range(1) loop
            if J/=K then
              B(I,J):=B(I,J)+B(I,K)*B(K,J);
            end if ;
          end loop ;
        end if ;
      end loop ;  

      --& divide K-th Row by pivot

      for J in B'range(1) loop
        if J/=K then
          B(K,J) := B(K,J)/BIG_ENTRY ;
        end if ;
      end loop ;
      B(K,K) := 1.0/BIG_ENTRY ;

    end loop ; -- end of major inverse loop

    -- final Column and Row interchange to obtain 
    -- inverse of X, i.e. X**(-1)

    for K in reverse B'range(1) loop
      -- Column interchage
      J_PIVOT := L(K) ;
      if J_PIVOT/=K then
        --& intechange B(I,J_PIVOT) and B(I,K) for each Row I
        for I in B'range(1) loop
          TEMP := B(I,J_PIVOT) ;
          B(I,J_PIVOT) := B(I,K) ;
          B(I,K) := TEMP ;
        end loop ;
      end if ;
      -- Row interchage
      I_PIVOT := M(K) ;
      if I_PIVOT/=K then
        --& INTECHANGE B(I_PIVOT,J) and B(K,J) for each Column J
        for J in B'range(1) loop
          TEMP := B(I_PIVOT,J) ;
          B(I_PIVOT,J) := B(K,J) ;
          B(K,J) := TEMP ;
        end loop ;
      end if ;
    end loop ;

    -- inverse of X is obtained and stored in B

    Result := B;

    return Result;
  end Inverse;


  -- This algorithm is based on the svd() routine in EISPACK, available at
  -- http://www.netlib.org/eispack/svd.f
  procedure Singular_Value_Decomposition
  ( A: in Real_Matrix;
    U: out Real_Matrix;
    W: out Real_Matrix;
    V: out Real_Matrix)
  is
    function MultSign(a, b: in Real) return Real is
    begin
      if b >= 0.0 then
        return abs a;
      else
        return -(abs a);
      end if;
    end MultSign;
    function Min(a, b: in Integer) return Integer is
    begin
      if a > b then return b; else return a; end if;
    end Min;
    function Max(a, b: in Real) return Real is
    begin
      if a > b then return a; else return b; end if;
    end Max;
    function Pythag(a, b: in Real) return Real is
      absa, absb: Real;
    begin
      absa := abs a;
      absb := abs b;
      if absa > absb then
        return absa*Real_Elementary_Functions.Sqrt(1.0+(absb/absa)**2);
      elsif absb /= 0.0 then
        return absb*Real_Elementary_Functions.Sqrt(1.0+(absa/absb)**2);
      else
        return 0.0;
      end if;
    end Pythag;

    umat: Real_Matrix(1..A'Length(1), 1..A'Length(2));
    wmat: Real_Matrix(umat'Range(2), umat'Range(2)) := (others => (others => 0.0));
    vmat: Real_Matrix(umat'Range(2), umat'Range(2));
    rv1: Real_Vector(umat'Range(2));
    Flag: Boolean;
    l,nm: Integer;
    anorm,c,f,g,h,s,scale,x,y,z: Real;

    m: Integer := umat'Last(1);
    n: Integer := umat'Last(2);
  begin
    if A'Length(1) /= A'Length(2) then
      raise Array_Index_Error;
    end if;

    umat := A;

    g := 0.0;
    scale := 0.0;
    anorm := 0.0;
    for I in 1..n loop
      l := I+1;
      rv1(I) := scale*g;
      g := 0.0;
      s := 0.0;
      scale := 0.0;
      if (I <= m) then
        for K in I..m loop
          scale := (scale + abs umat(K,I));
        end loop;
        if (scale /= 0.0) then
          for K in I..m loop
            umat(K,I) := (umat(K,I) / scale);
            s := (s + umat(K,I)*umat(K,I));
          end loop;
          f := umat(I,I);
          g := -MultSign(Real_Elementary_Functions.Sqrt(s),f);
          h := f*g - s;
          umat(I,I) := f-g;
          for J in l..n loop
            s := 0.0;
            for K in I..m loop
              s := (s + umat(K,I)*umat(K,J));
            end loop;
            f := s/h;
            for k in i..m loop
              umat(k,j) := (umat(k,j) + f*umat(k,i));
            end loop;
          end loop;
          for k in i..m loop
            umat(k,i) := (umat(k,i) * scale);
          end loop;
        end if;
      end if;
      wmat(i,i) := (scale * g);
      g := 0.0;
      s := 0.0;
      scale := 0.0;
      if (i <= m) and (i /= n) then
        for k in l..n loop
          scale := (scale + abs umat(i,k));
        end loop;
        if (scale /= 0.0) then
          for k in l..n loop
            umat(i,k) := (umat(i,k) / scale);
            s := (s + umat(i,k)*umat(i,k));
          end loop;
          f := umat(i,l);
          g := -MultSign(Real_Elementary_Functions.Sqrt(s),f);
          h := f*g-s;
          umat(i,l) := f-g;
          for k in l..n loop
            rv1(k) := umat(i,k)/h;
          end loop;
          for j in l..m loop
            s := 0.0;
            for k in l..n loop
              s := (s + umat(j,k)*umat(i,k));
            end loop;
            for k in l..n loop
              umat(j,k) := (umat(j,k) + s*rv1(k));
            end loop;
          end loop;
          for k in l..n loop
            umat(i,k) := (umat(i,k) * scale);
          end loop; 
        end if;
      end if;
      anorm := Max(anorm, abs wmat(i,i) + abs rv1(i));
    end loop;
    for i in reverse 1..n loop
      if (i < n) then
        if (g /= 0.0) then
          for j in l..n loop
            vmat(j,i) := (umat(i,j) / umat(i,l)) / g;
          end loop;
          for j in l..n loop
            s := 0.0;
            for k in l..n loop
              s := (s + umat(i,k)*vmat(k,j));
            end loop;
            for k in l..n loop
              vmat(k,j) := (vmat(k,j) + s*vmat(k,i));
            end loop;
          end loop;
        end if;
        for j in l..n loop
          vmat(i,j) := 0.0;
          vmat(j,i) := 0.0;
        end loop;
      end if;
      vmat(i,i) := 1.0;
      g := rv1(i);
      l := i;
    end loop;
    for i in reverse 1..Min(m,n) loop
      l := i+1;
      g := wmat(i,i);
      for j in l..n loop
        umat(i,j) := 0.0;
      end loop;
      if (g /= 0.0) then
        g := 1.0/g;
        for j in l..n loop
          s := 0.0;
          for k in l..m loop
            s := (s + umat(k,i)*umat(k,j));
          end loop;
          f := (s/umat(i,i))*g;
          for k in i..m loop
            umat(k,j) := (umat(k,j) + f*umat(k,i));
          end loop;
        end loop;
        for j in i..m loop
          umat(j,i) := (umat(j,i)*g);
        end loop;
      else
        for j in i..m loop
          umat(j,i) := 0.0;
        end loop;
      end if;
      umat(i,i) := umat(i,i) + 1.0;
    end loop;
    for k in reverse 1..n loop
      for its in 1..30 loop
        Flag := True;
        for ll in reverse 1..k loop
          l := ll;
          nm := l-1;
          if (abs rv1(l) + anorm) = anorm then
            Flag := False;
            exit;
          elsif (abs wmat(nm,nm) + anorm) = anorm then
            exit;
          end if;
        end loop;
        if Flag then
          c := 0.0;
          s := 1.0;
          for i in l..k loop
            f := s*rv1(i);
            rv1(i) := c*rv1(i);
            if (abs f + anorm) = anorm then
              exit;
            end if;
            g := wmat(i,i);
            h := pythag(f,g);
            wmat(i,i) := h;
            h := 1.0/h;
            c := g*h;
            s := -f*h;
            for j in 1..m loop
              y := umat(j,nm);
              z := umat(j,i);
              umat(j,nm) := y*c+z*s;
              umat(j,i) := z*c-y*s;
            end loop;
          end loop;
        end if;
        z := wmat(k,k);
        if l = k then
          if z < 0.0 then
            wmat(k,k) := -z;
            for j in 1..n loop
              vmat(j,k) := -vmat(j,k);
            end loop;
          end if;
          exit;
        end if;
        if (its = 30) then
          raise Matrix_Convergence;
        end if;
        x := wmat(l,l);
        nm := k-1;
        y := wmat(nm,nm);
        g := rv1(nm);
        h := rv1(k);
        f := ((y-z)*(y+z)+(g-h)*(g+h))/(2.0*h*y);
        g := pythag(f,1.0);
        f := ((x-z)*(x+z)+h*((y/(f+MultSign(g,f)))-h))/x;
        c := 1.0;
        s := 1.0;
        for j in l..nm loop
          g := rv1(j+1);
          y := wmat(j+1,j+1);
          h := s*g;
          g := c*g;
          z := pythag(f,h);
          rv1(j) := z;
          c := f/z;
          s := h/z;
          f := x*c+g*s;
          g := g*c-x*s;
          h := y*s;
          y := y*c;
          for jj in 1..n loop
            x := vmat(jj,j);
            z := vmat(jj,j+1);
            vmat(jj,j) := x*c+z*s;
            vmat(jj,j+1) := z*c-x*s;
          end loop;
          z := pythag(f,h);
          wmat(j,j) := z;
          if (z /= 0.0) then
            z := 1.0/z;
            c := f*z;
            s := h*z;
          end if;
          f := c*g+s*y;
          x := c*y-s*g;
          for jj in 1..m loop
            y := umat(jj,j);
            z := umat(jj,j+1);
            umat(jj,j) := y*c+z*s;
            umat(jj,j+1) := z*c-y*s;
          end loop;
        end loop;
        rv1(l) := 0.0;
        rv1(k) := f;
        wmat(k,k) := x;
      end loop;
    end loop;
    u := umat;
    w := wmat;
    v := vmat;
  end Singular_Value_Decomposition;

end GENERIC_Real_ARRAYS.OPERATIONS;
