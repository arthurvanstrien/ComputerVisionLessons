@echo off
echo We are gonna make everything work in one single step!
echo Select ze home folder of OpenCV...
cd /d %~dp0
setlocal
set "psCommand="(new-object -COM 'Shell.Application')^
.BrowseForFolder(0,'Please choose a folder.',0,0).self.path""
for /f "usebackq delims=" %%I in (`powershell %psCommand%`) do set "folder=%%I"
setlocal enabledelayedexpansion
echo Thanks, you selected !folder!
echo Making symlinks...
mklink /D opencv "!folder!"
mklink opencv_world341d.dll  opencv\build\x64\vc15\bin\opencv_world341d.dll
endlocal
echo Done!
pause