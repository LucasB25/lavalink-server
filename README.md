## Where can I get support?

For any questions or issues, feel free to join our [Discord server](https://discord.gg/5shqv9Kygv) for assistance.

```

```
## Where can I host Lavalink?

- [Windows](https://github.com/LucasB25/lavalink-server?tab=readme-ov-file#windows)
- [Linux](https://github.com/LucasB25/lavalink-server?tab=readme-ov-file#linux)
- [Replit](https://github.com/LucasB25/lavalink-server?tab=readme-ov-file#replit)

```

```
## Windows 

1. Setup the server:
```cmd
- Run Windows PowerShell as administrator
cd "C:\"
bitsadmin /transfer myDownloadJob /download /priority normal https://raw.githubusercontent.com/LucasB25/lavalink-server/main/LavalinkWindows/ServerSetup.ps1 C:\ServerSetup.ps1
& .\ServerSetup.ps1
```

2. ⚠️ Restart windows ⚠️

3. Run again ServerSetup.ps1
```cmd
- Run Windows PowerShell as administrator
cd "C:\"
& .\ServerSetup.ps1
```

4. Setup Lavalink:
```cmd
- Run Windows PowerShell as administrator
cd "C:\"
bitsadmin /transfer myDownloadJob /download /priority normal https://raw.githubusercontent.com/LucasB25/lavalink-server/main/LavalinkWindows/LavalinkSetup.ps1 C:\LavalinkSetup.ps1
& .\LavalinkSetup.ps1
```

5. How to start it 24/7:
```cmd
cd "C:\LavalinkServer"
pm2 start --name Lavalink --max-memory-restart 4G java -- -jar Lavalink.jar
```

## Linux

1. Install sudo and wget:
```bash
sudo apt-get install -y sudo wget 
```

2. Switch to root user and navigate to the home directory:
```bash
sudo su
cd ~
```

3. Setup the server:
```bash
wget -O ServerSetup.sh https://raw.githubusercontent.com/LucasB25/lavalink-server/main/LavalinkLinux/ServerSetup.sh
chmod +rwx ServerSetup.sh
./ServerSetup.sh
```

3. Switch to root user and navigate to the home directory:
```bash
sudo su
cd ~
```

4. Setup Lavalink:
```bash
wget -O LavalinkSetup.sh https://raw.githubusercontent.com/LucasB25/lavalink-server/main/LavalinkLinux/LavalinkSetup.sh
chmod +rwx LavalinkSetup.sh
./LavalinkSetup.sh
```

# Systemd Service Tuto Commands

- Reload Systemd daemon:
```bash
$ sudo systemctl daemon-reload
```
- Enable a service at boot:
```bash
$ sudo systemctl enable lavalink
```
- Start a service:
```bash
$ sudo systemctl start lavalink
```
- View service logs:
```bash
$ sudo journalctl -u lavalink
```
- Check service status:
```bash
$ sudo systemctl status lavalink
```
- Stop a service:
```bash
$ sudo systemctl stop lavalink
```
- Restart a service:
```bash
$ sudo systemctl restart lavalink
```

## Replit

[![Run on Replit](https://repl.it/badge/github/LucasB25/lavalink-server)](https://repl.it/github/LucasB25/lavalink-server)

**Connecting**

- Lavalink's port will always be 443 in Replit.
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
