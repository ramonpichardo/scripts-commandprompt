@echo off
cls
set local
title Map My Home Directory (U:\)
REM ===========================================================================
REM ===========================================================================
REM ==                                                                       ==
REM ==	SCRIPT NAME:	map_home_directory.cmd                                 ==
REM ==	DESCRIPTION:	Map my network home directory.                         ==
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
set DOMAIN=domainname
set SERVERNAME=srv10
if exist u: (net use u: /delete /yes) 2> nul
echo.
echo This program will map the following network home directory:
echo.
echo + U
echo.
echo.
echo Please enter your network password for the network home directory.
echo.
echo.
net use u: \\%servername%\%username%$ * /user:%domain%\%username% /persistent:yes >nul
IF ERRORLEVEL 1 echo "Not Mapped: Home Directory"
IF ERRORLEVEL 1 echo.
IF ERRORLEVEL 0 echo "Mapped: Home Directory"
IF ERRORLEVEL 0 echo.
IF ERRORLEVEL 0 explorer u:
pause
exit
