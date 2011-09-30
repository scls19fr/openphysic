# Effacer fichier *.*~
# ceux qui sont versionnés et les autres
find -name *.*~ > file.txt
find -name semantic.cache >> file.txt
for file in `cat file.txt`
do
  echo $file
  svn remove $file
done
svn commit
for file in `cat file.txt`
do
  echo $file
  rm $file
done
