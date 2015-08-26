[[ $- != *i* ]] && return

alias xterm="xterm -fa inconsolata-9"
alias mount='mount | column -t'
alias friloux_stats='(echo "stats"; sleep 3) | nc friloux.me 79'
alias friloux_backup='(echo "backup"; sleep 3) | nc friloux.me 79'

export TERM="xterm-256color"
export VISUAL=nano
export EDITOR="nano"
export LANG=fr_FR.UTF-8
export MANPAGER="most -s"

export CPPFLAGS='-I/usr/local/include'
export LDFLAGS='-L/usr/local/lib'

if [ -e /etc/arch-release ]; then
  export PATH="/usr/lib/colorgcc/bin/:$PATH"
  export CCACHE_PATH="/usr/bin" 
fi

. ~/.config/bash/functions.sh

source ~/.config/bash/pass
source ~/.config/bash/liquidprompt

#PS1='\[\033[01;34m\]> \[\033[00m\]'
