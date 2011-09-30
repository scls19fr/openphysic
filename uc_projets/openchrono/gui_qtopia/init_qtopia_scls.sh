#/home/scls/qtopia-opensource-4.2.2

# /opt/Qtopia/bin
# 


export QTDIR=/home/scls/qtopia-opensource-4.2.2/bin #/opt/Qtopia
export QTEDIR=$QTDIR
export QPEDIR=$QTDIR
export PATH=$QTDIR/bin:$PATH
export PATH=$PATH:$QTDIR/include/qtopia/
export LD_LIBRARY_PATH=$QTDIR/lib:$LD_LIBRARY_PATH

TMAKEPATH=$QTDIR/tmake/lib/qws/linux-x86-g++/
PATH=$QTDIR/tmake/bin:$PATH
export TMAKEPATH


#export PATH=/home/scls/qtopia-opensource-4.2.2/bin:$PATH
#export LD_LIBRARY_PATH=/home/scls/qtopia-opensource-4.2.2/bin:$LD_LIBRARY_PATH

# lancement du serveur Qtopia
/home/scls/qtopia-opensource-4.2.2/scripts/runqtopia

