# 📱 InstaMassUnliker

> A powerful, free & open-source Instagram bulk unlike tool to mass unlike instagram reels and posts for managing your digital footprint.

<div align="center">


[![Python Version](https://img.shields.io/badge/python-3.7%2B-blue.svg)](https://www.python.org/downloads/)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Open Source](https://img.shields.io/badge/Open%20Source-%E2%9D%A4-red)](https://github.com/TahaGorme/InstaMassUnliker)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://github.com/TahaGorme/InstaMassUnliker/graphs/commit-activity)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://makeapullrequest.com)

</div>

![image](https://github.com/user-attachments/assets/d5357ad1-20a3-45ef-bc5e-142c83147e6b)


## 📑 Table of Contents
- [Why Choose InstaMassUnliker](#-why-choose-instamassunliker)
- [Key Features](#-key-features)
- [Quick Start Guide](#-quick-start-guide)
- [System Requirements](#-system-requirements)
- [Configuration](#-configuration)
- [Documentation](#-documentation)
- [Contributing](#-contributing)
- [Support](#-support)
- [License](#-license)
- [Disclaimer](#%EF%B8%8F-disclaimer)



## 🌟 Why InstaMassUnliker?

A powerful and free open-source Instagram automation tool for managing your digital footprint. Perfect for:
- 🔒 Privacy-conscious social media users
- 👥 Social media managers
- 📱 Instagram power users
- 🛡️ Digital privacy enthusiasts

## 💫 Key Features

### 🚀 Performance
- **Smart Rate Limiting**: Completely undetected by Instagram
- **Bulk Processing**: Handle hundreds of thousands of posts efficiently
- **Resource Friendly**: Minimal system requirements
- **Cross-Platform**: Works on Windows, macOS, and Linux

### 🛡️ Security
- **Local Operation**: All processing happens on your machine
- **2FA Support**: Two-factor authentication support
- **Session Management**: Secure cookie handling
- **No Data Collection**: Your data stays with you

### 📊 Features
- **Progress Tracking**: Real-time progress monitoring
- **Error Handling**: Automatic retry on failures
- **Configurable Settings**: Customize to your needs
- **Activity Logging**: Track your operations

## 🚀 Quick Start Guide

### Prerequisites
1. **Export Your Instagram Data**
   - Go to Instagram Settings > Account Center > Your Information and Permissions > Download your Information
   - Request "Download Data" in JSON format
   - Wait for Instagram's email (can take up to 48 hours, usually takes 15 mins for me tho)
   - Download and extract the ZIP file
   - Locate `liked_posts.json` in the extracted files
   - Copy `liked_posts.json` to the InstaMassUnliker folder

### Windows Users
```bash
1. Download & Extract
📥 Download ZIP from the green "Code" button above
📂 Extract to your preferred location

2. Run Installer
▶️ Double-click run.bat
```

### macOS/Linux Installation
```bash
1. Download & Extract
📥 Download ZIP from the green "Code" button above
📂 Extract to preferred location

2. Run Installer
chmod +x run.sh
./run.sh
```

## 💻 System Requirements

### Automatic Setup
The installer handles all dependencies automatically:
- Python 3.7+ (auto-installed)
- Required Python packages (auto-installed)
- FFmpeg for media processing (auto-installed)
- Virtual environment setup (automatic)

### Supported Platforms
- Windows 10/11 (64-bit)
- macOS 10.15+ (Intel/Apple Silicon)
- Linux (Major distributions)


## 🌐 Configuration

### Basic Settings
![image](https://github.com/user-attachments/assets/f6e17cc9-9089-4908-b6cb-413e04e9ab66)
```json
{
    "delay": {
        "min": 0.1,
        "max": 0.2
    },
    "break": {
        "min": 900,
        "max": 3600,
        "probability": 0.001
    },
    "accounts": {
        "account_username": {
            "enabled": true,
            "delay_multiplier": 1.0
        }
    },
    "log_level": "INFO",
    "max_retries": 3,
    "retry_delay": 60,
    "python_min_version": "3.7.0"
}
```

## 📚 Documentation

### Quick Usage Guide
1. **Installation**
   - Windows: Run `run.bat`
   - macOS/Linux: Execute `run.sh`
2. **Setup**: Add Instagram Account, then provide your login credentials, and then start the unliking process
3. **Operation**: Follow the interactive dashboard
4. **Monitoring**: Track progress in real-time

### Safety Features
- Intelligent rate limiting
- Random action delays
- Smart cooldown periods
- Automatic error recovery
- Secure session management

## 🤝 Contributing

We welcome contributions! Here's how you can help:
- Report bugs
- Suggest features
- Submit pull requests
- Improve documentation

## 💁 Support

Need help? We're here for you!

- 🐛 Report issues on [GitHub](https://github.com/TahaGorme/InstaMassUnliker/issues)
- 📧 Contact: u/TahaGorme on reddit

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## ⚠️ Disclaimer

This tool is for educational purposes only. Use responsibly and in accordance with Instagram's terms of service.

---

<div align="center">

**[Issues](https://github.com/TahaGorme/InstaMassUnliker/issues)** • 
**[License](LICENSE)**

</div>

---

<div align="center">
Made with ❤️ by u/TahaGorme
</div>
