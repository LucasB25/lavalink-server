# Function to log messages
function Log {
    param($message)
    Write-Output "LucasB25-Setup :: $message"
}

# Function to handle errors
function ErrorExit {
    param(
        [string]$message,
        [string]$exception = $null
    )
    Write-Host "Error: $message" -ForegroundColor Red
    if ($exception) { Write-Host "Exception: $exception" -ForegroundColor Red }
    exit 1
}

# Set the installation directory
$installDir = ".\LavalinkServer"

# Create directory for Lavalink
Log "Creating Lavalink directory..."
if (-Not (Test-Path -Path $installDir)) { New-Item -ItemType Directory -Path $installDir -ErrorAction Stop }
Log "Lavalink directory ready."

# Download application.yml file
$downloadUrl = "https://github.com/lavalink-devs/Lavalink/releases/latest/download/Lavalink.jar"
$downloadPath = Join-Path -Path $installDir -ChildPath "Lavalink.jar"
Log "Downloading Lavalink JAR from $downloadUrl..."
Invoke-WebRequest -Uri $downloadUrl -OutFile $downloadPath -UseBasicParsing -ErrorAction Stop
Log "Lavalink JAR downloaded successfully."

# Download application.yml file
$applicationYmlUrl = "https://raw.githubusercontent.com/LucasB25/lavalink-server/main/application.yml"
$applicationYmlPath = Join-Path -Path $installDir -ChildPath "application.yml"
Log "Downloading application.yml from $applicationYmlUrl..."
Invoke-WebRequest -Uri $applicationYmlUrl -OutFile $applicationYmlPath -UseBasicParsing -ErrorAction Stop
Log "application.yml downloaded successfully."

Log "Setup completed successfully."