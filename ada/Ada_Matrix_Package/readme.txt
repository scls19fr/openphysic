 Ada 95 Matrix Math Package
 Version 1.02
 First Release, August 1996
 Current Release, December 1996

 Chris Papademetrious, Xiaoxun Zhu, Moshe Kam
 Data Fusion Laboratory
 Drexel University
 Philadelphia, PA


Changes
=======

Changes since 1.01:
* fixed a bug that could allow exceptions to occur with vector and
  matrix indices at the extreme limits of Integer (thanks to Mars
  Gralia for notifying me of this)
* some reoganization of algorithms in Generic_Real_Arrays.Operations
* cosmetic fix to real_arrays_operations_test to print final
  results message

Changes since 1.00:
* fixed mistake in Complex_Arrays_Test program


Disclaimer
==========

Copyright (c) Drexel University, 1996
Data Fusion Laboratory
Electrical and Computer Engineering Department

Permission to use, copy, modify, distribute, and sell this software
and its documentation for any purpose is hereby granted without fee,
provided that the above copyright notice appear in all copies and that
both the copyright notice and this permission notice appear in
supporting documentation.

Drexel University disclaims all warranties with regard to this
software, including all implied warranties of merchantability and
fitness, in no event shall Drexel University be liable for any special,
indirect or consequential damages or any damages whatsoever resulting
from loss of use, data or profits, arising out of or in connection with
the use or performance of this software.

Introduction
============

This matrix math package is designed to give a robust tool-set of vector
and matrix math routines to the Ada 95 programmer.  The groundwork for
the package is based on an ISO draft document (ISO/IEC 13813:1996(E))
outlining Ada 95 real and complex array arithmetic.  Child packages are
built upon this ISO-compliant base to provide additional functionality.

The files supplied in this archive are:

  generic_real_arrays.ads
  generic_real_arrays.adb
  generic_real_arrays-array_io.ads
  generic_real_arrays-array_io.adb
  generic_real_arrays-operations.ads
  generic_real_arrays-operations.adb
  generic_complex_arrays.ads
  generic_complex_arrays.adb
  generic_complex_arrays-array_io.ads
  generic_complex_arrays-array_io.adb
  generic_complex_arrays-operations.ads
  generic_complex_arrays-operations.adb
  real_arrays_test.adb
  real_arrays_operations_test.adb
  complex_arrays_test.adb
  complex_arrays_operations_test.adb
  readme.txt (this file)

 These files define the following:

  package Generic_Real_Arrays - basic math functions and array math
    routines as defined by the Ada 95 ISO document referred to above
    for vectors and matrices of real numbers.

  package Generic_Complex_Arrays - basic math functions and array math
    routines as defined by the Ada 95 ISO document referred to above
    for vectors and matrices of complex numbers.

  package Generic_Real_Arrays.Array_IO - routines to print vectors and
    arrays of real numbers to the console.

  package Generic_Complex_Arrays.Array_IO - routines to print vectors and
    arrays of complex numbers to the console.

  package Generic_Real_Arrays.Operations - more advanced functions for
    vectors and arrays of real numbers, including dynamic allocation,
    subvectors and submatrices, determinants, eigenvalues/vectors,
    singular value decompsition, and inverses.

  package Generic_Complex_Arrays.Operations - more advanced functions for
    vectors and arrays of complex numbers, including dynamic allocation,
    subvectors and submatrices, and determinants.

  procedure Real_Arrays_Test - test program demonstrating the use of
    every subprogram in Generic_Real_Arrays via a functional test.

  procedure Real_Arrays_Operations_Test - test program demonstrating
    the use of every subprogram in Generic_Real_Arrays.Operations
    via a functional test.

  procedure Complex_Arrays_Test - test program demonstrating the use of
    every subprogram in Generic_Complex_Arrays via a functional test.

  procedure Complex_Arrays_Operations_Test - test program demonstrating
    the use of every subprogram in Generic_Complex_Arrays.Operations
    via a functional test.

 Instructions for instantiating and using the packages are given in
comments in the specification (.ads) files for each package.  Questions 
may be emailed to us (see below).  The content of this package is a 
result of work executed under Defense Information Systems Agency Grant 
Nos. DCA100-96-1-0001 and DCA100-96-1-0002.


To Do
=====

 We have some future goals for this matrix package:

 * implement eigenvectors/eigenvalues, singular value decomposition,
   and inverses for complex matrices

 * adapt some of the very robust LAPACK algorithms to the package
 
Acknowledgements
================

 Some routines in Generic_Real_Arrays.Operations were ports or
modifications from other sources.  The following acknowledgements are
reposted from the package body of Generic_Real_Arrays.Operations:

from Generic_Real_Arrays.Operations.Inverse:
  -- This routine was adapted from code taken from the Public Ada Library
  -- (PAL), at the following location:
  --
  -- http://wuarchive.wustl.edu/languages/ada/userdocs/html/cardcat/matrix.html

from Generic_Real_Arrays.Operations.Singular_Value_Decomposition:
  -- This algorithm is based on the svd() routine in EISPACK, available at
  -- http://www.netlib.org/eispack/svd.f



Feedback
========

 We welcome any bug reports, suggestions, or other constructive feedback.
Feel free to reach us at:

 chrispy@lazarus.ece.drexel.edu. [Chris Papademetrious]
 xzhu@lazarus.ece.drexel.edu [Xiaoxun Zhu]
 kam@lazarus.ece.drexel.edu [Moshe Kam]

 or feel free to visit the Data Fusion Laboratory's home page at:

 http://dflwww.ece.drexel.edu/

