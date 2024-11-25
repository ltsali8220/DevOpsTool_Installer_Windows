#!/bin/bash

echo "Starting Docker installation on Windows..."

# Install Chocolatey if not already installed
if ! choco -v > /dev/null 2>&1; then
    echo "Chocolatey not found. Installing Chocolatey..."
    powershell -NoProfile -ExecutionPolicy Bypass -Command \
    "Set-ExecutionPolicy Bypass -Scope Process; \
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; \
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"
fi

# Install Docker Desktop
echo "Installing Docker Desktop..."
choco install docker-desktop -y

# Verify installation
echo "Verifying Docker installation..."
docker --version && docker-compose --version

echo "Docker installation completed. Restart your system if required."
