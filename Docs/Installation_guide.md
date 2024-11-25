
---

#### **b. Example Script: `install_docker.sh`**
Automate Docker installation on Windows:
```bash
#!/bin/bash

echo "Installing Docker Desktop for Windows..."

if ! [ -x "$(command -v choco)" ]; then
    echo "Chocolatey is required for this script. Installing Chocolatey..."
    set -e
    powershell -NoProfile -ExecutionPolicy Bypass -Command \
    "Set-ExecutionPolicy Bypass -Scope Process; \
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; \
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"
fi

echo "Using Chocolatey to install Docker Desktop..."
choco install docker-desktop -y

echo "Verifying Docker installation..."
docker --version
docker-compose --version

echo "Docker installation completed. Restart your system if required."