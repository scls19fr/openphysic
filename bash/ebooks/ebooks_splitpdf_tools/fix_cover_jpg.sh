#!/usr/bin/env bash

function swap {
  temp=temp.png

  cp $1 $temp
  cp $2 $1
  cp $temp $2

  rm $temp
}

swap temp2/00001a.jpg temp2/00001b.jpg


