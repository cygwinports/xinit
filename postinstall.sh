/usr/bin/mkdir -p "$(/usr/bin/cygpath $CYGWINFORALL -P)/Cygwin-X"
/usr/bin/mkshortcut $CYGWINFORALL -P -w / -i /usr/bin/XWin.exe -n "Cygwin-X/XWin Server" -a "--quote /usr/bin/bash.exe -l -c \"cd; /usr/bin/startxwin\"" /usr/bin/run.exe
