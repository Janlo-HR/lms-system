@echo off
setlocal enabledelayedexpansion

:: Learning Management System Startup Script
:: This script safely starts the LMS development server
:: Created for Windows systems

echo ========================================
echo    Learning Management System (LMS)
echo    Safe Startup Script v1.0
echo ========================================
echo.

:: Check if Node.js is installed
node --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Node.js is not installed or not in PATH
    echo Please install Node.js from https://nodejs.org/
    echo Press any key to exit...
    pause >nul
    exit /b 1
)

:: Display Node.js version
echo Node.js version:
node --version
echo.

:: Check if we're in the correct directory
if not exist "package.json" (
    echo ERROR: package.json not found
    echo Please make sure this script is in the LMS project directory
    echo Press any key to exit...
    pause >nul
    exit /b 1
)

:: Verify this is the correct project
findstr /c:"learning-management-system" package.json >nul
if errorlevel 1 (
    echo ERROR: This doesn't appear to be the LMS project
    echo Please run this script from the correct directory
    echo Press any key to exit...
    pause >nul
    exit /b 1
)

:: Check if node_modules exists
if not exist "node_modules" (
    echo Installing dependencies for the first time...
    echo This may take a few minutes...
    echo.
    npm install
    if errorlevel 1 (
        echo ERROR: Failed to install dependencies
        echo Press any key to exit...
        pause >nul
        exit /b 1
    )
    echo.
    echo Dependencies installed successfully!
    echo.
)

:: Kill any existing process on port 3000 (safely)
echo Checking for existing processes on port 3000...
for /f "tokens=5" %%a in ('netstat -aon ^| findstr :3000') do (
    tasklist /fi "pid eq %%a" | findstr node.exe >nul
    if not errorlevel 1 (
        echo Stopping existing Node.js process on port 3000...
        taskkill /pid %%a /f >nul 2>&1
    )
)

echo Starting LMS Development Server...
echo.
echo ========================================
echo  Server will start on: http://localhost:3000
echo  
echo  Admin Login:
echo  Email: janlo@ablig.co.za
echo  Password: admin@123
echo  
echo  Student Login:
echo  Email: student@bligblue.com
echo  Password: student123
echo ========================================
echo.
echo Press Ctrl+C to stop the server
echo.

:: Start the development server
npm run dev

:: If we get here, the server stopped
echo.
echo Server stopped.
echo Press any key to exit...
pause >nul
