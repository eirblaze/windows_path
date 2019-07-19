@echo off

set newpath=%~d1%~p1
set newpath=%PATH2%;%newpath:~0,-1%
set newpath="%newpath%"

setx PATH2 %newpath%
pause
