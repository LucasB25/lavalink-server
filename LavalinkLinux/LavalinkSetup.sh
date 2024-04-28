#!/bin/bash

# Function to log messages
log() {
    echo "Setup: $1"
}

# Function to handle errors
error_exit() {
    echo "Error: $1" >&2
    exit 1
}

# Create directory for Lavalink
log "Creating Lavalink directory..."
mkdir -p LavalinkServer || error_exit "Failed to create Lavalink directory."
cd LavalinkServer || error_exit "Failed to navigate to Lavalink directory."
log "Lavalink directory created successfully."

# Download the latest release of Lavalink
log "Downloading Lavalink JAR..."
if ! curl -sSfL "https://github.com/lavalink-devs/Lavalink/releases/latest/download/Lavalink.jar" -o Lavalink.jar; then
    error_exit "Failed to download Lavalink JAR."
fi

# Check if the download was successful
if [ ! -f "Lavalink.jar" ]; then
    error_exit "Lavalink JAR not found."
fi
log "Lavalink JAR downloaded successfully."

# Download application.yml file
log "Downloading application.yml..."
if ! wget -O application.yml https://raw.githubusercontent.com/LucasB25/lavalink-server/main/application.yml; then
    error_exit "Failed to download application.yml file."
fi
log "application.yml downloaded successfully."

log "Setup completed successfully."
