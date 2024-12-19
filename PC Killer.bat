@echo off
title PC Killer
setlocal
echo Program Name: PC Killer
echo Version: 1.3.8
echo License: GNU General Public License v3.0
echo Developer: @YonatanReuvenIsraeli
echo GitHub: https://github.com/YonatanReuvenIsraeli
echo Sponsor: https://github.com/sponsors/YonatanReuvenIsraeli 
net session > nul 2>&1
if not "%errorlevel%"=="0" goto "NotAdministrator"
goto "Disclaimer"

:"NotAdministrator"
echo.
echo Please run this batch file as an administrator. Press any key to close this batch file.
pause > nul 2>&1
goto "Close"

:"Disclaimer"
echo.
echo READ DISCLAIMER ^-^-^> THIS IS FOR EDUCATIONAL PURPOSES ONLY! DO NOT USE THIS ON SOMEONE ELSES PC WITHOUT THEIR EXPLICIT PERMISSION! THIS WILL KILL THIS PC! CONTINUE AT YOUR OWN RISK! @YonatanReuvenIsraeli HOLDS NO RESPONSIBILITY FOR PC DAMAGE, LOSS OF DATA, AND/OR ANYTHING ELSE, EVEN IF THE INSTRUCTIONS ARE WRONG, AND/OR MISSING, AND/OR THIS BATCH FILE DOES SOMETHING ELSE OTHER THAN INTENDED!
echo.
set Disclaimer=
set /p Disclaimer="Do you agree to the Disclaimer? (Yes/No) "
if /i "%Disclaimer%"=="Yes" goto "Fix"
if /i "%Disclaimer%"=="No" goto "Close"
echo Invalid syntax!
goto "Disclaimer"

:"Fix"
echo.
set Fix=
set /p Fix="To fix the computer boot into WinRE, Navigate to %WINDIR%\System32 and rename hal1.dll hal.dll. You can then boot up the PC and navigate to %WINDIR%\System32\hal.dll delete %USERNAME% permissions and change owner to NT Service\TrustedInstaller or use "PC Reviver.bat" made by @YonatanReuvenIsraeli. Do you know how to do this? (Yes/No) "
if /i "%Fix%"=="Yes" goto "Warning"
if /i "%Fix%"=="No" goto "Close"
echo Invalid syntax!
goto "Fix"

:"Warning"
echo.
set Warning=
set /p Warning="READ WARNING --> THERE IS NO GOING BACK AFTER THIS! THIS IS YOUR LAST CHANCE TO STOP! THIS WILL KILL THIS COMPUTER! ARE YOU SURE YOU WANT TO CONTINUE? (Yes/No) "
if /i "%Warning%"=="Yes" goto "Kill"
if /i "%Warning%"=="No" goto "Close"
echo Invalid syntax!
goto "Warning"

:"Kill"
takeown /f "%windir%\System32\hal.dll" > nul
icacls "%windir%\System32\hal.dll" /grant "%USERNAME%":(f) > nul
ren "%windir%\System32\hal.dll" "hal1.dll"
if not "%errorlevel%"=="0" goto "Error"
endlocal
shutdown /r /t 00

:"Error"
echo There has been an error! You can try again.
goto "Disclaimer"

:"Close"
endlocal
exit
