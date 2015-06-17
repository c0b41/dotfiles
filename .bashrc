# Style

source ~/.dotfiles/.funcs/style.sh

# Exports

export LC_ALL=tr_TR.UTF-8 
export LANG=tr_TR.UTF-8 
export LANGUAGE=tr_TR.UTF-8 
export nickname="ayhankuru"
export DROPBOX_USE_LIBAPPINDICATOR=1

## Sources 

if [ -f ~/server.sh ]; then
    source ~/.server.sh
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

source ~/.dotfiles/.funcs/all.sh



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
    echo "'${yellow}'"$(__git_ps1 "[ %s ⇡⇡ ]"); \
  fi) '${yellow}${color_off}'"; \
else \
  # @2 - Prompt when not in GIT repo
  echo " '${yellow}${color_off}'"; \
fi) \n ${blue} \w ${color_off} \n 👽  '  

 

