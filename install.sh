#!/bin/bash

ram_conf()
{
    $CLEAR
    echo "How much RAM do you want to use?"
    echo "[Type value with M - Megabye or G - Gigabyte at the end of number.]"
    echo "Example: 1024M or 1G"
    read RAM
    echo "RAM=$RAM" >> .MConfig/config.dt
    $CLEAR
}

first_config()
{
    mkdir ~/.screen
    chmod 700 ~/.screen
    export SCREENDIR=~/.screen
    echo "SCREEN=/usr/bin/screen" > .MConfig/config.dt
    echo "JAVA=/usr/bin/java" >> .MConfig/config.dt
    echo "SLEEP=/bin/sleep" >> .MConfig/config.dt
    echo "CLEAR=/usr/bin/clear" >> .MConfig/config.dt
    echo "SED=/bin/sed" >> .MConfig/config.dt
}

if [ ! -f .MConfig/end.dt ]; then
    first_config
    source .MConfig/config.dt
    echo "Welcome in first installation menu!"
    echo "------------------------------------"
    echo "I guide you in installation process."
    $SLEEP 3
    echo
    echo "Downloading spigot files"
    $SLEEP 3
    echo
    chmod +x .MConfig/update.sh
    chmod +x .MConfig/start.sh
    . ./.MConfig/update.sh
    echo "Starting server..."
    . ./.MConfig/start.sh
    . ./.MConfig/cr_prop.sh
    ram_conf
    echo "Ending installation and configuration process..."
    $SLEEP 5
    . ./.MConfig/start.sh
else
    export SCREENDIR=~/.screen
    . ./.MConfig/start.sh
fi