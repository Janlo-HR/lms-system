@echo off
title Blignaut BlueStar Learning Management System
color 0B
echo.
echo ========================================
echo  Blignaut BlueStar Learning System
echo ========================================
echo.

REM Check if Node.js is installed
node --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Node.js is not installed!
    echo Please install Node.js from https://nodejs.org
    echo.
    pause
    exit /b 1
)

REM Check if we're in the correct directory
if not exist "package.json" (
    echo ERROR: package.json not found!
    echo Please run this script from the LMS project directory.
    echo.
    pause
    exit /b 1
)

REM Validate this is the correct project
findstr /C:"lms-system" package.json >nul 2>&1
if errorlevel 1 (
    echo ERROR: This doesn't appear to be the LMS project!
    echo Please ensure you're in the correct directory.
    echo.
    pause
    exit /b 1
)

echo Checking for existing processes on port 3000...
for /f "tokens=5" %%a in ('netstat -aon ^| findstr :3000') do (
    tasklist /fi "pid eq %%a" | findstr node.exe >nul 2>&1
    if not errorlevel 1 (
        echo Stopping existing Node.js process on port 3000...
        taskkill /pid %%a /f >nul 2>&1
    )
)

echo.
echo Installing/updating dependencies...
call npm install

if errorlevel 1 (
    echo.
    echo ERROR: Failed to install dependencies!
    echo Please check your internet connection and try again.
    echo.
    pause
    exit /b 1
)

echo.
echo Starting LMS Development Server...
echo.
echo ========================================
echo  LOGIN CREDENTIALS:
echo ========================================
echo  Admin: janlo@ablig.co.za / admin@123
echo  Student: student@bligblue.com / student123
echo ========================================
echo.
echo Server will be available at: http://localhost:3000
echo.
echo Press Ctrl+C to stop the server
echo.

REM Start the development server
call npm run dev

pause
