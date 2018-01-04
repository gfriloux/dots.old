lps()
{
   tail -f $1 | perl -e 'while (<>) {$l++;if (time > $e) {$e=time;print "$l\n";$l=0}}'
}

paste()
{
   curl -F 'sprunge=<-' http://sprunge.us
}

share()
{
   if [ $# -eq 0 ]; then
      echo "No arguments specified. Usage:"
      echo "share /tmp/test.md"
      echo "cat /tmp/test.md | share test.md"
      return 1
   fi

   # write to output to tmpfile because of progress bar
   tmpfile=$(mktemp -t transferXXX );

   if tty -s; then
      basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g');
      curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile;
   else
      curl --progress-bar --upload-file "-" "https://transfer.sh/$1"
   fi

   cat $tmpfile; rm -f $tmpfile;
}

cl() {
    dir=$1
    if [[ -z "$dir" ]]; then
        dir=$HOME
    fi
    if [[ -d "$dir" ]]; then
        cd "$dir"
        ls
    else
        echo "bash: cl: '$dir': Directory not found"
    fi
}

# Display image with tput
# https://gist.github.com/heptal/6052573
image() {
  convert $1 -resize 40 txt:-|sed -E 's/://;s/\( ? ?//;s/, ? ?/,/g;s/\)//;s/([0-9]+,[0-9]+,[0-9]+),[0-9]+/\1/g;s/255/254/g;/mage/d'|awk '{print $1,$2}'|sed -E 's/^0,[0-9]+ /print "echo;tput setaf "\;/;s/^[0-9]+,[0-9]+ /print "tput setaf ";/;s/(.+),(.+),(.+)/\1\/42.5*36+\2\/42.5*6+\3\/42.5+16/'|bc|sed 's/$/;echo -n "  ";/'|tr '\n' ' '|sed 's/^/tput rev;/;s/; /;/g;s/$/tput sgr0;echo/'|bash
}
