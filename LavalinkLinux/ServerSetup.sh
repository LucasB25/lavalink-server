#!/bin/bash

log() {
    echo "LucasB25-Setup :: $1"
}

error_exit() {
    echo "Error: $1" >&2
    exit 1
}

install_package() {
    package_name=$1
    log "Installing $package_name"
    sudo apt-get install -y "$package_name" || error_exit "Failed to install $package_name"
}

update_upgrade_system() {
    log "Updating and upgrading the system"
    sudo apt-get update -y && sudo apt-get upgrade -y || error_exit "Failed to update and upgrade the system"
}

ensure_sudo() {
    log "Ensuring sudo is installed"
    sudo apt-get install -y sudo || error_exit "Failed to install sudo"
}

ensure_curl() {
    log "Ensuring curl is installed"
    install_package "curl"
}

remove_apache() {
    log "Removing default installed Apache package"
    sudo apt-get purge -y --auto-remove apache* || error_exit "Failed to remove Apache package"
}

install_nodejs() {
    log "Installing Node.js"
    curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
    install_package "nodejs"
}

install_java() {
    log "Installing Java version 18 (OpenJDK)"
    sudo mkdir -p /usr/lib/jvm
    wget -O /tmp/openjdk.tar.gz https://download.java.net/openjdk/jdk18/ri/openjdk-18+36_linux-x64_bin.tar.gz || error_exit "Failed to download Java"
    sudo tar zxvf /tmp/openjdk.tar.gz -C /usr/lib/jvm || error_exit "Failed to extract Java"
    sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk-18/bin/java" 1
    sudo update-alternatives --set java /usr/lib/jvm/jdk-18/bin/java
    java -version || error_exit "Java installation failed"
    rm /tmp/openjdk.tar.gz
}

update_npm_packages() {
    log "Updating npm packages globally"
    sudo npm i -g npm-check-updates yarn npm@latest || error_exit "Failed to update npm packages"
}

# Main script starts here
log "Starting the setup"

update_upgrade_system
ensure_sudo
ensure_curl
remove_apache
install_nodejs
install_java
update_npm_packages

# Displaying the versions of Java, Node.js, and NPM
log "Java Version:"
java -version
log "Nodejs Version:"
node -v
log "NPM Version:"
npm --version

log "Everything is set up. A reboot is recommended."
