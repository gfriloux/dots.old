[[ $- != *i* ]] && return

alias xterm="xterm -fa inconsolata-9"
alias nano="nano -c"
alias mount='mount | column -t'

export TERM="xterm-256color"
export VISUAL=nano
export EDITOR="nano"
export LANG=fr_FR.UTF-8
export MANPAGER="/usr/bin/most -s"

if [ -e /etc/arch-release ]; then
  export PATH="/usr/lib/colorgcc/bin/:$PATH"
  export CCACHE_PATH="/usr/bin" 
fi

#PS1='\[\033[01;34m\]> \[\033[00m\]'
