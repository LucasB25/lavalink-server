# Function to log messages
function Write-Log {
    param (
        [string]$Message,
        [string]$Level = "INFO"
    )
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Write-Host "[$timestamp] [$Level] LucasB25-Setup :: $Message"
}

# Function to handle errors and exit
function ErrorExit {
    param($message)
    Write-Log -Message "Error: $message" -Level "ERROR"
    exit 1
}

# Function to install a package using Chocolatey
function InstallPackage {
    param($packageName)
    Write-Log -Message "Installing $packageName"
    choco install $packageName -y
    if ($LASTEXITCODE -ne 0) { ErrorExit "Failed to install $packageName" }
}

# Function to ensure Chocolatey is installed
function UpgradeAllPackages {
    Write-Log -Message "Upgrading all installed packages"
    choco upgrade all -y
    if ($LASTEXITCODE -ne 0) { ErrorExit "Failed to upgrade all packages" }
}

# Function to ensure Chocolatey is installed
function EnsureChocolatey {
    if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
        Write-Log -Message "Installing Chocolatey"
        Set-ExecutionPolicy Bypass -Scope Process -Force
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
        iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
        if ($LASTEXITCODE -ne 0) { ErrorExit "Failed to install Chocolatey" }
    } else {
        Write-Log -Message "Chocolatey is already installed"
    }
}

# Function to install Node.js
function InstallNodeJS {
    Write-Log -Message "Installing Node.js"
    InstallPackage "nodejs"
}

# Function to install Java
function InstallJava {
    Write-Log -Message "Installing Java version 18 (OpenJDK)"
    InstallPackage "openjdk"
}

# Function to install pm2 and related packages
function InstallPM2 {
    Write-Log -Message "Installing pm2, npm-check-updates, yarn, npm@latest via npm"
    npm cache clean --force
    npm install -g pm2 npm-check-updates yarn npm@latest
    if ($LASTEXITCODE -ne 0) { ErrorExit "Failed to install pm2 and related packages" }
}

# Function to install pm2-logrotate and configure it
function InstallPM2Logrotate {
    Write-Log -Message "Installing pm2-logrotate"
    pm2 install pm2-logrotate
    if ($LASTEXITCODE -ne 0) { ErrorExit "Failed to install pm2-logrotate" }
    pm2 set pm2-logrotate:max_size 50M
    pm2 set pm2-logrotate:compress true
    pm2 set pm2-logrotate:rotateInterval '0 12 * * *'
}

# Main script starts here
Write-Log -Message "Starting the setup"

EnsureChocolatey
UpgradeAllPackages
InstallNodeJS
InstallJava
InstallPM2
InstallPM2Logrotate

Write-Log -Message "Java Version:"
java -version
Write-Log -Message "Node.js Version:"
node -v
Write-Log -Message "NPM Version:"
npm -version

Write-Log -Message "Everything is set up. A reboot is recommended."