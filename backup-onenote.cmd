@echo off
cls
set local
title Backup OneNote files to Dropbox
REM ===========================================================================
REM ===========================================================================
REM ==                                                                       ==
REM ==	SCRIPT NAME:	backup_onenote.cmd                                     ==
REM ==	DESCRIPTION:	Copy OneNote file(s) to Dropbox directory.             ==
REM ==                                                                       ==
REM ==  LAST REVISOR:	Ramon Pichardo                                         ==
REM ==  LAST REVISED:	2021-01-02                                             ==
REM ==                                                                       ==
REM ==                                                                       ==
REM ==	SCRIPT REVISION HISTORY:                                             ==
REM ==                                                                       ==
REM ==                                                                       ==
REM ==	DATE	     REVISOR          DESCRIPTION                              ==
REM ==	2011-04-27   Ramon Pichardo   Created original script.               ==
REM ==	2021-01-02   Ramon Pichardo   Add IF EXIST and ERRORLEVEL checks.    ==
REM ==                                                                       ==
REM ==                                                                       ==
REM ==  TEMPLATE VERSION: 1.0                                                ==
REM ==                                                                       ==
REM ===========================================================================
REM ===========================================================================
echo.
echo.
set LOG=c:\users\%username%\desktop\onenotebackup.txt
if exist %LOG% erase %LOG%
echo.
echo It's time to backup your OneNote files.
echo.
pause
date /t > %LOG%
time /t >> %LOG%
taskkill /IM onenote* >> %LOG%

xcopy "C:\Users\%username%\Documents\OneNote Notebooks\Personal" "C:\Users\%username%\Dropbox\OneNote\Personal" /E /I /C /R /Y >> %LOG%

REM COPYIT.BAT -- Transfers all files in all subdirectories of
REM the source drive or directory (%1) to the destination 
REM drive or directory (%2)
REM xcopy %1 %2 /s /e /c /i /h /r /y /z

if ERRORLEVEL 5 goto diskerror 
if ERRORLEVEL 4 goto lowmemory 
if ERRORLEVEL 2 goto abort 
if ERRORLEVEL 1 goto nofiles 
if ERRORLEVEL 0 goto exit 

:diskerror
echo Disk error occured. Check disk.
goto exit

:lowmemory 
echo Insufficient memory to copy files or 
echo invalid drive or command-line syntax. 
goto exit 

:abort 
echo You pressed CTRL+C to end the copy operation. 
goto exit 

:nofiles
echo No files were found to copy.
goto exit

:exit
