@echo off
rem Start Kanata by hand, or restart it after editing kanata.kbd. The Startup
rem shortcut (Kanata.lnk) runs this same file at logon.
rem
rem Stops any Kanata that is already running first, because two copies
rem remapping the keyboard at once double every remapped key. Then starts
rem Kanata from this folder with kanata.kbd, with no console window.
rem
rem Which Kanata:
rem   kanata_wintercept.exe  when the Interception driver is installed. It
rem       remaps inside the keyboard driver stack, so Remote Desktop, the lock
rem       screen and elevated windows all get the remapped keys.
rem   kanata.exe             otherwise. It uses a keyboard hook, which the
rem       Remote Desktop client overrides while its window has focus, and
rem       which does not reach the lock screen or elevated windows.
rem The driver is installed once with install-interception-driver.cmd; it is
rem present when Windows has drivers\keyboard.sys.
rem
rem Reachable from the Start menu as "Kanata" (Win, type kanata, Enter) and
rem from the board: outer right thumb + bottom-left corner key.

taskkill /IM kanata.exe /F >nul 2>&1
taskkill /IM kanata_wintercept.exe /F >nul 2>&1

set "KANATA_EXE=kanata.exe"
if exist "%SystemRoot%\System32\drivers\keyboard.sys" if exist "%~dp0kanata_wintercept.exe" set "KANATA_EXE=kanata_wintercept.exe"

powershell -NoProfile -WindowStyle Hidden -Command "Start-Process -FilePath '%~dp0%KANATA_EXE%' -ArgumentList '--cfg','%~dp0kanata.kbd' -WorkingDirectory '%~dp0' -WindowStyle Hidden"
