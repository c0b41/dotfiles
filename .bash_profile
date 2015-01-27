color_off='\e[0m'
black='\e[0;30m'
red='\e[0;31m'
green='\e[0;32m'
yellow='\e[0;33m'
blue='\e[0;34m'
purple='\e[0;35m'
cyan='\e[0;36m'
white='\e[0;37m'

export nickname="ayhankuru"

source "gh.sh"

source "spark.sh"
 
PS1='\[\033[0;35m\]$nickname\[\033[0;30m\] [\e[0;31m iojs $(eval "node --version")\[\033[0;30m\]] \e[0;32m$(__git_ps1)\[\033[0;30m\] \[\033[0;35m\]\n \[\033[00;34m\]\w\[\033[00m\] λ ' 
#PS2='\[\033[01;30m\]\t `if [ $? = 0 ]; then echo "\[\033[01;32m\]ツ"; else echo "\[\033[01;31m\]✗"; fi` \[\033[00;31m\]\h\[\033[00;37m\]:\[\033[00;34m\]\w\[\033[00m\] >'

alias ..='cd ..'
alias ....='cd ../..'
alias .....='cd ../../..'
alias ......='cd ../../../..' 


--() { cd $1; }

function mkdir
{
  command mkdir $1 && cd $1
}


function subl
{
  command subl $1 && cd $1
}

function gcn
{
	command git log --format='%aN' | sort -u | while read name; do echo -en "$name\t"; git log --author="$name" --pretty=tformat: --numstat | awk '{ add += $1; subs += $2; loc += $1 - $2 } END { printf "added lines: %s, removed lines: %s, total lines: %s\n", add, subs, loc }' -; done
}

function fln
{
   arr=( $(find . -type f) )

    chunk="["
   for I in ${!arr[*]}; do

        if [ $((${#arr[*]} -1)) == $I ]; then
              chunk+="'${arr[$I]}'"
        else          
              chunk+="'${arr[$I]}'," 
        fi
  done
  chunk+="]"

  echo ${chunk}
}

 

function gif {
  if [ -z "$1" ]; then
    echo "No input file given. Example: gifify example.mov [max width (pixels)]"
    return 1
  fi

  output_file="${1%.*}.gif"

  echo "Creating $output_file..."

  if [ ! -z "$2" ]; then
    maxsize="-vf scale=$2:-1"
  else
    maxsize=""
  fi

   ffmpeg -loglevel panic -i $1 $maxsize -r 10 -vcodec png gifify-tmp-%05d.png
  convert +dither -layers Optimize gifify-tmp-*.png GIF:- | gifsicle --no-warnings --colors 256 --delay=10 --loop --optimize=3 --multifile - > $output_file
  rm gifify-tmp-*.png

  echo "Done."
}

export LC_ALL=tr_TR.UTF-8 
export LANG=tr_TR.UTF-8 
export LANGUAGE=tr_TR.UTF-8 
 

export GOROOT="c:/Go"

export GOPATH=$HOME/GO

export GOBIN=$GOPATH/bin

export PATH=$PATH:$GOROOT/bin:$GOBIN

alias lama="$HOME/AppData/Roaming/lama/bin/lama.sh" 

alias node='iojs'
 
