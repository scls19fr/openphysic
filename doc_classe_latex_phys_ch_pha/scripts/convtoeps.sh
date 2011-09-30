for file in *.gif *.png *.jpg *.jpeg
do
  convert $file $file.eps
done