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

# Ask for the username
read -p "Enter the username for running Lavalink: " lavalink_user

# Check if the username provided exists
if ! id "$lavalink_user" &>/dev/null; then
    error_exit "User $lavalink_user does not exist."
fi

# Get the group name for the provided user
lavalink_group=$(id -gn "$lavalink_user")

# Create directory for Lavalink
log "Creating Lavalink directory..."
mkdir -p /home/"$lavalink_user"/lavalink || error_exit "Failed to create Lavalink directory."
cd /home/"$lavalink_user"/lavalink || error_exit "Failed to navigate to Lavalink directory."
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
if ! curl -sSfL "https://raw.githubusercontent.com/LucasB25/lavalink-server/main/application.yml" -o application.yml; then
    error_exit "Failed to download application.yml file."
fi
log "application.yml downloaded successfully."

log "Setup completed successfully."

# Write the systemd service file for Lavalink
cat <<EOF | sudo tee /etc/systemd/system/lavalink.service >/dev/null
[Unit]
# Describe the service
Description=Lavalink Service

# Configure service order
After=syslog.target network.target

[Service]
# The user which will run Lavalink
User=$lavalink_user

# The group which will run Lavalink
Group=$lavalink_group

# Where the program should start
WorkingDirectory=/home/$lavalink_user/lavalink

# The command to start Lavalink
ExecStart=java -Xmx4G -jar /home/$lavalink_user/lavalink/Lavalink.jar

# Restart the service if it crashes
Restart=on-failure

# Delay each restart by 5s
RestartSec=5s

[Install]
# Start this service as part of normal system start-up
WantedBy=multi-user.target
EOF

# Reload systemd to pick up the changes
sudo systemctl daemon-reload

# Enable the Lavalink service to start on boot
sudo systemctl enable lavalinks

# Start the Lavalink service
sudo systemctl start lavalinks

# Wait for services to load
log "Waiting for services to load..."
sleep 10

log "Lavalink service systemd unit file created successfully."
