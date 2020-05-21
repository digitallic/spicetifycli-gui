:: WE SHALL BEGIN.

:: dev notes
::  [DONE] add backup feature (maybe that's also the install?)
::  [DONE] add restore feature

:init
@echo off
color 0f
mode con cols=60 lines=30
title spicetifycli gui by digitallic
cls

:theme
cls
echo.
echo.
echo     [help] if you need help
echo.
echo     Input:
set theme=spicetify-default
set /p theme=^ ^ ^>^> 
if %theme%==exit goto end
if %theme%==help goto help
if %theme%==themes goto github
if %theme%==backup goto backup
echo.
echo     Press [F] to confirm
echo     Press [X] to go back
choice -c fx -n
if %errorlevel%==1 goto apply
if %errorlevel%==2 goto theme
goto init

:help
cls
echo.
echo.
echo     You can apply any themes currently in
echo    /.spicetify/themes/ typing their folder
echo    name, non caps-sensitive
echo.
echo     [install]
echo    installs spicetifycli if you, for some
echo    reason, downloaded this script first
echo.
echo     [backup]
echo    backup menu with relevant commands
echo.
echo     [exit]
echo    exits script
echo.
echo     [themes]
echo    takes you to a github repo to help you
echo    get started with a few preset themes
echo    (opens in your default browser)
echo.
echo.
echo     Press any key to continue...
echo.
echo.
echo                                    .bat developed by
echo                                    github.com/digitallic
pause>nul
goto theme

:backup
cls
echo.
echo     Press [F] to backup and apply
echo     Press [R] to restore backup
echo     Press [C] to clear backup
echo     Press [X] to go back
choice -c frcx -n
if %errorlevel%==1 goto backup2
if %errorlevel%==2 goto backup3
if %errorlevel%==3 goto backup4
if %errorlevel%==4 goto theme
:backup2
cls
spicetify backup apply
echo.
echo     Press any key to continue...
pause>nul
goto theme
:backup3
cls
spicetify restore
echo     Press any key to continue...
pause>nul
goto theme
:backup4
cls
spicetify clear
echo     Press any key to continue...
pause>nul
goto theme

:github
cls
echo.
echo.
start https://github.com/morpheusthewhite/spicetify-themes
goto theme

:apply
cls
spicetify config current_theme %theme%
cls
spicetify apply
cls
echo.
echo.
echo     Applied.
goto theme

:end
cls
exit

::  
::  spicetify cli by khanhas (https://github.com/khanhas/spicetify-cli)
::  theme collection by morpheusthewhite (https://github.com/morpheusthewhite/spicetify-themes)
::  
::  this is just a simple interface to ease the tedious process of
::  changing spicetify themes.
::  
::  it COULD be shorter, but things like this have to look nice, too.
::
::  feel free to fuck around with this.
::
::
::  2020 digitallic
::  