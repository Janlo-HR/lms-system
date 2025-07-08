@echo off
title Install LMS to Windows Startup
color 0A
echo.
echo ========================================
echo  Installing LMS to Windows Startup
echo ========================================
echo.

REM Get current directory
set "CURRENT_DIR=%CD%"

REM Check if main startup file exists
if not exist "start-lms-windows.bat" (
    echo ERROR: start-lms-windows.bat not found!
    echo Please run this from the LMS project directory.
    echo.
    pause
    exit /b 1
)

REM Get startup folder path
set "STARTUP_FOLDER=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

REM Create startup batch file
echo @echo off > "%STARTUP_FOLDER%\LMS-AutoStart.bat"
echo title LMS Auto Startup >> "%STARTUP_FOLDER%\LMS-AutoStart.bat"
echo cd /d "%CURRENT_DIR%" >> "%STARTUP_FOLDER%\LMS-AutoStart.bat"
echo call start-lms-windows.bat >> "%STARTUP_FOLDER%\LMS-AutoStart.bat"

if exist "%STARTUP_FOLDER%\LMS-AutoStart.bat" (
    echo.
    echo SUCCESS! LMS has been installed to Windows startup.
    echo.
    echo The LMS will now automatically start when Windows boots.
    echo Location: %STARTUP_FOLDER%\LMS-AutoStart.bat
    echo.
    echo To remove from startup, run: remove-from-startup.bat
    echo.
) else (
    echo.
    echo ERROR: Failed to create startup file!
    echo Please check permissions and try running as administrator.
    echo.
)

pause
