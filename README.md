[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![Support Server][support-shield]][support-server]
[![MIT License][license-shield]][license-url]
[![Run on Repl.it](https://repl.it/badge/github/LucasB25/AikouBot)](https://repl.it/github/LucasB25/AikouBot)
[![Remix on Glitch](https://cdn.glitch.com/2703baf2-b643-4da7-ab91-7ee2a2d00b5b%2Fremix-button.svg)](https://glitch.com/edit/#!/import/github/LucasB25/AikouBot)

<!-- PROJECT LOGO -->
  <h1 align="center">Lavalink Server</h1>

  <p align="center">
        <a href="https://discord.gg/AhUJa2kdAr">Serveur Support</a>
    ·
    <a href="https://github.com/LucasB25/lavalink-server/issues">Report Bug & Request Feature</a>
  </p>
</p>

## Where can I host Lavalink?

- [Windows](#windows)
- [Linux](#linux)
- [Replit](#replit)

## Windows

1. **Setup the server:**
```powershell
# Run Windows PowerShell as administrator
cd "C:\"
bitsadmin /transfer myDownloadJob /download /priority normal https://raw.githubusercontent.com/LucasB25/lavalink-server/main/LavalinkWindows/ServerSetup.ps1 C:\ServerSetup.ps1
& .\ServerSetup.ps1
```

2. ⚠️ **Restart Windows** ⚠️

3. **Run again ServerSetup.ps1:**
```powershell
# Run Windows PowerShell as administrator
cd "C:\"
& .\ServerSetup.ps1
```

4. **Setup Lavalink:**
```powershell
# Run Windows PowerShell as administrator
cd "C:\"
bitsadmin /transfer myDownloadJob /download /priority normal https://raw.githubusercontent.com/LucasB25/lavalink-server/main/LavalinkWindows/LavalinkSetup.ps1 C:\LavalinkSetup.ps1
& .\LavalinkSetup.ps1
```

5. **How to start it 24/7:**
```powershell
cd "C:\LavalinkServer"
pm2 start --name Lavalink --max-memory-restart 4G java -- -jar Lavalink.jar
```

## Linux

1. **Install sudo and wget:**
```bash
sudo apt-get install -y sudo wget 
```

2. **Switch to root user and navigate to the home directory:**
```bash
sudo su
cd ~
```

3. **Setup the server:**
```bash
wget -O ServerSetup.sh https://raw.githubusercontent.com/LucasB25/lavalink-server/main/LavalinkLinux/ServerSetup.sh
chmod +rwx ServerSetup.sh
./ServerSetup.sh
```

4. **Switch to root user and navigate to the home directory:**
```bash
sudo su
cd ~
```

5. **Setup Lavalink:**
```bash
wget -O LavalinkSetup.sh https://raw.githubusercontent.com/LucasB25/lavalink-server/main/LavalinkLinux/LavalinkSetup.sh
chmod +rwx LavalinkSetup.sh
./LavalinkSetup.sh
```

6. **Config application.yml:**
```bash
sudo nano /home/YOUR_USER_NAME/lavalink/application.yml
# EDITE
  - email: "your account mail" # Email of Google account
  - password: "your account password" # Password of Google account
  # If you want to use other sources (Spotify, AppleMusic, Deezer, YandexMusic & FloweryTTS), enable and configure them!
```

7. **Restart Lavalink:**
```bash
sudo systemctl daemon-reload
sudo systemctl restart lavalink
```

## Systemd Service Tuto Commands

- **Reload Systemd daemon:**
```bash
sudo systemctl daemon-reload
```

- **Enable a service at boot:**
```bash
sudo systemctl enable lavalink
```

- **Start a service:**
```bash
sudo systemctl start lavalink
```

- **View service logs:**
```bash
sudo journalctl -u lavalink
```

- **Check service status:**
```bash
sudo systemctl status lavalink
```

- **Stop a service:**
```bash
sudo systemctl stop lavalink
```

- **Restart a service:**
```bash
sudo systemctl restart lavalink
```

## Replit

[![Run on Replit](https://repl.it/badge/github/LucasB25/lavalink-server)](https://repl.it/github/LucasB25/lavalink-server)

**Connecting**

- Lavalink's port will always be 443 in Replit.
application.yml
# EDITE
```yml
server: # REST and WS server
  port: 443
  address: 0.0.0.0
  http2:
    enabled: false # Whether to enable HTTP/2 support
```
```yml
  - email: "your account mail" # Email of Google account
  - password: "your account password" # Password of Google account
  # If you want to use other sources (Spotify, AppleMusic, Deezer, YandexMusic & FloweryTTS), enable and configure them!
```
- Default password: `youshallnotpass`.
- Using custom Lavalink client.

**Important notes**

- To keep this 24/7, you need to make an account on UptimeRobot service and make HTTP request to your app every 5 minutes. For example, if your app is named `lavalink-repl` and your Replit username is `ahmasa`, then make an HTTP request to `https://lavalink-repl.ahmasa.repl.co`.
- Do not forget to set your password (in `application.yml` file).
- Connection to node must be secured, e.g., `https/wss`.

**Example Configuration**

```json
{
  "host": "lavalink.LucasB25.repl.co",
  "password": "youshallnotpass",
  "port": 443,
  "identifier": "lavalink v4",     
  "secure": true
}
```

## 👥 Contributors

Thanks goes to these wonderful people :

<a href="https://github.com/LucasB25/lavalink-server/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=LucasB25/lavalink-server" />
</a>

[contributors-shield]: https://img.shields.io/github/contributors/LucasB25/lavalink-server.svg?style=for-the-badge
[contributors-url]: https://github.com/LucasB25/lavalink-server/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/LucasB25/lavalink-server.svg?style=for-the-badge
[forks-url]: https://github.com/LucasB25/lavalink-server/network/members
[stars-shield]: https://img.shields.io/github/stars/LucasB25/lavalink-server.svg?style=for-the-badge
[stars-url]: https://github.com/LucasB25/lavalink-server/stargazers
[issues-shield]: https://img.shields.io/github/issues/LucasB25/lavalink-server.svg?style=for-the-badge
[issues-url]: https://github.com/LucasB25/lavalink-server/issues
[license-shield]: https://img.shields.io/github/license/LucasB25/lavalink-server.svg?style=for-the-badge
[license-url]: https://github.com/LucasB25/lavalink-server/blob/mains/LICENSE
[support-server]: https://discord.gg/AhUJa2kdAr
[support-shield]: https://img.shields.io/discord/942117923001098260.svg?style=for-the-badge&logo=discord&colorB=7289DA
