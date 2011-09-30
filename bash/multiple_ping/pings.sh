for ip in $(cat ip.txt)
  do
  ping "$ip"
done