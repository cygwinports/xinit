@echo off
SET DISPLAY=127.0.0.1:0.0


REM 
REM The path in the CYGWIN_ROOT environment variable assignment assume
REM that Cygwin is installed in a directory called 'cygwin' in the root
REM directory of the current drive.  You will only need to modify
REM CYGWIN_ROOT if you have installed Cygwin in another directory.  For
REM example, if you installed Cygwin in \foo\bar\baz\cygwin, you will need 
REM to change \cygwin to \foo\bar\baz\cygwin.
REM 
REM This batch file will almost always be run from the same drive (and
REM directory) as the drive that contains Cygwin/X, therefore you will
REM not need to add a drive letter to CYGWIN_ROOT.  For example, you do
REM not need to change \cygwin to c:\cygwin if you are running this
REM batch file from the C drive.
REM 

SET CYGWIN_ROOT=\cygwin
SET RUN=%CYGWIN_ROOT%\bin\run -p /usr/bin

SET PATH=.;%CYGWIN_ROOT%\bin;%PATH%

SET XAPPLRESDIR=
SET XCMSDB=
SET XKEYSYMDB=
SET XNLSPATH=


REM
REM Cleanup after last run.
REM

if not exist %CYGWIN_ROOT%\tmp\.X11-unix\X0 goto CLEANUP-FINISH
attrib -s %CYGWIN_ROOT%\tmp\.X11-unix\X0
del %CYGWIN_ROOT%\tmp\.X11-unix\X0

:CLEANUP-FINISH
if exist %CYGWIN_ROOT%\tmp\.X11-unix rmdir %CYGWIN_ROOT%\tmp\.X11-unix


REM
REM The error "Fatal server error: could not open default font 'fixed'" is
REM caused by using a DOS mode mount for the mount that the Cygwin/X
REM fonts are accessed through.  See the Cygwin/X FAQ for more 
REM information:
REM http://x.cygwin.com/docs/faq/cygwin-x-faq.html#q-error-font-eof
REM

if "%OS%" == "Windows_NT" goto OS_NT

REM Windows 95/98/Me
echo startxwin.bat - Starting on Windows 95/98/Me

goto STARTUP

:OS_NT

REM Windows NT/2000/XP/2003
echo startxwin.bat - Starting on Windows NT/2000/XP/2003

:STARTUP

REM Description of XWin-specific options is in XWin(1) manpage.


REM
REM Startup the programs
REM


REM Startup the X Server with the integrated Windows-based window manager.
REM WARNING: Do not use 'xwinclip' in conjunction with the ``-clipboard''
REM command-line parameter for XWin.  Doing so would start two clipboard
REM managers, which is never supposed to happen.

%RUN% XWin -multiwindow -clipboard -silent-dup-error


REM Startup an xterm, using bash as the shell.

%RUN% xterm -e /usr/bin/bash -l


REM
REM Startup the twm window manager.
REM WARNING: Do not use an external window manager in conjunction with
REM the ``-multiwindow'' command-line parameter for XWin.  Doing so
REM would start two window managers, which is never supposed to happen.
REM

REM %RUN% twm


REM Set a background color.  Only needed when not using -multwindow for XWin.

REM %RUN% xsetroot -solid aquamarine4
