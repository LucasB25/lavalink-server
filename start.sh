#!/bin/bash

# Download the latest Lavalink release
echo "Downloading Lavalink JAR..."
if ! curl -sSfL "https://github.com/lavalink-devs/Lavalink/releases/latest/download/Lavalink.jar" -o Lavalink.jar; then
  echo "Failed to download Lavalink JAR. Exiting."
  exit 1
fi

echo "Lavalink JAR downloaded successfully."

# Start Lavalink
echo "Starting Lavalink..."
java -jar Lavalink.jar

if [[ $? -ne 0 ]]; then
  echo "Failed to start Lavalink."
  exit 1
fi

echo "Lavalink started successfully."