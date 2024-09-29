#!/bin/bash

# ==================================================
# LucasB25-Setup :: Lavalink Server Auto Setup
# ==================================================

# Make sure the script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root."
  exit 1
fi

# Define URLs for Lavalink JAR and application.yml
LAVALINK_JAR_URL="https://github.com/lavalink-devs/Lavalink/releases/latest/download/Lavalink.jar"
APPLICATION_YML_URL="https://raw.githubusercontent.com/LucasB25/lavalink-server/DEV/application.yml"

# Create Lavalink directory
LAVALINK_DIR="/opt/lavalink"
mkdir -p $LAVALINK_DIR

# Download Lavalink.jar
echo "Downloading Lavalink.jar..."
curl -L $LAVALINK_JAR_URL -o $LAVALINK_DIR/Lavalink.jar
if [ $? -ne 0 ]; then
  echo "Error downloading Lavalink.jar."
  exit 1
fi

# Download application.yml
echo "Downloading application.yml..."
curl -L $APPLICATION_YML_URL -o $LAVALINK_DIR/application.yml
if [ $? -ne 0 ]; then
  echo "Error downloading application.yml."
  exit 1
fi

# Set permissions for Lavalink directory
echo "Setting file permissions..."
chown -R root:root $LAVALINK_DIR
chmod +x $LAVALINK_DIR/Lavalink.jar

# Create a systemd service file for Lavalink
echo "Creating Lavalink service..."

cat <<EOF > /etc/systemd/system/lavalink.service
[Unit]
Description=Lavalink Server
After=network.target

[Service]
User=root
WorkingDirectory=$LAVALINK_DIR
ExecStart=/usr/bin/java -jar Lavalink.jar
SuccessExitStatus=143
TimeoutStopSec=20
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd daemon and enable Lavalink service
echo "Reloading systemd daemon..."
systemctl daemon-reload

echo "Enabling Lavalink service..."
systemctl enable lavalink

# Start Lavalink service
echo "Starting Lavalink service..."
systemctl start lavalink

echo "Lavalink setup completed!"
echo "LucasB25-Setup :: Lavalink is now running."
