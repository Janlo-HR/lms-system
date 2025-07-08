@echo off
title Remove LMS from Windows Startup
color 0C
echo.
echo ========================================
echo  Removing LMS from Windows Startup
echo ========================================
echo.

REM Get startup folder path
set "STARTUP_FOLDER=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
set "STARTUP_FILE=%STARTUP_FOLDER%\LMS-AutoStart.bat"

if exist "%STARTUP_FILE%" (
    del "%STARTUP_FILE%"
    echo SUCCESS! LMS has been removed from Windows startup.
    echo.
    echo The LMS will no longer start automatically with Windows.
    echo You can still run it manually using start-lms-windows.bat
    echo.
) else (
    echo LMS startup file not found.
    echo It may have already been removed or never installed.
    echo.
)

pause
