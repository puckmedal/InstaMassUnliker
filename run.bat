@echo off
:: Request admin privileges
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B
)

title Instagram Mass Unliker - Setup
setlocal EnableDelayedExpansion

:: Store the script directory path
set "SCRIPT_DIR=%~dp0"
cd /d "%SCRIPT_DIR%"

:: Header
echo =======================================
echo Instagram Mass Unliker - Setup Utility
echo =======================================
echo.


:: Check for chocolatey package manager
echo Checking for Chocolatey package manager...
where choco >nul 2>&1
if %errorlevel% neq 0 (
    echo [+] Installing Chocolatey...
    @powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"
    if !errorlevel! neq 0 (
        echo [!] Failed to install Chocolatey
        pause
        exit /b 1
    )
    :: Refresh environment variables
    call refreshenv
)
echo Chocolatey check passed

@REM :: Check Git installation
@REM echo [] Checking Git installation...
@REM where git >nul 2>&1
@REM if %errorlevel% neq 0 (
@REM     echo [+] Installing Git...
@REM     choco install git -y
@REM     if !errorlevel! neq 0 (
@REM         echo [!] Failed to install Git
@REM         pause
@REM         exit /b 1
@REM     )
@REM     :: Refresh environment variables
@REM     call refreshenv
@REM )
@REM echo [✓] Git check passed

:: Check FFmpeg installation
echo Checking FFmpeg installation...
where ffmpeg >nul 2>&1
if %errorlevel% neq 0 (
    echo [+] Installing FFmpeg...
    choco install ffmpeg -y
    if !errorlevel! neq 0 (
        echo [!] Failed to install FFmpeg
        pause
        exit /b 1
    )
    :: Refresh environment variables
    call refreshenv
)
echo FFmpeg check passed

:: Check Python installation
echo Checking Python installation...
where python >nul 2>&1
if %errorlevel% neq 0 (
    echo [+] Installing Python...
    choco install python --version=3.11 -y
    if !errorlevel! neq 0 (
        echo [!] Failed to install Python
        pause
        exit /b 1
    )
    :: Refresh environment variables
    call refreshenv
)

:: Verify Python version
python -c "import sys; exit(0 if sys.version_info >= (3,7) else 1)" >nul 2>&1
if %errorlevel% neq 0 (
    echo [!] Error: Python 3.7 or higher required
    echo [i] Please install a newer version of Python
    start https://www.python.org/downloads/
    pause
    exit /b 1
)
echo Python check passed

:: Set up virtual environment
echo Setting up virtual environment...
if not exist "venv" (
    python -m venv venv
    if !errorlevel! neq 0 (
        echo [!] Failed to create virtual environment
        pause
        exit /b 1
    )
)

:: Activate virtual environment
call venv\Scripts\activate.bat
if %errorlevel% neq 0 (
    echo [!] Failed to activate virtual environment
    pause
    exit /b 1
)

:: Check if dependencies are already installed
echo Checking Python dependencies...
python -c "import ensta, tqdm, colorama, requests, moviepy, psutil" >nul 2>&1
if %errorlevel% neq 0 (
    echo [+] Installing Python dependencies...
    python -m pip install --upgrade pip
    pip install ensta==5.2.9 tqdm==4.67.1 colorama==0.4.6 requests==2.32.3 moviepy==1.0.3 psutil
    if !errorlevel! neq 0 (
        echo [!] Failed to install Python dependencies
        pause
        exit /b 1
    )
    echo Dependencies installed successfully
) else (
    echo Dependencies already installed
)

:: Run the main script with full path
echo Starting Instagram Mass Unliker...
python "%SCRIPT_DIR%instagram_unliker.py"
if %errorlevel% neq 0 (
    echo [!] Program exited with errors
    pause
    exit /b 1
)

:: Deactivate virtual environment
call venv\Scripts\deactivate.bat

echo Program completed successfully
pause