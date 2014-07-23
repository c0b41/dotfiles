color_off='\e[0m'
black='\e[0;30m'
red='\e[0;31m'as
green='\e[0;32m'
yellow='\e[0;33m'
blue='\e[0;34m'
purple='\e[0;35m'
cyan='\e[0;36m'
white='\e[0;37m'

export nickname="cobaimelan"
 
PS1='\[\033[0;35m\]$nickname\[\033[0;30m\] λ\[\033[0;35m\] [ \[\033[0;36m\]\w\[\033[0;35m\] ] \[\033[0;36m\]->\[\033[0m\] ' 
#PS2='\[\033[01;30m\]\t `if [ $? = 0 ]; then echo "\[\033[01;32m\]ツ"; else echo "\[\033[01;31m\]✗"; fi` \[\033[00;31m\]\h\[\033[00;37m\]:\[\033[00;34m\]\w\[\033[00m\] >'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..' 

alias lama="$HOME/bin/lama/lama.sh"

--() { cd $1; }

# PATHS

export GOROOT=$HOME/go

export PATH=$PATH:$GOROOT/bin