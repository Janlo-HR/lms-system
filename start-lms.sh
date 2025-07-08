#!/bin/bash

# Learning Management System Startup Script
# This script safely starts the LMS development server
# Created for macOS and Linux systems

set -e  # Exit on any error

echo "========================================"
echo "   Learning Management System (LMS)"
echo "   Safe Startup Script v1.0"
echo "========================================"
echo

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to safely kill process on port
kill_port_process() {
    local port=$1
    local pid=$(lsof -ti:$port 2>/dev/null || true)
    if [ ! -z "$pid" ]; then
        echo "Stopping existing process on port $port..."
        kill -9 $pid 2>/dev/null || true
        sleep 1
    fi
}

# Check if Node.js is installed
if ! command_exists node; then
    echo "ERROR: Node.js is not installed"
    echo "Please install Node.js from https://nodejs.org/"
    echo "Press Enter to exit..."
    read
    exit 1
fi

# Display Node.js version
echo "Node.js version:"
node --version
echo

# Check if npm is installed
if ! command_exists npm; then
    echo "ERROR: npm is not installed"
    echo "Please install npm (usually comes with Node.js)"
    echo "Press Enter to exit..."
    read
    exit 1
fi

# Check if we're in the correct directory
if [ ! -f "package.json" ]; then
    echo "ERROR: package.json not found"
    echo "Please make sure this script is in the LMS project directory"
    echo "Press Enter to exit..."
    read
    exit 1
fi

# Verify this is the correct project
if ! grep -q "learning-management-system" package.json; then
    echo "ERROR: This doesn't appear to be the LMS project"
    echo "Please run this script from the correct directory"
    echo "Press Enter to exit..."
    read
    exit 1
fi

# Check if node_modules exists
if [ ! -d "node_modules" ]; then
    echo "Installing dependencies for the first time..."
    echo "This may take a few minutes..."
    echo
    npm install
    if [ $? -ne 0 ]; then
        echo "ERROR: Failed to install dependencies"
        echo "Press Enter to exit..."
        read
        exit 1
    fi
    echo
    echo "Dependencies installed successfully!"
    echo
fi

# Kill any existing process on port 3000
kill_port_process 3000

echo "Starting LMS Development Server..."
echo
echo "========================================"
echo " Server will start on: http://localhost:3000"
echo " "
echo " Admin Login:"
echo " Email: janlo@ablig.co.za"
echo " Password: admin@123"
echo " "
echo " Student Login:"
echo " Email: student@bligblue.com"
echo " Password: student123"
echo "========================================"
echo
echo "Press Ctrl+C to stop the server"
echo

# Start the development server
npm run dev

# If we get here, the server stopped
echo
echo "Server stopped."
echo "Press Enter to exit..."
read
