function Log {
    param($message)
    Write-Host "LucasB25-Setup :: $message"
}

function ErrorExit {
    param($message)
    Write-Host "Error: $message" -ForegroundColor Red
    exit 1
}

function InstallPackage {
    param($packageName)
    Log "Installing $packageName"
    choco install $packageName -y
    if ($LASTEXITCODE -ne 0) {
        ErrorExit "Failed to install $packageName"
    }
}

function EnsureChocolatey {
    if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
        Log "Installing Chocolatey"
        Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
        if ($LASTEXITCODE -ne 0) {
            ErrorExit "Failed to install Chocolatey"
        }
    } else {
        Log "Chocolatey is already installed"
    }
}

function InstallNodeJS {
    Log "Installing Node.js"
    InstallPackage "nodejs"
}

function InstallJava {
    Log "Installing Java version 18 (OpenJDK)"
    InstallPackage "openjdk --version 18.0.0.0 --force"
}

function InstallPM2 {
    Log "Installing pm2, npm-check-updates, yarn, npm@latest via npm"
    npm cache clean --force
    npm install -g pm2 npm-check-updates yarn npm@latest
    if ($LASTEXITCODE -ne 0) {
        ErrorExit "Failed to install pm2 and related packages"
    }
}

function InstallPM2Logrotate {
    Log "Installing pm2-logrotate"
    pm2 install pm2-logrotate
    if ($LASTEXITCODE -ne 0) {
        ErrorExit "Failed to install pm2-logrotate"
    }
    pm2 set pm2-logrotate:max_size 50M
    pm2 set pm2-logrotate:compress true
    pm2 set pm2-logrotate:rotateInterval '0 12 * * *'
}

# Main script starts here
Log "Starting the setup"

EnsureChocolatey
InstallPackage "upgrade all"
InstallNodeJS
InstallJava
InstallPM2
InstallPM2Logrotate

Log "Java Version:"
java -version
Log "Nodejs Version:"
node -v
Log "NPM Version:"
npm -version

Log "Everything is set up. A reboot is recommended."
