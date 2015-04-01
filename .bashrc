# Style

color_off=$(echo -e '\e[0m')
black=$(echo -e '\e[0;30m')
red=$(echo -e '\e[0;31m')
green=$(echo -e '\e[0;32m')
yellow=$(echo -e '\e[0;33m')
blue=$(echo -e '\e[0;34m')
purple=$(echo -e '\e[0;35m')
cyan=$(echo -e '\e[0;36m')
white=$(echo -e '\e[0;37m')
ochre=$(echo -e '\033[38;5;95m')
light_gray=$(echo -e '\033[0;37m')
bold=$(echo -e '\033[1m')
reset=$(echo -e '\033[0m')
ioversion=$(eval "iojs --version")
## Sources 

if [ -f ~/server.sh ]; then
    source ~/server.sh
fi

if [ -f~/.bash_gith ]; then
   source ~/.bash_git
fi

if [ -f ~/.local/bin/bashmarks.sh ]; then
   source ~/.local/bin/bashmarks.sh
fi

source ~/.git-completion.bash
source ~/.git-prompt.sh
source ~/.nvm/nvm.sh

function string_replace {
    echo "${1/\*/$2}"
}
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
## nodejs test replace iojs
function iotest
{
data="$(cat <<-EOF
	language: node_js
	node_js:
	  - iojs-v1.6.0
	EOF
	)" 
 datas="$(cat package.json | jq '.scripts.test="iojs node_modules/mocha/bin/mocha test.js --reporter spec --timeout 15000"')"
 command echo "$data" > .travis.yml 
 command echo "$datas" > package.json
 echo -e "${blue} Travis ci dosyası oluşturuldu :)  ${reset}"
}
## Circle ci added func
function circletest
{
data="$(cat <<-EOF
 machine:
   pre:
     - curl https://raw.githubusercontent.com/creationix/nvm/v0.23.3/install.sh | bash
   node:
     version: iojs-1.6.0
 dependencies:
   override:
     - npm install
 test:
   post:
     - npm test
EOF
)" 
 command echo "$data" > circle.yml 
 command git add circle.yml
 command git commit -m "circle ci test added"
 command git u
 echo -e "${blue} Circle ci dosyası oluşturuldu ve gönderildi :)  ${reset}"
}

## Appveyor  added func
function appveyortest
{
data="$(cat <<-EOF
init:
  - git config --global core.autocrlf true
environment:
  matrix:
    - nodejs_version: "1.6"
install:
  - ps: Install-Product node \$env:nodejs_version
  - npm install
build: off
test_script:
  - node --version
  - npm --version
  - npm run test
version: "{build}"
EOF
)" 
 command echo "$data" > appveyor.yml 
 command git add appveyor.yml
 command git commit -m "appveyor test added"
 command git u
 echo -e "${blue} Appveyor dosyası oluşturuldu ve gönderildi :)  ${reset}"
}

## npm packages creater
 function iop
 {
  if [ -z "$1" ]; then
    echo -e "${red}   İsim yok pnp :(  ${reset}"
  else
    command mkdir $1 && cd $1
    command ign create 
    command ign apply
    command npm init
    badge $nickname $1 > readme.md
    echo -e "${blue}   Readme.md oluşturuldu :)  ${reset}"
    iotest
    echo -e "${blue}   Hepsini Oluşturduk pnp :)  ${reset}"
  fi  
 }

function badge
{
template="$(cat <<-EOF
[![Travis Build Status](http://img.shields.io/travis/{{name}}/{{proje}}.svg?style=flat-square)](https://travis-ci.org/{{name}}/{{proje}}) [![Circle Build Status](https://img.shields.io/circleci/project/{{name}}/{{proje}}.svg?style=flat-square)](https://circleci.com/gh/{{name}}/{{proje}}) [![Appveyor Build Status](https://img.shields.io/appveyor/ci/{{name}}/{{proje}}.svg?style=flat-square)](https://ci.appveyor.com/project/{{name}}/{{proje}}) [![Build Status](https://img.shields.io/david/{{name}}/{{proje}}.svg?style=flat-square)](https://david-dm.org/{{name}}/{{proje}}) [![io.js supported](https://img.shields.io/badge/io.js-supported-green.svg?style=flat-square)](https://iojs.org)
EOF
  )"

echo $template | name=$1 proje=$2 mush 
}

function gitssh
{
  git remote set-url origin git@github.com:$1/$2.git
}

## git test hook create
function testhook
{
data="$(cat <<-EOF
#!/usr/bin/env bash
npm test
EOF
  )"
  command touch .git/hooks/pre-commit
  command echo "$data" > .git/hooks/pre-commit
  command chmod +x .git/hooks/pre-commit
  echo -e "${blue}   Git Test Hook'u oluşturuldu :)  ${reset}"
}

function youtube
{
command youtube-dl $1 -x -o "%(title)s.%(ext)s" --audio-format=mp3 --audio-quality=512k
}

function youtubelist
{
while read line
do
  command youtube-dl $line -x -o "%(title)s.%(ext)s" --audio-format=mp3 --audio-quality=512k
done < $1

}

function zipfolder
{
  zip -r $1 $2
}
# mp3 list name convert
#
function convertlist
{

oIFS=$IFS
IFS=$'\n'
  
find . -name '*.mp3' | while read -r i; do
  filename="${i%.*}"
  newname=($(echo $filename | ytclear))
  mv $i "${newname}.mp3"

done

IFS=$oIFS

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
## all java file compile
## javacompile $blabla
function javacompile
{
   arr=( $(find . -type f -name "*.java") )

   for I in ${!arr[*]}; do
	command javac ${arr[$I]}
   done

  echo -e "${blue}  Java Compile edildi  ${reset}"

  command java $1
}
## image convert to blur
function blur
{
  convert ./"$1" -resize 1137 -extent 1137x640 -blur 0x4 ./"new-$1"
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
export nickname="ayhankuru"

## windows env 
OS='uname'
if [ "${OS}" == "windowsnt" ]; then
  export GOROOT="c:/Go"
  export GOPATH=$HOME/GO
  export GOBIN=$GOPATH/bin
  export PATH=$PATH:$GOROOT/bin:$GOBIN 
fi


# Alias

alias ..='cd ..'
alias ....='cd ../..'
alias .....='cd ../../..'
alias ......='cd ../../../..'
alias today='garden $nickname' 

if [ -d "$HOME/opt/node-webkit" ]; then
    PATH="$PATH:$HOME/opt/node-webkit"
fi

# Prompt

#PS1='\[\033[0;35m\]  $nickname\[\033[0;30m\] [\e[0;31m iojs $ioversion \[\033[0;30m\]]\e[0;32m$(__git_ps1 "[ %s ]")\[\033[0;30m\] \[\033[0;35m\]\n  \[\033[00;34m\]\w\[\033[00m\] \n  ⚡ ' 

PS1='  ~ ${purple}$nickname${color_off} ${light_gray} [${color_off} ${yellow}iojs ${ioversion} ${light_gray}]${color_off} $(git branch &>/dev/null;\
if [ $? -eq 0 ]; then \
  echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
  if [ "$?" -eq "0" ]; then \
    # @4 - Clean repository - nothing to commit
    echo "'${green}'"$(__git_ps1 "[ %s ]"); \
  else \
    # @5 - Changes to working tree
    echo "'${yellow}'"$(__git_ps1 "[ %s ++ ]"); \
  fi) '${yellow}${color_off}'"; \
else \
  # @2 - Prompt when not in GIT repo
  echo " '${yellow}${color_off}'"; \
fi) \n ${blue} \w ${color_off} \n  ⚡ '  

 

