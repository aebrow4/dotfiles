alias cddoc='cd ~/Documents'
function cl () {
  cd $1
  gls --color=tty
}
alias gb='git branch -v'
alias gs='git status'
alias gr='git remote -v'
alias gl='git log'
alias gd='git diff'
alias gpoa='git pull origin automerge'
alias gcpl='git checkout package-lock.json'
alias a='atom .'
alias ports='lsof -i -P | grep LISTEN'
alias postgres-start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias postgres-stop=.pg_ctl -D /usr/local/var/postgres stop -s -m fast.
alias refreshtranslations='rake i18n:js:export'
alias c='clear'
alias rmswp='find . -name "*.swp" -delete'
alias pubip='dig +short myip.opendns.com @resolver1.opendns.com'


# env vars
export ZSH="$HOME/.oh-my-zsh"


function killport() {
  kill -9 $(lsof -sTCP:LISTEN -i:$1 -t)
}
function rmv() {
  find . -name $1 -delete
}
function count() {
  find $1 -name "*" | wc -l
}
function gcb() {
  git checkout -b $1
}
# TODO: make autocomplete work for these two
function gc() {
  git checkout $1
}
function gbd() {
  git branch -D $1
}
function squash () {
  git rebase --interactive HEAD~$1
}

# Machine-specific configuration
# ABMACHINE variable must be set outside of this file
if [[ $ABMACHINE = 'pg' ]]; then
  export VIMRUNTIME="/usr/local/Cellar/vim/8.1.0500/share/vim/vim81"
  alias cdpw='cd ~/Documents/dev/PlanWeb && nvm use --delete-prefix v8.2.1'
  alias cdd='cd ~/Documents/dev'
  function docker-login() {
    eval $(AWS_PROFILE=plangrid aws ecr get-login --no-include-email)
  }
  function karmatest() {
    node --max-old-space-size=8192 node_modules/.bin/karma start --test-dir=spec/karma/$1
  }
  export PG_HOME='/Users/abrown/Documents/dev'
  export WORKON_HOME='/Users/abrown/.virtualenvs'
  export PROJECT_HOME='/Users/abrown/Devel'
  PATH="/opt/local/bin:/opt/local/sbin:/usr/local/opt/findutils/libexec/gnubin:$PATH"
  # set nvm path
  export NVM_DIR="$HOME/.nvm"
  . "$(brew --prefix nvm)/nvm.sh"
  export VIRTUALENVWRAPPER_SCRIPT="/usr/local/bin/virtualenvwrapper.sh"
  source /usr/local/bin/virtualenvwrapper_lazy.sh
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
elif [[ $ABMACHINE = 'personal' ]]; then
  export VIMRUNTIME="/usr/local/Cellar/vim/8.0.1200/share/vim/vim80"
  alias vim='/usr/local/Cellar/vim/8.0.1200/bin/vim'
  alias postgres="postgres -D /usr/local/var/postgres9.6.1"
  alias cdd="cd ~/Documents/ab/dev"
  alias cdab="cd ~/Documents/ab"
  alias cdgo="cd ~/Documents/ab/dev/go"
  # fast find
  function ffind() {
    sudo find . -not \( \
      -path ./Applications -prune -o \
      -path ./Library -prune -o \
      -path ./System -prune -o \
      -path ./Volumes -prune \
     \) -name $1
  }
  export PATH="$PATH:$HOME/.rvm/bin"
  export PATH="$PATH:$HOME/Documents/ab/dev/go/bin"
  export GOPATH="/Users/andrewbrown/Documents/ab/dev/go"
  PATH='/usr/local/Cellar/python3/3.6.1/bin':$PATH
  # The next line updates PATH for the Google Cloud SDK.
  if [ -f '/Users/andrewbrown/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/andrewbrown/google-cloud-sdk/path.zsh.inc'; fi
  
  # The next line enables shell command completion for gcloud.
  if [ -f '/Users/andrewbrown/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/andrewbrown/google-cloud-sdk/completion.zsh.inc'; fi
fi 


ZSH_THEME="lambda"
# autoload -U promptinit; promptinit
# prompt lambda-pure

source $ZSH/oh-my-zsh.sh

PATH=$HOME/.rbenv:$PATH
eval "$(rbenv init -)"

bindkey "^[^[[D" backward-word
bindkey "^[^[[C" forward-word

# Colorize man pages:
export LESS_TERMCAP_mb=$(printf '\e[01;31m') # enter blinking mode - red
export LESS_TERMCAP_md=$(printf '\e[01;35m') # enter double-bright mode - bold, magenta
export LESS_TERMCAP_me=$(printf '\e[0m') # turn off all appearance modes (mb, md, so, us)
export LESS_TERMCAP_se=$(printf '\e[0m') # leave standout mode
export LESS_TERMCAP_so=$(printf '\e[01;33m') # enter standout mode - yellow
export LESS_TERMCAP_ue=$(printf '\e[0m') # leave underline mode
export LESS_TERMCAP_us=$(printf '\e[04;36m') # enter underline mode - cyan


source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

