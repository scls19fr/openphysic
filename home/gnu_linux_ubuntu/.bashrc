# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples



#export PATH=$PATH:

# Java
export PATH=$PATH:/opt/jdk1.5.0_04/bin
#export PATH=$PATH:/opt/netbeans-4.1/bin
#export PATH=$PATH:/opt/netbeans-5.0/bin
export PATH=$PATH:/opt/netbeans-5.5beta/bin
#export PATH=$PATH:/opt/eclipse
export PATH=$PATH:~/bin
export PATH=$PATH:/usr/games/


# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
#export HISTCONTROL=ignoredups

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias xdvi='xdvi -bg white'

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" -a -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color)
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    ;;
*)
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    ;;
esac

# Comment in the above and uncomment this below for a color prompt
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
    ;;
*)
    ;;
esac

# Define your own aliases here ...
#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#fi




#export PATH=$PATH:/usr/lib/sun-j2se5.0-jdk/bin/javadoc

#export CVSROOT=anoncvs@savannaj.gu.org:/webcvs/emacs
#export CVS_RSH=ssh
#export CVSEDITOR=emacs
#cvs -z3 -d:ext:anoncvs@savannah.gnu.org:/cvsroot/emacs co <modulename>
#<modulename> = emacs




alias xfig='xfig -specialtext -latexfonts -startlatexFont default'


alias synaptic='gksudo /usr/sbin/synaptic'


# alias pour Java
alias jc='javac *.java'
alias j='java CMain'
alias av='appletviewer index.html'
alias rc='rm *.class'



# SourceForge CVS - OpenPhysic
# ============================
#export CVSROOT=toto@cvs.mon-organisation.com:/opt/cvs
#export CVSROOT=scls19fr@cvs.sourceforge.net:/cvsroot/openphysic

#export CVS_RSH=ssh

#export CVSEDITOR=emacs #-nw
#export CVSEDITOR=vi

# Developper
#cvs -z3 -d:ext:scls19fr@cvs.sourceforge.net:/cvsroot/openphysic co -P CVSROOT

# Anonymous
#cvs -d:pserver:anonymous@cvs.sourceforge.net:/cvsroot/openphysic login
#cvs -z3 -d:pserver:anonymous@cvs.sourceforge.net:/cvsroot/openphysic co -P harmon_java


# SourceForge CVS - fieldEB
# =========================
#export CVSROOT=toto@cvs.mon-organisation.com:/opt/cvs
#export CVSROOT=scls19fr@cvs.sourceforge.net:/cvsroot/fieldeb

#export CVS_RSH=ssh

#export CVSEDITOR=emacs #-nw
export CVSEDITOR=vi

# Developper
#cvs -z3 -d:ext:scls19fr@cvs.sourceforge.net:/cvsroot/openphysic co -P CVSROOT

# Anonymous
#cvs -d:pserver:anonymous@cvs.sourceforge.net:/cvsroot/fieldeb login
#cvs -z3 -d:pserver:anonymous@cvs.sourceforge.net:/cvsroot/fieldeb co -P fieldeb_cpp_wx


# BerliOS SSH 
# ===========
#ssh scls19fr@shell.berlios.de


# BerliOS CVS - OpenPhysic
# ========================
#export CVSROOT=scls19fr@cvs.openphysic.sourceforge.net:/cvsroot/openphysic
#export CVS_RSH=ssh
#export CVSEDITOR=vi

# Developper
#cvs -z3 -dscls19fr@cvs.openphysic.berlios.de:/cvsroot/openphysic co modulename

# Anonymous
#cvs -d:pserver:anonymous@cvs.openphysic.berlios.de:/cvsroot/openphysic login
#cvs -z3 -d:pserver:anonymous@cvs.openphysic.berlios.de:/cvsroot/openphysic co modulename


# BerliOS SVN - OpenPhysic
# ========================
export SVN_SSH="ssh -l scls19fr"




# Anonymous
#svn checkout svn://svn.berlios.de/openphysic/.../trunk
#svn checkout http://svn.berlios.de/svnroot/repos/openphysic/.../trunk

# Developer
#svn checkout svn+ssh://scls19fr@svn.berlios.de/svnroot/repos/openphysic/.../trunk
#svn checkout https://scls19fr@svn.berlios.de/svnroot/repos/openphysic/.../trunk



# Création des répertoires
# ========================

#svn mkdir svn+ssh://scls19fr@svn.berlios.de/svnroot/repos/openphysic/trunk
#svn mkdir svn+ssh://scls19fr@svn.berlios.de/svnroot/repos/openphysic/branches
#svn mkdir svn+ssh://scls19fr@svn.berlios.de/svnroot/repos/openphysic/tags

#svn mkdir svn+ssh://scls19fr@svn.berlios.de/svnroot/repos/openphysic/fieldeb_cpp_wx
#svn mkdir svn+ssh://scls19fr@svn.berlios.de/svnroot/repos/openphysic/fieldeb_cpp_wx/trunk
#svn mkdir svn+ssh://scls19fr@svn.berlios.de/svnroot/repos/openphysic/fieldeb_cpp_wx/branches
#svn mkdir svn+ssh://scls19fr@svn.berlios.de/svnroot/repos/openphysic/fieldeb_cpp_wx/tags

#svn mkdir svn+ssh://scls19fr@svn.berlios.de/svnroot/repos/openphysic/fieldeb_dotnet_csharp_winforms
#svn mkdir svn+ssh://scls19fr@svn.berlios.de/svnroot/repos/openphysic/fieldeb_dotnet_csharp_winforms/trunk
#svn mkdir svn+ssh://scls19fr@svn.berlios.de/svnroot/repos/openphysic/fieldeb_dotnet_csharp_winforms/branches
#svn mkdir svn+ssh://scls19fr@svn.berlios.de/svnroot/repos/openphysic/fieldeb_dotnet_csharp_winforms/tags

#svn mkdir svn+ssh://scls19fr@svn.berlios.de/svnroot/repos/openphysic/fieldeb_java
#svn mkdir svn+ssh://scls19fr@svn.berlios.de/svnroot/repos/openphysic/fieldeb_java/trunk
#svn mkdir svn+ssh://scls19fr@svn.berlios.de/svnroot/repos/openphysic/fieldeb_java/branches
#svn mkdir svn+ssh://scls19fr@svn.berlios.de/svnroot/repos/openphysic/fieldeb_java/tags

#svn mkdir svn+ssh://scls19fr@svn.berlios.de/svnroot/repos/openphysic/fieldeb_python_wx
#svn mkdir svn+ssh://scls19fr@svn.berlios.de/svnroot/repos/openphysic/fieldeb_python_wx/trunk
#svn mkdir svn+ssh://scls19fr@svn.berlios.de/svnroot/repos/openphysic/fieldeb_python_wx/branches
#svn mkdir svn+ssh://scls19fr@svn.berlios.de/svnroot/repos/openphysic/fieldeb_python_wx/tags

#svn mkdir svn+ssh://scls19fr@svn.berlios.de/svnroot/repos/openphysic/harmon_cpp_qt
#svn mkdir svn+ssh://scls19fr@svn.berlios.de/svnroot/repos/openphysic/harmon_cpp_qt/trunk
#svn mkdir svn+ssh://scls19fr@svn.berlios.de/svnroot/repos/openphysic/harmon_cpp_qt/branches
#svn mkdir svn+ssh://scls19fr@svn.berlios.de/svnroot/repos/openphysic/harmon_cpp_qt/tags

#svn mkdir svn+ssh://scls19fr@svn.berlios.de/svnroot/repos/openphysic/harmon_java
#svn mkdir svn+ssh://scls19fr@svn.berlios.de/svnroot/repos/openphysic/harmon_java/trunk
#svn mkdir svn+ssh://scls19fr@svn.berlios.de/svnroot/repos/openphysic/harmon_java/branches
#svn mkdir svn+ssh://scls19fr@svn.berlios.de/svnroot/repos/openphysic/harmon_java/tags

#svn mkdir svn+ssh://scls19fr@svn.berlios.de/svnroot/repos/openphysic/doc_classe_latex_phys_ch_pha
#svn mkdir svn+ssh://scls19fr@svn.berlios.de/svnroot/repos/openphysic/doc_classe_latex_phys_ch_pha/trunk
#svn mkdir svn+ssh://scls19fr@svn.berlios.de/svnroot/repos/openphysic/doc_classe_latex_phys_ch_pha/branches
#svn mkdir svn+ssh://scls19fr@svn.berlios.de/svnroot/repos/openphysic/doc_classe_latex_phys_ch_pha/tags



# Import des projets
# ==================
#svn -m "Initial import" import svn+ssh://svn.berlios.de/svnroot/repos/openphysic/fieldeb_cpp_wx/trunk