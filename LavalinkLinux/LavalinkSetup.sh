#!/bin/bash

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

# Ask for the username
read -p "Enter the username for running Lavalink: " lavalink_user

# Check if the username provided exists
if ! id "$lavalink_user" &>/dev/null; then
    error_exit "User $lavalink_user does not exist."
fi

# Set directory paths and URLs
lavalink_dir="/home/$lavalink_user/lavalink"
lavalink_jar_url="https://github.com/lavalink-devs/Lavalink/releases/latest/download/Lavalink.jar"
application_yml_url="https://raw.githubusercontent.com/LucasB25/lavalink-server/main/application.yml"

# Create directory for Lavalink
log "Creating Lavalink directory..."
mkdir -p "$lavalink_dir" || error_exit "Failed to create Lavalink directory."
log "Lavalink directory created successfully."

# Download the latest release of Lavalink
log "Downloading Lavalink JAR..."
if ! curl -sSfL "$lavalink_jar_url" -o "$lavalink_dir/Lavalink.jar"; then
    error_exit "Failed to download Lavalink JAR."
fi
log "Lavalink JAR downloaded successfully."

# Download application.yml file
log "Downloading application.yml..."
if ! curl -sSfL "$application_yml_url" -o "$lavalink_dir/application.yml"; then
    error_exit "Failed to download application.yml file."
fi
log "application.yml downloaded successfully."

# Write the systemd service file for Lavalink
cat <<EOF | sudo tee "/etc/systemd/system/lavalink.service" >/dev/null
[Unit]
Description=Lavalink Service
After=syslog.target network.target

[Service]
User=$lavalink_user
WorkingDirectory=$lavalink_dir
ExecStart=java -Xmx4G -jar "$lavalink_dir/Lavalink.jar"
Restart=on-failure
RestartSec=5s

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd to pick up the changes
sudo systemctl daemon-reload

# Enable the Lavalink service to start on boot
sudo systemctl enable lavalink.service

# Start the Lavalink service
sudo systemctl start lavalink.service

# Wait for services to load
log "Waiting for services to load..."
sleep 10

log "Lavalink service systemd unit file created successfully."
log "Setup completed successfully."