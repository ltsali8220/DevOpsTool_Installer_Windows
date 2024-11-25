#!/bin/bash

echo "Starting Vagrant installation on Windows..."

# Ensure Chocolatey is installed
if ! choco -v > /dev/null 2>&1; then
    echo "Chocolatey not found. Installing Chocolatey..."
    powershell -NoProfile -ExecutionPolicy Bypass -Command \
    "Set-ExecutionPolicy Bypass -Scope Process; \
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; \
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"
fi

# Install Vagrant
echo "Installing Vagrant..."
choco install vagrant -y

# Install Docker provider plugin for Vagrant
echo "Installing Docker provider plugin..."
vagrant plugin install vagrant-docker-compose

echo "Vagrant installation and plugin setup completed."
