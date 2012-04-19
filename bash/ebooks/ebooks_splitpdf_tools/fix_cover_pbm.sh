#!/usr/bin/env bash

function swap {
  temp=temp.pbm

  cp $1 $temp
  cp $2 $1
  cp $temp $2

  rm $temp
}

swap temp2/00001a.pbm temp2/00001b.pbm


