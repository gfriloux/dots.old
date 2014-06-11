[[ $- != *i* ]] && return

alias xterm="xterm -fa inconsolata-9"
alias ls="/usr/bin/vendor_perl/ls++"
alias df="dfc"
alias du="ncdu"
alias nano="nano -c"


export TERM="xterm-256color"
export PATH="/usr/lib/colorgcc/bin/:$PATH"
export CCACHE_PATH="/usr/bin" 
export EDITOR="nano"

PS1='\[\033[01;34m\]> \[\033[00m\]'
