[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![Support Server][support-shield]][support-server]
[![MIT License][license-shield]][license-url]
[![Run on Repl.it](https://repl.it/badge/github/LucasB25/AikouBot)](https://repl.it/github/LucasB25/AikouBot)

<!-- PROJECT LOGO -->
<h1 align="center">Lavalink Server</h1>

<p align="center">
    <a href="https://discord.gg/nvcznzhkTF">Support Server</a>
    ·
    <a href="https://github.com/LucasB25/lavalink-server/issues">Report Bug & Request Feature</a>
</p>

## 📦 Where can I host Lavalink?

<details>
<summary><strong>Windows</strong></summary>

1. **Setup the server:**
    ```powershell
    # Run Windows PowerShell as Administrator
    cd "C:\"
    bitsadmin /transfer myDownloadJob /download /priority normal https://raw.githubusercontent.com/LucasB25/lavalink-server/main/LavalinkWindows/ServerSetup.ps1 C:\ServerSetup.ps1
    & .\ServerSetup.ps1
    ```

2. ⚠️ **Restart Windows** ⚠️

3. **Run ServerSetup.ps1 again:**
    ```powershell
    # Run Windows PowerShell as Administrator
    cd "C:\"
    & .\ServerSetup.ps1
    ```

4. **Setup Lavalink:**
    ```powershell
    # Run Windows PowerShell as Administrator
    cd "C:\"
    bitsadmin /transfer myDownloadJob /download /priority normal https://raw.githubusercontent.com/LucasB25/lavalink-server/main/LavalinkWindows/LavalinkSetup.ps1 C:\LavalinkSetup.ps1
    & .\LavalinkSetup.ps1
    ```

5. **Configure `application.yml`:**
    ```yaml
    # Edit C:\LavalinkServer\application.yml
    # Email of your Google account
    email: "your.email@example.com"
    # Password of your Google account
    password: "your-password"

    # If you want to use other sources like Spotify, AppleMusic, Deezer, YandexMusic & FloweryTTS, enable and configure them!
    ```

6. **Start Lavalink 24/7:**
    ```powershell
    cd "C:\LavalinkServer"
    pm2 start --name Lavalink --max-memory-restart 4G java -- -jar Lavalink.jar
    ```
</details>

<details>
<summary><strong>Linux</strong></summary>

1. **Install required packages:**
    ```bash
    sudo apt-get install -y sudo wget
    ```

2. **Switch to root and navigate to home directory:**
    ```bash
    sudo su
    cd ~
    ```

3. **Setup the server:**
    ```bash
    wget -O LavalinkSetup.sh https://raw.githubusercontent.com/LucasB25/lavalink-server/main/SetupLinux/LavalinkSetup.sh
    chmod +rwx LavalinkSetup.sh
    ./LavalinkSetup.sh
    ```

4. **Configure `application.yml`:**
    ```bash
    sudo nano /opt/lavalink/application.yml
    # Email of your Google account
    email: "your.email@example.com"
    # Password of your Google account
    password: "your-password"
    ```
    ### Go (Source Configuration)

5. **Restart Lavalink:**
    ```bash
    sudo systemctl daemon-reload
    sudo systemctl restart lavalink
    ```

### Systemd Service Commands

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

</details>

<details>
<summary><strong>Replit</strong></summary>

[![Run on Replit](https://repl.it/badge/github/LucasB25/lavalink-server)](https://repl.it/github/LucasB25/lavalink-server)

### Connecting

- Lavalink's port will always be 443 on Replit.
- **Configure `application.yml`:**
    ```yaml
    server: # REST and WS server
      port: 443
      address: 0.0.0.0

    # Email of your Google account
    email: "your.email@example.com"
    # Password of your Google account
    password: "your-password"

    # If you want to use other sources like Spotify, AppleMusic, Deezer, YandexMusic & FloweryTTS, enable and configure them!
    ```

- Default password: `youshallnotpass`.

- **Example Configuration:**
    ```json
    {
      "host": "lavalink.LucasB25.repl.co",
      "password": "youshallnotpass",
      "port": 443,
      "identifier": "lavalink v4",     
      "secure": true
    }
    ```

### Important Notes

- To keep the server running 24/7, use a service like UptimeRobot to send HTTP requests to your app every 5 minutes. For example, if your app is named `lavalink-repl` and your Replit username is `ahmasa`, make an HTTP request to `https://lavalink-repl.ahmasa.repl.co`.
- Ensure your connection to the node is secure, e.g., use `https/wss`.
- Don’t forget to set your password in the `application.yml` file.

</details>

<details>
<summary><strong>Source Configuration</strong></summary>

- Spotify: 
    ### https://developer.spotify.com/dashboard/applications
    - clientId: "your client id"
    - clientSecret: "your client secret"

    ### https://github.com/topi314/LavaSrc#spotify
    - spDc: "your sp dc cookie"

- AppleMusic: 
    ### https://github.com/topi314/LavaSrc#apple-music
    - mediaAPIToken: "your apple music api token"

- Deezer: 
    - masterDecryptionKey: "your master decryption key"

    ### https://github.com/topi314/LavaSrc#deezer
    - arl: "your deezer arl"

- YandexMusic: 
    ### https://github.com/topi314/LavaSrc#yandex-music
    - accessToken: "your access token"

- VkMusic: 
    ### https://github.com/topi314/LavaSrc#vk-music
    - userToken: "your user token"

- Tidal: 
    ### https://github.com/topi314/LavaSrc#tidal
    - token: "your tidal token"

- Qobuz: 
    ### https://github.com/topi314/LavaSrc#qobuz
    - token: "your user oauth token"
</details>

## ☕ Donate

Do you like this project? Support it by donating!
[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/T6T0132KK5)

## 👥 Contributors

Thanks to these wonderful people:

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
[support-shield]: https://img.shields.io/discord/942117923001098260.svg?style=for-the-badge&logo=discord&colorB=7289DA
[support-server]: https://discord.gg/AhUJa2kdAr
