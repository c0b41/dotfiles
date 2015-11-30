# Style

source ~/.dotfiles/.funcs/style.sh

# Exports

export LC_ALL=tr_TR.UTF-8
export LANG=tr_TR.UTF-8
export LANGUAGE=tr_TR.UTF-8
export nickname="ayhankuru"
export DROPBOX_USE_LIBAPPINDICATOR=1
export PORT=5000
export gt_lang="tr"

## Sources

if [ -f~/.bash_git ]; then
   source ~/.bash_git
fi

if [ -f ~/.git-completion.bash ]; then
   source ~/.git-completion.bash
fi

if [ -f ~/.git-prompt.sh ]; then
   source ~/.git-prompt.sh
fi

if [ -f ~/.nvm/nvm.sh ]; then
   source ~/.nvm/nvm.sh
fi


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
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Alias

source ~/.dotfiles/.funcs/alias.sh

# Prompt

#PS1='\[\033[0;35m\]  $nickname\[\033[0;30m\] [\e[0;31m iojs $ioversion \[\033[0;30m\]]\e[0;32m$(__git_ps1 "[ %s ]")\[\033[0;30m\] \[\033[0;35m\]\n  \[\033[00;34m\]\w\[\033[00m\] \n  ⚡ '

PS1='  ~ ${purple}$nickname${color_off} ${light_gray} [${color_off} ${yellow}iojs ${ioversion} ${light_gray}]${color_off} ⚡ ${light_gray}[${color_off} ${yellow}go $gversion${light_gray}] ⚡ [${color_off} ${yellow}todo ($todocount) ${light_gray}]${color_off} $(git branch &>/dev/null;\
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
