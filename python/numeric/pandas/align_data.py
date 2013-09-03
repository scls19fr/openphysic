#!/usr/bin/env python
# -*- coding: utf-8 -*-

import pandas as pd

df1 = pd.DataFrame([[1,2],[3,4]], index=['a','b'], columns=['c1', 'c2'])
print("df1 =")
print(df1)

print("")

df2 = pd.DataFrame([[5,6],[1,2]], index=['b','c'], columns=['c1', 'c2'])
print("df2 =")
print(df2)

print("")

print("df1 + df2 =")
print(df1 + df2)

print("")

df1_align, df2_align = df1.align(df2)

print("df1_align =")
print(df1_align)

print("")

print("df2_align =")
print(df2_align)

print("")

print("df1_align + df2_align =")
print(df1_align.fillna(0) + df2_align.fillna(0))

