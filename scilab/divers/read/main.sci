fid=mopen("main.dat","r")
// skip header
header=mfscanf(fid,"%s")
// read up to eof
[N,tick,n1,dat,tim,f1,f2,f3,f4]=mfscanf(-1,fid,"%6s,%d,%d,%d,%f,%f,%f,%f\n")
mclose(fid)