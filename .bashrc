[[ $- != *i* ]] && return

http_serve()
{
   :;while [ $? -eq 0 ];do nc -vlp 8080 -c'(r=read;e=echo;$r a b c;z=$r;while [ ${#z} -gt 2 ];do $r z;done;f=`$e $b|sed 's/[^a-z0-9_.-]//gi'`;h="HTTP/1.0";o="$h 200 OK\r\n";c="Content";if [ -z $f ];then($e $o;ls|(while $r n;do if [ -f "$n" ]; then $e "<a href=\"/$n\">`ls -gh $n`</a><br>";fi;done););elif [ -f $f ];then $e "$o$c-Type: `file -ib $f`\n$c-Length: `stat -c%s $f`";$e;cat $f;else $e -e "$h 404 Not Found\n\n404\n";fi)';done
}

# Convert video to gif file.
# Usage: video2gif video_file (scale) (fps)
video2gif() {
  ffmpeg -y -i "${1}" -vf fps=${3:-10},scale=${2:-320}:-1:flags=lanczos,palettegen "${1}.png"
  ffmpeg -i "${1}" -i "${1}.png" -filter_complex "fps=${3:-10},scale=${2:-320}:-1:flags=lanczos[x];[x][1:v]paletteuse" "${1}".gif
  rm "${1}.png"
}

alias xterm="xterm -fa inconsolata-9"
alias friloux_stats='(echo "stats"; sleep 3) | nc friloux.me 79'
alias friloux_backup='(echo "backup"; sleep 3) | nc friloux.me 79'
alias micro='TERM=xterm-256color micro'
alias µ='TERM=xterm-256color micro'
#export TERM="xterm-256color"
export TERM="screen-256color"
export VISUAL=nano
export EDITOR="nano"
export LANG=fr_FR.UTF-8
export MANPAGER="most -s"
export PAGER="most -s"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export GOOGLE_API_KEY="AIzaSyCFbKnxcHYjvEI4qJE24yrUYfdcfNoATn4"
export CPPFLAGS='-I/usr/local/include'
export LDFLAGS='-L/usr/local/lib'
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH+=":/home/kuri/.gem/ruby/2.4.0/bin"
eval "$(rbenv init -)"

if [ -e /etc/arch-release ]; then
  export PATH="/usr/lib/colorgcc/bin/:$PATH"
  export CCACHE_PATH="/usr/bin" 
fi

. ~/.config/bash/functions.sh

PATH+=":/home/kuri/.gem/ruby/2.3.0/bin"

source ~/.config/bash/pass
source ~/.config/bash/liquidprompt

if [ -d "$HOME/adb-fastboot/platform-tools" ] ; then
  export PATH="$HOME/adb-fastboot/platform-tools:$PATH"
fi

#PS1='\[\033[01;34m\]> \[\033[00m\]'
