# Style

source ~/.dotfiles/.funcs/style.sh

# Exports

export LC_ALL=tr_TR.UTF-8 
export LANG=tr_TR.UTF-8 
export LANGUAGE=tr_TR.UTF-8 
export nickname="ayhankuru"

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

## Funcs

source ~/.dotfiles/.funcs/replace.sh
source ~/.dotfiles/.funcs/mkdir.sh
source ~/.dotfiles/.funcs/subl.sh
source ~/.dotfiles/.funcs/atom.sh
source ~/.dotfiles/.funcs/open.sh
source ~/.dotfiles/.funcs/compile.sh
source ~/.dotfiles/.funcs/iotest.sh
source ~/.dotfiles/.funcs/circletest.sh
source ~/.dotfiles/.funcs/appveyortest.sh
source ~/.dotfiles/.funcs/badge.sh
source ~/.dotfiles/.funcs/gitssh.sh
source ~/.dotfiles/.funcs/testhook.sh
source ~/.dotfiles/.funcs/youtube.sh
source ~/.dotfiles/.funcs/youtubelist.sh
source ~/.dotfiles/.funcs/zip.sh
source ~/.dotfiles/.funcs/convertlist.sh
source ~/.dotfiles/.funcs/gcn.sh
source ~/.dotfiles/.funcs/fln.sh
source ~/.dotfiles/.funcs/blur.sh



## windows env 
OS='uname'
if [ "${OS}" == "windowsnt" ]; then
  export GOROOT="c:/Go"
  export GOPATH=$HOME/GO
  export GOBIN=$GOPATH/bin
  export PATH=$PATH:$GOROOT/bin:$GOBIN 
fi


# Alias

source ~/.dotfiles/.funcs/alias.sh

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

 

