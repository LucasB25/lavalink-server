<!-- PROJECT LOGO -->
<p align="center">
  <a href="https://github.com/LucasB25/lavalink-server">
    <img src="https://media.discordapp.net/attachments/902568151731015770/936134410737180703/059C7F8B-2A75-4AF7-9DCA-B4C13E826D22.png" alt="Pbot-plus" width="200" height="100">
  </a>
</p>

```

```markdown
## Where can I host Lavalink?

- [Windows](https://github.com/LucasB25/lavalink-server#windows)
- [Linux](https://github.com/LucasB25/lavalink-server#linux)

```

```markdown
## What is PM2?

PM2 is a production process manager for Node.js applications with a built-in load balancer. It allows you to keep applications **alive forever**, to reload them without downtime, and to facilitate common system admin tasks.

```

```markdown
### Windows 

- Download and install Java [here](https://adoptopenjdk.net/). 

**Note**: Java 17 LTS or newer is required. (We recommend running the latest LTS version or newer). If you are using **sdkman**, it's a manager, not Java. You have to install sdkman and use sdkman to install Java.

**Warning**: Java v17 has issues with Lavalink.

- Download or clone via Git:
```cmd
git clone https://github.com/LucasB25/lavalink-server.git
```

- go into the folder with `lavalink-server`

- edit `application.yml` Password and port 

- run for: double click on `start.sh`

**pm2**

- install node.js 
- install pm2 `npm i pm2`
- run `pm2 start java -- -jar Lavalink.jar`

```

```markdown
## Linux

- download curl
```cmd
sudo apt install -y curl
```

**Note**: _Java 17 LTS or newer required. (we recommend running the latest LTS version or newer)_ If you are using **sdkman** then _its a manager, not Java, you have to install sdkman and use sdkman to install Java_

**Warning**: Java v17 has issues with Lavalink.

- download or gitclone 
```cmd
git clone https://github.com/LucasB25/lavalink-server.git
```
- cd `lavalink-server`

- Run lavalink and install java
`chmod +x start.sh`

To run your script : `./start.sh`
Another option is as follows to execute shell script: `sh start.sh` OR `bash start.sh` Or `sudo bash start.sh`

**pm2**

- install node.js 
```cmd
sudo apt update
```
```cmd
sudo apt install nodejs

```

- install pm2 `npm i pm2`
- run `pm2 start java -- -jar Lavalink.jar`

