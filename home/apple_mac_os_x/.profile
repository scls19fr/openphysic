
test -r /sw/bin/init.sh && . /sw/bin/init.sh

#test -r /sw/bin/init.sh && . /sw/bin/init.sh
#
# Your previous .profile  (if any) is saved as .profile.dpsaved
# Setting the path for DarwinPorts.

export DISPLAY=:0

#/bin
#/sbin
#/usr/sbin
#/usr/X11R6/bin


# darwinports path
export PATH=$PATH:/opt/local/bin
export PATH=$PATH:/opt/local/sbin

# fink path
export PATH=$PATH:/sw/bin

# others
export PATH=$PATH:/usr/local/bin

# my bin
export PATH=$PATH:~/bin

export PATH


# BerliOS SVN - OpenPhysic
export SVN_SSH="ssh -l scls19fr"
export SVN_EDITOR="vi"


export CLICOLOR="xterm-color"
#alias ls='ls -G'

alias ll='ls -l'

export LANG="fr_FR.UTF-8"

# alias pour Java
alias jc='javac *.java'
alias rc='rm *.class'
alias j='java CMain'
alias av='appletviewer index.html'


