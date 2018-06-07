#!/bin/bash
source .MConfig/config.dt

$CLEAR
echo "Now you can configure your SERVER.PROPERTIES"
echo "What is your IP address? (If you have dedicated server like VPS, press enter)"
read IP
echo
echo "How many player can play on your server?"
read PLAYER
echo
echo "Do you want to enable PVP? [true/false]"
read PVP
echo
echo "Enable login only for premium account? [true/false]"
read PA
echo
echo "Do you want to enable flying on your server? [true/false]"
read FLY
echo
echo "Enable to spawn NPCs? [true/false]"
read NPC
echo
echo "Enable white-list? [true/false]"
read WL
echo
echo "Enable to spawn animals? [true/false]"
read ANI
echo
echo "Enable to spawn monster? [true/false]"
read MON
echo
echo "Enable command block? [true/false]"
read CB
echo
echo "Type your own world seed (if default press enter)"
read SEED
echo
echo "Type server info(motd)"
read MOTD

echo "generator-settings=" > Server/server.properties
echo "use-native-transport=true" >> Server/server.properties
echo "op-permission-level=4" >> Server/server.properties
echo "allow-nether=true" >> Server/server.properties
echo "level-name=world" >> Server/server.properties
echo "enable-query=false" >> Server/server.properties
echo "allow-flight=$FLY" >> Server/server.properties
echo "prevent-proxy-connections=false" >> Server/server.properties
echo "server-port=25565" >> Server/server.properties
echo "max-world-size=29999984" >> Server/server.properties
echo "level-type=DEFAULT" >> Server/server.properties
echo "enable-rcon=false" >> Server/server.properties
echo "level-seed=$SEED" >> Server/server.properties
echo "force-gamemode=false" >> Server/server.properties
echo "server-ip=$IP" >> Server/server.properties
echo "network-compression-threshold=256" >> Server/server.properties
echo "max-build-height=256" >> Server/server.properties
echo "spawn-npcs=$NPC" >> Server/server.properties
echo "white-list=$WL" >> Server/server.properties
echo "spawn-animals=$ANI" >> Server/server.properties
echo "hardcore=false" >> Server/server.properties
echo "snooper-enabled=true" >> Server/server.properties
echo "resource-pack-sha1=" >> Server/server.properties
echo "online-mode=$PA" >> Server/server.properties
echo "resource-pack=" >> Server/server.properties
echo "pvp=$PVP" >> Server/server.properties
echo "difficulty=1" >> Server/server.properties
echo "enable-command-block=$CB" >> Server/server.properties
echo "gamemode=0" >> Server/server.properties
echo "player-idle-timeout=0" >> Server/server.properties
echo "max-players=$PLAYER" >> Server/server.properties
echo "spawn-monsters=$MON" >> Server/server.properties
echo "generate-structures=true" >> Server/server.properties
echo "view-distance=10" >> Server/server.properties
echo "motd=$MOTD" >> Server/server.properties

$CLEAR
echo "Thanks for configure properties!"
echo "Now I will run server to confirm the changes. Wait until it end..."
$SCREEN -dmS MC $JAVA -jar $PATH
$SLEEP 30
$SCREEN -p 0 -S MC -X eval 'stuff "stop"\015'
echo
echo "If you want to reconfigure server please type: config"
echo "THE END" > .MConfig/end.dt
echo
