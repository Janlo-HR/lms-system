#!/bin/bash

# Learning Management System Startup Script for macOS
# Double-click this file to start the LMS
# This makes the .command file executable and runs the main script

# Make this script executable
chmod +x "$0"

# Get the directory where this script is located
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Change to the project directory
cd "$DIR"

# Make the main startup script executable
chmod +x start-lms.sh

# Run the main startup script
./start-lms.sh
