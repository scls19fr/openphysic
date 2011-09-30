#for i in *.psd; do convert $i $(basename $i .psd).jpg ; done

for file in *.gif *.png *.jpg *.jpeg
do
  convert $file $file.eps
done