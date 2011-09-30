This script helps to recompose scanned book

recto/
  recto1 001.jpg
  ...
  
verso/
  verso1 001.jpg
  ...

temp/
  contains jpg file in the right order

temp2/
  contains pdf files (one pdf file per page)

./
  contains output.pdf the resulting file


Use rot90cw.sh or rot90acw.sh to rotate 90° clockwise (or anticlockwise)
Use compose.sh to put files (from recto and verso directory) in the temp directoty (in the right order)
Use convtopdf.sh to generate one pdf file per page in the temp2 directory
 and to generate output.pdf

