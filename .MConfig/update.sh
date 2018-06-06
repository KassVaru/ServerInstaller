#!/bin/bash

select_ver()
{
echo
echo "What do you want to install?"
echo "[Spigot/Bukkit]"
read INS

if [ "$INS" == "Spigot" ] || [ "$INS" == "spigot" ] || [ "$INS" == "S" ] || [ "$INS" == "s" ] || [ "$INS" == "sPIGOT" ]; then
    $CLEAR
    echo "Chose: Spigot"
    echo "Preparing Spigot files..."
    mv Server/spigot-*.jar ./spigot.jar
    rm -Rf Server/*
    mv spigot.jar Server/
    echo
    echo "Preparing complated!"
    echo "PATH=spigot.jar" >> .MConfig/config.dt
else
    if [ "$INS" == "Bukkit" ] || [ "$INS" == "bukkit" ] || [ "$INS" == "B" ] || [ "$INS" == "b" ] || [ "$INS" == "bUKKIT" ]; then
        $CLEAR
        echo "Chose: Spigot"
        echo "Preparing Spigot files..."
        mv Server/craftbukkit-*.jar ./bukkit.jar
        rm -Rf Server/*
        mv bukkit.jar Server/
        echo
        echo "Preparing complated!"
        echo "PATH=bukkit.jar" >> .MConfig/config.dt
    else
        select_ver
    fi
fi
}


wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
chmod 755 BuildTools.jar
mkdir Server/
rm -Rf Server/*
mv ./BuildTools.jar ./Server/BuildTools.jar

echo
echo "Which version do you want to use?"
echo "[latest, 1.12.2, 1.11, 1.10,...]"
read VER
echo "VER=$VER" >> .MConfig/config.dt

source .MConfig/config.dt
cd Server/
$JAVA -jar BuildTools.jar --rev $VER
cd ..
echo "Generating files finished!"
select_ver
