# Function to log messages
function Log {
    param($message)
    Write-Host "LucasB25-Setup :: $message"
}

# Function to handle errors
function ErrorExit {
    param($message)
    Write-Host "Error: $message" -ForegroundColor Red
    exit 1
}

# Set the installation directory
$installDir = ".\LavalinkServer"

# Create directory for Lavalink
Log "Creating Lavalink directory..."
try {
    $null = New-Item -ItemType Directory -Path $installDir -ErrorAction Stop
    Set-Location -Path $installDir -ErrorAction Stop
} catch {
    ErrorExit "Failed to create or navigate to Lavalink directory."
}
Log "Lavalink directory created successfully."

# Download the latest release of Lavalink
$downloadUrl = "https://github.com/lavalink-devs/Lavalink/releases/latest/download/Lavalink.jar"
$downloadPath = Join-Path -Path $installDir -ChildPath "Lavalink.jar"
Log "Downloading Lavalink JAR from $downloadUrl..."
try {
    Invoke-WebRequest -Uri $downloadUrl -OutFile $downloadPath -UseBasicParsing -ErrorAction Stop
} catch {
    ErrorExit "Failed to download Lavalink JAR."
}
Log "Lavalink JAR downloaded successfully."

# Download application.yml file
$applicationYmlUrl = "https://raw.githubusercontent.com/LucasB25/lavalink-server/main/application.yml"
$applicationYmlPath = Join-Path -Path $installDir -ChildPath "application.yml"
Log "Downloading application.yml from $applicationYmlUrl..."
try {
    Invoke-WebRequest -Uri $applicationYmlUrl -OutFile $applicationYmlPath -UseBasicParsing -ErrorAction Stop
} catch {
    ErrorExit "Failed to download application.yml file."
}
Log "application.yml downloaded successfully."

Log "Setup completed successfully."
