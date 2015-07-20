[[ $- != *i* ]] && return

alias xterm="xterm -fa inconsolata-9"
alias ls="/usr/bin/vendor_perl/ls++"
alias nano="nano -c"
alias mount='mount | column -t'

export TERM="xterm-256color"
export PATH="/usr/lib/colorgcc/bin/:$PATH"
export CCACHE_PATH="/usr/bin" 

export VISUAL=nano
export EDITOR="nano"

export LANG=fr_FR.UTF-8

MANPAGER="/usr/bin/most -s"

#PS1='\[\033[01;34m\]> \[\033[00m\]'
