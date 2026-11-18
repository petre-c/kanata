@echo off
rem Installs the Interception keyboard and mouse filter driver, which
rem kanata_wintercept.exe needs. Run once, then REBOOT: the driver only
rem loads at boot. After the reboot start-kanata.cmd picks the Interception
rem build of Kanata by itself.
rem
rem Needs administrator rights, so this file asks for them (UAC prompt).
rem
rem To remove the driver again: run this file with the word uninstall,
rem     install-interception-driver.cmd uninstall
rem and reboot. start-kanata.cmd then falls back to the hook build.
rem
rem Known limit of the driver: it stops passing input from a keyboard or mouse
rem slot after that kind of device has been plugged in about ten times since
rem boot (sleep and USB hubs count). A reboot clears it.
rem
rem install-interception.exe comes from github.com/oblitum/Interception,
rem release v1.0.1, "command line installer".

net session >nul 2>&1
if errorlevel 1 (
    rem Start-Process refuses an empty -ArgumentList, so the argument is only
    rem passed on when there is one (the word "uninstall").
    if "%~1"=="" (
        powershell -NoProfile -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    ) else (
        powershell -NoProfile -Command "Start-Process -FilePath '%~f0' -ArgumentList '%~1' -Verb RunAs"
    )
    exit /b
)

if /i "%1"=="uninstall" (
    "%~dp0install-interception.exe" /uninstall
) else (
    "%~dp0install-interception.exe" /install
)
echo.
echo Reboot now for the change to take effect.
pause
