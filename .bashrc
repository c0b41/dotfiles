# Style

color_off='\e[0m'
black='\e[0;30m'
red='\e[0;31m'
green='\e[0;32m'
yellow='\e[0;33m'
blue='\e[0;34m'
purple='\e[0;35m'
cyan='\e[0;36m'
white='\e[0;37m'

 
# Prompt

PS1='\[\033[0;35m\]$nickname\[\033[0;30m\] [\e[0;31m iojs $(eval "iojs --version")\[\033[0;30m\]] \e[0;32m$(__git_ps1)\[\033[0;30m\] \[\033[0;35m\]\n \[\033[00;34m\]\w\[\033[00m\] λ ' 

# Func
##  mkdir func or open directory
function mkdir
{
  command mkdir $1 && cd $1
}

## sublime text open or open directory
function subl
{
  command subl $1 && cd $1
}
## atom editor open or open directory
function atom
{
  command atom $1 && atom $1
}

## open folder directory
function open
{
  command start $PWD/$1 && cd $1
}

## compile c file
function compile
{
  filename="$1.c"
  exe="$1.exe"
  command gcc $filename -o $1 && $exe 
}

function iotest
{
data="$(cat <<-EOF
	language: node_js
	node_js:
	  - iojs-v1.0.2
	EOF
	)" 
 datas="$(cat package.json | jq '.scripts.test="iojs node_modules/mocha/bin/mocha test.js --reporter spec --timeout 15000"')"
 command echo "$data" > .travis.yml 
 command echo "$datas" > package.json
 command git add .
 command git commit -m "io test added"
 command git u
}


## git stats 
function gcn
{
	command git log --format='%aN' | sort -u | while read name; do echo -en "$name\t"; git log --author="$name" --pretty=tformat: --numstat | awk '{ add += $1; subs += $2; loc += $1 - $2 } END { printf "added lines: %s, removed lines: %s, total lines: %s\n", add, subs, loc }' -; done
}
## directory list file return json list
## @usage fln ext {html,js} > list.json
function fln
{
   arr=( $(find . -type f -name "*.$1") )
   echo arr
    chunk="{list:{["
   for I in ${!arr[*]}; do

        if [ $((${#arr[*]} -1)) == $I ]; then
              chunk+="'${arr[$I]}'"
        else          
              chunk+="'${arr[$I]}'," 
        fi
  done
  chunk+="]}"

  echo ${chunk}
}

 
## video convert  to gif
## @usage gif example.mov
function gif {
  if [ -z "$1" ]; then
    echo "No input file given. Example: gif example.mov [max width (pixels)]"
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



# Exports
export LC_ALL=tr_TR.UTF-8 
export LANG=tr_TR.UTF-8 
export LANGUAGE=tr_TR.UTF-8 

export GOROOT="c:/Go"

export GOPATH=$HOME/GO

export GOBIN=$GOPATH/bin

export PATH=$PATH:$GOROOT/bin:$GOBIN

export nickname="ayhankuru"

# Alias

alias ..='cd ..'
alias ....='cd ../..'
alias .....='cd ../../..'
alias ......='cd ../../../..' 
alias lol_joyent='node' 
alias node='echo " type lol_joyent "' 
alias today='garden $nickname' 
alias server='ssh root@104.236.32.41'
