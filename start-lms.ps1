# Learning Management System PowerShell Startup Script
# This script safely starts the LMS development server
# Run with: powershell -ExecutionPolicy Bypass -File start-lms.ps1

param(
    [switch]$Force
)

# Set error action preference
$ErrorActionPreference = "Stop"

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "   Learning Management System (LMS)" -ForegroundColor Cyan
Write-Host "   Safe PowerShell Startup Script v1.0" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host

# Function to test if a command exists
function Test-Command($cmdname) {
    return [bool](Get-Command -Name $cmdname -ErrorAction SilentlyContinue)
}

# Function to kill process on port
function Stop-ProcessOnPort($port) {
    $processes = Get-NetTCPConnection -LocalPort $port -ErrorAction SilentlyContinue | Select-Object -ExpandProperty OwningProcess
    foreach ($processId in $processes) {
        $process = Get-Process -Id $processId -ErrorAction SilentlyContinue
        if ($process -and $process.ProcessName -eq "node") {
            Write-Host "Stopping existing Node.js process on port $port..." -ForegroundColor Yellow
            Stop-Process -Id $processId -Force -ErrorAction SilentlyContinue
        }
    }
}

try {
    # Check if Node.js is installed
    if (-not (Test-Command "node")) {
        Write-Host "ERROR: Node.js is not installed" -ForegroundColor Red
        Write-Host "Please install Node.js from https://nodejs.org/" -ForegroundColor Yellow
        Read-Host "Press Enter to exit"
        exit 1
    }

    # Display Node.js version
    Write-Host "Node.js version:" -ForegroundColor Green
    node --version
    Write-Host

    # Check if npm is installed
    if (-not (Test-Command "npm")) {
        Write-Host "ERROR: npm is not installed" -ForegroundColor Red
        Write-Host "Please install npm (usually comes with Node.js)" -ForegroundColor Yellow
        Read-Host "Press Enter to exit"
        exit 1
    }

    # Check if we're in the correct directory
    if (-not (Test-Path "package.json")) {
        Write-Host "ERROR: package.json not found" -ForegroundColor Red
        Write-Host "Please make sure this script is in the LMS project directory" -ForegroundColor Yellow
        Read-Host "Press Enter to exit"
        exit 1
    }

    # Verify this is the correct project
    $packageContent = Get-Content "package.json" -Raw
    if ($packageContent -notmatch "learning-management-system") {
        Write-Host "ERROR: This doesn't appear to be the LMS project" -ForegroundColor Red
        Write-Host "Please run this script from the correct directory" -ForegroundColor Yellow
        Read-Host "Press Enter to exit"
        exit 1
    }

    # Check if node_modules exists
    if (-not (Test-Path "node_modules")) {
        Write-Host "Installing dependencies for the first time..." -ForegroundColor Yellow
        Write-Host "This may take a few minutes..." -ForegroundColor Yellow
        Write-Host
        npm install
        if ($LASTEXITCODE -ne 0) {
            Write-Host "ERROR: Failed to install dependencies" -ForegroundColor Red
            Read-Host "Press Enter to exit"
            exit 1
        }
        Write-Host
        Write-Host "Dependencies installed successfully!" -ForegroundColor Green
        Write-Host
    }

    # Kill any existing process on port 3000
    Stop-ProcessOnPort 3000

    Write-Host "Starting LMS Development Server..." -ForegroundColor Green
    Write-Host
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host " Server will start on: http://localhost:3000" -ForegroundColor White
    Write-Host " " 
    Write-Host " Admin Login:" -ForegroundColor Yellow
    Write-Host " Email: janlo@ablig.co.za" -ForegroundColor White
    Write-Host " Password: admin@123" -ForegroundColor White
    Write-Host " " 
    Write-Host " Student Login:" -ForegroundColor Yellow
    Write-Host " Email: student@bligblue.com" -ForegroundColor White
    Write-Host " Password: student123" -ForegroundColor White
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host
    Write-Host "Press Ctrl+C to stop the server" -ForegroundColor Yellow
    Write-Host

    # Start the development server
    npm run dev

} catch {
    Write-Host "ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
} finally {
    Write-Host
    Write-Host "Server stopped." -ForegroundColor Yellow
    Read-Host "Press Enter to exit"
}
