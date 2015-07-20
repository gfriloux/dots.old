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


