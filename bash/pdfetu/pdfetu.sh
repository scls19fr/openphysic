#!/usr/bin/env bash

complement=etudiant
watermark=gte

rm *${complement}.pdf -f

for i in *.pdf;
do
depuis=$(basename $i .pdf)
depuis_water=${depuis}_${water}
vers=${depuis}_${complement}

if [ -f ${watermark}.pdf ]
then
  echo Copie et modification de $depuis.pdf vers $vers.pdf avec watermark
  pdftk $depuis.pdf background $watermark.pdf output $depuis_water.pdf
  pdftk $depuis_water.pdf output $vers.pdf owner_pw pdfgte
  rm $depuis_water.pdf -f
else
  echo Copie et modification de $depuis.pdf vers $vers.pdf sans watermark
  pdftk $depuis.pdf output $vers.pdf owner_pw pdfgte
fi
done
