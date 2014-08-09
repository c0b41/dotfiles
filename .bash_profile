color_off='\e[0m'
black='\e[0;30m'
red='\e[0;31m'
green='\e[0;32m'
yellow='\e[0;33m'
blue='\e[0;34m'
purple='\e[0;35m'
cyan='\e[0;36m'
white='\e[0;37m'

export nickname="cobaimelan"

 
PS1='\[\033[0;35m\]$nickname\[\033[0;30m\] [\e[0;31m$(eval "node --version")\[\033[0;30m\]]|(\e[0;32m$(eval "lama count") Task\[\033[0;30m\])|\e[0;32m$(__git_ps1)\[\033[0;30m\] λ\[\033[0;35m\]\n \[\033[00;34m\]\w\[\033[00m\] > ' 
#PS2='\[\033[01;30m\]\t `if [ $? = 0 ]; then echo "\[\033[01;32m\]ツ"; else echo "\[\033[01;31m\]✗"; fi` \[\033[00;31m\]\h\[\033[00;37m\]:\[\033[00;34m\]\w\[\033[00m\] >'

alias ..='cd ..'
alias ....='cd ../..'
alias .....='cd ../../..'
alias ......='cd ../../../..' 


--() { cd $1; }

export LC_ALL=tr_TR.UTF-8 
export LANG=tr_TR.UTF-8 
export LANGUAGE=tr_TR.UTF-8 
 

export GOROOT="c:/Go"

export GOPATH=$HOME/GO

export GOBIN=$GOPATH/bin

export PATH=$PATH:$GOROOT/bin:$GOBIN

alias subl="/c/Program\ Files/Sublime\ Text\ 3/sublime_text.exe"
alias atom="/c/Users/Ayhan/Atom/atom.exe"


alias lama="$HOME/AppData/Roaming/lama/bin/lama.sh" 


 alias lama="$HOME/AppData/Roaming/lama/bin/lama.sh" 

 alias lama="$HOME/AppData/Roaming/lama/bin/lama.sh" 

 alias lama="$HOME/AppData/Roaming/lama/bin/lama.sh" 
