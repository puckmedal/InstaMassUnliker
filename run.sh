#!/usr/bin/env bash

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'

# Detect OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macOS"
elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
    OS="Windows"
else
    OS="Linux"
fi

# Function to check for root/sudo
check_root() {
    if [ "$OS" != "Windows" ] && [ "$EUID" -ne 0 ]; then
        echo -e "${RED}[!] Error: This script requires root privileges${NC}"
        echo -e "${YELLOW}[i] Please run with sudo${NC}"
        exit 1
    fi
}

# Function to install package manager
install_package_manager() {
    if [ "$OS" = "macOS" ]; then
        if ! command -v brew &> /dev/null; then
            echo -e "${YELLOW}[+] Installing Homebrew...${NC}"
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
                echo -e "${RED}[!] Failed to install Homebrew${NC}"
                exit 1
            }
        fi
    elif [ "$OS" = "Linux" ]; then
        if ! command -v apt-get &> /dev/null && ! command -v dnf &> /dev/null; then
            echo -e "${RED}[!] No supported package manager found${NC}"
            exit 1
        fi
    fi
}

# Function to install a package
install_package() {
    local package=$1
    echo -e "${BLUE}[*] Checking $package installation...${NC}"
    
    if ! command -v $package &> /dev/null; then
        echo -e "${YELLOW}[+] Installing $package...${NC}"
        if [ "$OS" = "macOS" ]; then
            brew install $package || return 1
        elif [ "$OS" = "Linux" ]; then
            if command -v apt-get &> /dev/null; then
                apt-get update && apt-get install -y $package || return 1
            elif command -v dnf &> /dev/null; then
                dnf install -y $package || return 1
            fi
        fi
    fi
    echo -e "${GREEN}[✓] $package check passed${NC}"
    return 0
}

# Header
echo -e "${BLUE}[*]=======================================${NC}"
echo -e "${YELLOW}[+] Instagram Mass Unliker - Setup Utility${NC}"
echo -e "${BLUE}[*]=======================================${NC}"
echo

# Check root privileges
check_root

# Install package manager
install_package_manager

# Install required packages
for package in git python3 python3-pip ffmpeg; do
    install_package $package || {
        echo -e "${RED}[!] Failed to install $package${NC}"
        exit 1
    }
done

# Check Python version
echo -e "${BLUE}[*] Checking Python version...${NC}"
python3 -c "import sys; sys.exit(0 if sys.version_info >= (3,7) else 1)" || {
    echo -e "${RED}[!] Error: Python 3.7 or higher required${NC}"
    exit 1
}
echo -e "${GREEN}[✓] Python version check passed${NC}"

# Set up virtual environment
echo -e "${BLUE}[*] Setting up virtual environment...${NC}"
if [ ! -d "venv" ]; then
    python3 -m venv venv || {
        echo -e "${RED}[!] Failed to create virtual environment${NC}"
        exit 1
    }
fi

# Activate virtual environment
if [ "$OS" = "Windows" ]; then
    source venv/Scripts/activate
else
    source venv/bin/activate
fi

if [ $? -ne 0 ]; then
    echo -e "${RED}[!] Failed to activate virtual environment${NC}"
    exit 1
fi

# Install Python dependencies
echo -e "${BLUE}[*] Installing Python dependencies...${NC}"
python -m pip install --upgrade pip
pip install ensta==5.2.9 tqdm==4.67.1 colorama==0.4.6 requests==2.32.3 || {
    echo -e "${RED}[!] Failed to install Python dependencies${NC}"
    exit 1
}

echo -e "${GREEN}[✓] Virtual environment setup complete${NC}"

# Run the main script
echo -e "${BLUE}[*] Starting Instagram Mass Unliker...${NC}"
python instagram_unliker.py
if [ $? -ne 0 ]; then
    echo -e "${RED}[!] Program exited with errors${NC}"
    exit 1
fi

# Deactivate virtual environment
deactivate

echo -e "${GREEN}[✓] Program completed successfully${NC}"