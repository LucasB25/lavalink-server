#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

LOG_PREFIX="LucasB25-Setup :: "

# Function to log messages
log() {
    echo "$LOG_PREFIX$1"
}

# Function to handle errors
error_exit() {
    echo "$LOG_PREFIXError: $1" >&2
    exit 1
}

# Prompt for the username
read -p "Enter the username (or 'root' user) for running Lavalink: " lavalink_user

# Verify if the provided username exists
if ! id "$lavalink_user" &>/dev/null; then
    error_exit "User $lavalink_user does not exist."
fi

# Define directory paths and URLs
lavalink_dir="/home/$lavalink_user/lavalink"
lavalink_jar_url="https://github.com/lavalink-devs/Lavalink/releases/latest/download/Lavalink.jar"
application_yml_url="https://raw.githubusercontent.com/LucasB25/lavalink-server/main/application.yml"
systemd_service_file="/etc/systemd/system/lavalink.service"

# Create directory for Lavalink
log "Creating Lavalink directory at $lavalink_dir..."
mkdir -p "$lavalink_dir"
log "Lavalink directory created successfully."

# Download the latest release of Lavalink
log "Downloading Lavalink JAR from $lavalink_jar_url..."
curl -sSfL "$lavalink_jar_url" -o "$lavalink_dir/Lavalink.jar"
log "Lavalink JAR downloaded successfully."

# Download application.yml configuration file
log "Downloading application.yml from $application_yml_url..."
curl -sSfL "$application_yml_url" -o "$lavalink_dir/application.yml"
log "application.yml downloaded successfully."

# Create the systemd service file for Lavalink
log "Creating systemd service file at $systemd_service_file..."
sudo tee "$systemd_service_file" > /dev/null <<EOF
[Unit]
Description=Lavalink Service
After=syslog.target network.target

[Service]
User=$lavalink_user
WorkingDirectory=$lavalink_dir
ExecStart=java -Xmx4G -jar $lavalink_dir/Lavalink.jar
Restart=on-failure
RestartSec=5s

[Install]
WantedBy=multi-user.target
EOF
log "Systemd service file created successfully."

# Reload systemd to apply changes
log "Reloading systemd daemon to apply changes..."
sudo systemctl daemon-reload

# Enable the Lavalink service to start on boot
log "Enabling Lavalink service to start on boot..."
sudo systemctl enable lavalink.service

# Start the Lavalink service
log "Starting Lavalink service..."
sudo systemctl start lavalink.service

# Wait for the service to initialize
log "Waiting for Lavalink service to initialize..."
sleep 10

log "Lavalink service started successfully and setup is complete."