# Spigot/Bukkit Installer

This project will help you with install, configure and manage server on Spigot/Bukkit environment.

## Getting Started

Firstly, you have to install basic programs. We need to install: git, screen and java:

Debian/Ubuntu:
```
apt-get update && apt-get upgrade
apt-get install git screen default-jre -y
```

CentOS/Fedora:
```
yum update
yum upgrade
yum install git screen default-jre -y
```

SuSE:
```
zypper update
zypper upgrade
zypper install git screen default-jre -y
```

## Installing

After you install basic programs you have to download this project from my git:

```
git clone "https://github.com/KassVaru/ServerInstaller.git"
```

Now, you have to give permission to execute starting file:
```
cd ServerInstaller
chmod +x install.sh
```

And finally, you can run program:
```
./install.sh
```

## Versions

Update 1.1
* Added RAM config
* Added Show option to open server terminal
* Fixed language mistakes

Update 1.0
* Added start/stop/restart scripts
* Added configuration option
* Added manage menu with four function: start, stop, restart and reconfigure
* Added basic help menu in manager
* Fixed download and choosing version problems

Update 0.2
* Rebuild app structure
* Fixed problems with screen and java

Update 0.1
* Make README file
* Download and choose Spigot/Bukkit function
* Not work :c
