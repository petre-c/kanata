@echo off
rem Start Kanata by hand, or restart it after editing kanata.kbd.
rem
rem Stops any Kanata that is already running first, because two copies hooking
rem the keyboard at once double every remapped key. Then starts kanata.exe from
rem this folder with kanata.kbd, with no console window, the same way the
rem Startup shortcut (Kanata.lnk) does at logon.
rem
rem Reachable from the Start menu as "Kanata": press Win, type kanata, Enter.
rem Without Kanata the Win key is outer right thumb + A on the W-CORNE.

taskkill /IM kanata.exe /F >nul 2>&1

powershell -NoProfile -WindowStyle Hidden -Command "Start-Process -FilePath '%~dp0kanata.exe' -ArgumentList '--cfg','%~dp0kanata.kbd' -WorkingDirectory '%~dp0' -WindowStyle Hidden"
