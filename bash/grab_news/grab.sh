#brag -s news.wanadoo.fr -m 200 -c -C -o ~/.brag/temp -g alt.binaries.pictures.erotica.french.female

for news in `cat news_list.txt`; do
  echo "-=-=-=-=-=-=-=-=-=-=-=-".$news."-=-=-=-=-=-=-=-=-=-=-=-"
  brag -s news.wanadoo.fr -m 200 -c -C -o ~/.brag/temp -g $news
done
