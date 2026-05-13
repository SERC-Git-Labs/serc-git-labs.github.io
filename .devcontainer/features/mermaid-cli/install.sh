#!/bin/bash -e
# Installs the latest version of the Mermaid CLI and Puppeteer dependencies in
# the devcontainer.

if [ -z "$_REMOTE_USER" ]; then
    _REMOTE_USER=$(whoami)
fi

if [ "$(find /var/lib/apt/lists/* | wc -l)" -eq 0 ]; then
    echo "Running apt update..."
    sudo apt-get update -yq
fi

# Install Puppeteer dependencies
# Ubuntu 24.04 (noble) has libasound2t64. Debian 12 (bookworm) has libasound2. Try to install the former first, and if it fails, install the latter.
sudo apt-get install -yq libasound2t64 2>/dev/null || apt-get install -yq libasound2
sudo apt-get install -yq \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcairo2 \
    libcups2 \
    libgbm1 \
    libpango-1.0-0 \
    libnss3 \
    libxcomposite1 \
    libxdamage1 \
    libxfixes3 \
    libxkbcommon0 \
    libxrandr2
    
# Install the latest version of the Mermaid CLI
su -l "$_REMOTE_USER" -c 'npm install -g --omit=dev @mermaid-js/mermaid-cli'


echo "Mermaid CLI installed successfully."
