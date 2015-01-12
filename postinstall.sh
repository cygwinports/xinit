case $(uname -s) in *-WOW64) wow64=" (32-bit)" ;; esac
/usr/bin/mkdir -p "$(/usr/bin/cygpath $CYGWINFORALL -P)/Cygwin-X${wow64}"
/usr/bin/mkshortcut $CYGWINFORALL -P -w / -i /usr/bin/XWin.exe -n "Cygwin-X${wow64}/XWin Server" -a "--quote /usr/bin/bash.exe -l -c \"cd; /usr/bin/startxwin\"" /usr/bin/run.exe
