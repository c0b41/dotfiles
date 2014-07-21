color_off='\e[0m'
black='\e[0;30m'
red='\e[0;31m'
green='\e[0;32m'
yellow='\e[0;33m'
blue='\e[0;34m'
purple='\e[0;35m'
cyan='\e[0;36m'
white='\e[0;37m'


 
PS1='\[\033[0;35m\]\u\[\033[0;30m\] λ\[\033[0;35m\] [ \[\033[0;36m\]\w\[\033[0;35m\] ] \[\033[0;36m\]->\[\033[0m\] ' 

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'



--() { cd $1; }