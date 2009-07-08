@echo off
SET DISPLAY=127.0.0.1:0.0


REM 
REM This batch file is intended to be run from the same drive and
REM directory that is mapped to Cygwin's /usr/bin directory, i.e.
REM C:\cygwin\ in a default installation, in which case it can find
REM the cygwin directory automatically.
REM
REM If you have copied this batch file into another directory. You
REM will need to provide CYGWIN_ROOT, either by uncommenting and
REM editing the line below, or by setting CYGWIN_ROOT in your
REM environment

REM SET CYGWIN_ROOT=C:\cygwin
if defined CYGWIN_ROOT goto :OK
set CYGWIN_ROOT=%~dp0\..
:OK

SET RUN=%CYGWIN_ROOT%\bin\run -p /usr/bin

SET PATH=%CYGWIN_ROOT%\bin;%PATH%

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
REM Startup the programs
REM


REM Startup the X Server with the integrated Windows-based window manager.
REM WARNING: Do not use 'xwinclip' in conjunction with the ``-clipboard''
REM command-line parameter for XWin.  Doing so would start two clipboard
REM managers, which is never supposed to happen.

REM Description of XWin-specific options is in XWin(1) manpage.

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
