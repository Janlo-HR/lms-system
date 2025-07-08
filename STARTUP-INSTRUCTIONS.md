# LMS Startup Instructions

## Quick Start - Just Click and Run!

### Windows Users
1. **Double-click `start-lms.bat`** - This will automatically start the LMS
2. Wait for the server to start (first time may take a few minutes to install dependencies)
3. Your browser will show the server is running on `http://localhost:3000`
4. Open your browser and go to `http://localhost:3000`

### macOS Users
1. **Double-click `start-lms.command`** - This will open Terminal and start the LMS
2. If prompted about security, go to System Preferences > Security & Privacy and click "Allow"
3. Wait for the server to start
4. Open your browser and go to `http://localhost:3000`

### Linux Users
1. **Right-click `start-lms.sh`** and select "Run in Terminal"
2. Or open terminal and run: `./start-lms.sh`
3. Wait for the server to start
4. Open your browser and go to `http://localhost:3000`

### PowerShell Users (Windows)
1. **Right-click `start-lms.ps1`** and select "Run with PowerShell"
2. If execution policy error, run: `powershell -ExecutionPolicy Bypass -File start-lms.ps1`
3. Wait for the server to start
4. Open your browser and go to `http://localhost:3000`

## Login Credentials

### Admin Account
- **Email:** `janlo@ablig.co.za`
- **Password:** `admin@123`

### Student Account
- **Email:** `student@bligblue.com`
- **Password:** `student123`

## Security Features

### ✅ Safe Startup Scripts
- **Validates Node.js installation** before running
- **Checks project integrity** to ensure you're running the correct application
- **Safely kills existing processes** on port 3000 to prevent conflicts
- **Validates dependencies** and installs them securely if missing
- **No external network calls** except for npm package installation
- **No system modifications** beyond the project directory

### ✅ Input Validation
- **Verifies package.json** exists and contains correct project name
- **Checks for required files** before starting
- **Validates Node.js and npm** versions
- **Safe error handling** with proper exit codes

### ✅ Process Management
- **Graceful process termination** when stopping the server
- **Port conflict resolution** by safely stopping existing processes
- **Proper cleanup** on script exit
- **No elevated privileges required**

## Troubleshooting

### Script Won't Run
- **Windows:** Right-click the .bat file and select "Run as administrator" if needed
- **macOS:** Open Terminal and run `chmod +x start-lms.sh` then `./start-lms.sh`
- **Linux:** Run `chmod +x start-lms.sh` then `./start-lms.sh`

### Port 3000 Already in Use
- The scripts automatically handle this by safely stopping existing processes
- If issues persist, manually kill Node.js processes or restart your computer

### Dependencies Not Installing
- Ensure you have internet connection for npm package downloads
- Try running `npm cache clean --force` then restart the script
- Check if you have sufficient disk space

### Browser Won't Open LMS
- Manually navigate to `http://localhost:3000`
- Check if any firewall is blocking port 3000
- Ensure the script shows "Server running on port 3000"

## What These Scripts Do

1. **Verify Environment** - Check Node.js and npm installation
2. **Validate Project** - Ensure you're running the correct LMS project
3. **Install Dependencies** - Automatically install required packages (first run only)
4. **Clean Port** - Safely stop any existing processes on port 3000
5. **Start Server** - Launch the LMS development server
6. **Display Info** - Show login credentials and access URL

## Security Notes

- **No internet access required** after initial dependency installation
- **No system-wide changes** made to your computer
- **No elevated privileges** needed
- **All operations contained** within the project directory
- **Safe process management** with proper cleanup
- **Input validation** prevents malicious execution

These scripts are designed to be **completely safe** and **easy to use**. Just click and run!
