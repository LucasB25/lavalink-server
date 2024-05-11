# Function to log messages
function Log {
    param($message)
    Write-Host "Setup: $message"
}

# Function to handle errors
function ErrorExit {
    param($message)
    Write-Host "Error: $message" -ForegroundColor Red
    exit 1
}

# Set the installation directory
$installDir = ".\\LavalinkServer"

# Create directory for Lavalink
Log "Creating Lavalink directory..."
if (-not (Test-Path -Path $installDir)) {
    New-Item -ItemType Directory -Path $installDir | Out-Null
    if (-not $?) {
        ErrorExit "Failed to create Lavalink directory."
    }
} else {
    Set-Location -Path $installDir
    if (-not $?) {
        ErrorExit "Failed to navigate to Lavalink directory."
    }
}
Log "Lavalink directory created successfully."

# Download the latest release of Lavalink
Log "Downloading Lavalink JAR..."
$downloadUrl = "https://github.com/lavalink-devs/Lavalink/releases/latest/download/Lavalink.jar"
$downloadPath = Join-Path -Path $installDir -ChildPath "Lavalink.jar"
Invoke-WebRequest -Uri $downloadUrl -OutFile $downloadPath -UseBasicParsing
if (-not $?) {
    ErrorExit "Failed to download Lavalink JAR."
}
Log "Lavalink JAR downloaded successfully."

# Download application.yml file
Log "Downloading application.yml..."
$applicationYmlUrl = "https://raw.githubusercontent.com/LucasB25/lavalink-server/main/application.yml"
$applicationYmlPath = Join-Path -Path $installDir -ChildPath "application.yml"
Invoke-WebRequest -Uri $applicationYmlUrl -OutFile $applicationYmlPath -UseBasicParsing
if (-not $?) {
    ErrorExit "Failed to download application.yml file."
}
Log "application.yml downloaded successfully."

Log "Setup completed successfully."