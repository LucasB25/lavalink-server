#!/bin/bash

# Download the latest Lavalink release
echo "Downloading Lavalink JAR..."
if ! curl -sSfL "https://github.com/lavalink-devs/Lavalink/releases/latest/download/Lavalink.jar" -o Lavalink.jar; then
  echo "Error: Failed to download Lavalink JAR. Exiting."
  exit 1
fi

echo "Lavalink JAR downloaded successfully."

# Start Lavalink
echo "Starting Lavalink..."
if ! java -jar Lavalink.jar; then
  echo "Error: Failed to start Lavalink. Exiting."
  exit 1
fi

echo "Lavalink started successfully."
