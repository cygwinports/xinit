#! /bin/sh
export DISPLAY=127.0.0.1:0.0
export PATH=/usr/bin:"$PATH"

unset XAPPLRESDIR
unset XCMSDB
unset XKEYSYMDB
unset XNLSPATH


# Cleanup from last run.
rm -rf /tmp/.X11-unix


#
# Startup the programs
#


# Startup the X Server with the integrated Windows-based window manager.
# WARNING: Do not use 'xwinclip' in conjunction with the ``-clipboard''
# command-line parameter for XWin.  Doing so would start two clipboard
# managers, which is never supposed to happen.

# Description of XWin-specific options is in XWin(1) manpage.

XWin -multiwindow -clipboard -silent-dup-error &


# Startup an xterm, using bash as the shell.

xterm -e /usr/bin/bash -l &


#
# Startup the twm window manager.
# WARNING: Do not use an external window manager in conjunction with
# the ``-multiwindow'' command-line parameter for XWin.  Doing so
# would start two window managers, which is never supposed to happen.
#

# twm &


# Set a background color.  Only needed when not using -multwindow for XWin.

# xsetroot -solid aquamarine4


# Return from sh.
exit
