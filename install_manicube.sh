#!/bin/bash

echo "Starting Minikube installation on Windows..."

# Install Minikube using Chocolatey
if ! choco -v > /dev/null 2>&1; then
    echo "Chocolatey not found. Installing Chocolatey..."
    powershell -NoProfile -ExecutionPolicy Bypass -Command \
    "Set-ExecutionPolicy Bypass -Scope Process; \
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; \
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"
fi

echo "Installing Minikube..."
choco install minikube -y

# Start Minikube
echo "Starting Minikube with Docker driver..."
minikube start --driver=docker --kubernetes-version=v1.26.1

# Verify installation
echo "Verifying Minikube version..."
minikube version

echo "Minikube installation and setup completed."
