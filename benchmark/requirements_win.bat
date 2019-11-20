@echo off
PUSHD "%~dp0"


rem fltmc >nul 2>&1 && goto :run || powershell -ex unrestricted -Command "Start-Process -Verb RunAs -FilePath '%comspec%' -ArgumentList '/c %~fnx0 %*'"
fltmc >nul 2>&1 && goto :run || (powershell start -verb runas '%0' )
timeout 3
goto :eof
:run

if not exist %PROGRAMDATA%\chocolatey\bin\choco.exe (

  @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
)




choco install  cygwin cyg-get addo  alacritty.install  notepad3.install  diskspd fio dd sync wget git

rem wget https://wj32.org/wp/download/1455/

pause

