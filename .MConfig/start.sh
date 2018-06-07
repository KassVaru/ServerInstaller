#!/bin/bash
source .MConfig/config.dt

start_srv()
{
    echo
    echo "Starting server..."
    cd Server/
    $SCREEN -dmS MC $JAVA -Xmx$RAM -jar $PATH
    cd ..
    $SLEEP 3
    echo "[DONE]"
    echo
    $SLEEP 2
    $CLEAR
    run_srv
}

stop_srv()
{
    echo
    echo "Stopping server in 10s..."
    $SLEEP 10
    $SCREEN -p 0 -S MC -X eval 'stuff "stop"\015'
    echo "[DONE]"
    echo
    $SLEEP 3
    $CLEAR
    run_srv
}

restart_srv()
{
    echo
    echo "Stopping server in 10s..."
    $SLEEP 10
    $SCREEN -p 0 -S MC -X eval 'stuff "stop"\015'
    echo "[DONE]"
    $SLEEP 3
    echo
    echo "Starting server..."
    cd Server/
    $SCREEN -dmS MC $JAVA -Xmx$RAM -jar $PATH
    cd ..
    $SLEEP 3
    echo "[DONE]"
    echo
    $SLEEP 3
    $CLEAR
    run_srv
}

config_srv()
{
    echo
    echo "Are you sure you want to reconfigure SERVER.PROPERTIES [yes/no]"
    read ask
    
    if [ "$ask" == "YES" ] || [ "$ask" == "yes" ] || [ "$ask" == "Yes" ] || [ "$ask" == "yES" ] || [ "$ask" == "y" ] || [ "$ask" == "Y" ]; then
        echo
        echo "Prepare to reconfigure server.properties!"
        $SLEEP 3
        . .MConfig/cr_prop.sh
        $SLEEP 3
        echo
        run_srv
    else
        if [ "$ask" == "NO" ] || [ "$ask" == "no" ] || [ "$ask" == "No" ] || [ "$ask" == "nO" ] || [ "$ask" == "n" ] || [ "$ask" == "N" ]; then
            echo
            $CLEAR
            run_srv
        else
            echo "Type: yes or no!"
            config_srv
        fi
    fi
}

show_srv()
{
    $CLEAR
    echo "Openning server terminal..."
    $SLEEP 4
    $SCREEN -r MC
    run_srv
}

ram_srv()
{
    $CLEAR
    echo "How much RAM do you want to use?"
    echo "[Type value with M - Megabye or G - Gigabyte at the end of number.]"
    echo "Example: 1024M or 1G. If you make a mistake the server will not work..."
    read RAM
    $SED -i "s/RAM=.*/RAM=$RAM/" .MConfig/config.dt
    $CLEAR
    run_srv
}

help_srv()
{
    echo
    echo "Welcome in help menu!"
    echo "This program is created to help you with install and manage minecraft server for Spigot/Bukkit"
    echo "If you have any ERROR please write me an email: piotr.wasielewski00@gmail.com"
    echo "--------------------------------"
    echo "You can use: Start, Stop, Restart, Config or Show option."
    echo
    echo "Help - Open this menu."
    echo
    echo "Start - this function is used to start your Minecraft server."
    echo
    echo "Stop - this function is used to stop your Minecraft server."
    echo
    echo "Config - this function is used to reconfigure your Minecraft server."
    echo
    echo "Restart - this function is used to restart your Minecraft server."
    echo
    echo "Show - if server is running this command open server terminal."
    echo "IMPORTANT!: Show function is only for advanced user."
    echo
    echo "Ram - this function change RAM value what is define for server"
    echo "--------------------------------"
    echo
    echo "When you are typing command you can use several syntaxes:"
    echo "#Example# For config function you can type: config, CONFIG, Config or cONFIG"
    echo "If you make a mistake don't worry. Program show again manage menu and you can type command once again"
    echo "--------------------------------"
    echo "Created by KassVaru"
    echo
    $SLEEP 10
    run_srv
}

exit_srv()
{
    echo
    echo "Thanks for using me! :D"
    $SLEEP 5
    $CLEAR
    exit 1
}

run_srv()
{
if [ ! -f .MConfig/end.dt ]; then
    cd Server/
    $SCREEN -S MC $JAVA -jar $PATH
    cd ..

    echo
    echo "Changing eula to: true"
    $SLEEP 8
    echo "eula=true" > Server/eula.txt
    echo
    echo "Starting server to generate all files..."
    cd Server/
    $SCREEN -dmS MC $JAVA -jar $PATH
    cd ..
    $SLEEP 3
    echo "Wait until the server complate work."
    $SLEEP 20
    $SCREEN -p 0 -S MC -X eval 'stuff "stop"\015'
    echo
else
    echo "Welcome in Server Control Terminal"
    echo "----------------------------------"
    echo "Type what do you want to do: "
    echo "Start/Stop/Help/... - more in help menu"
    read input
    
    if [ "$input" == "start" ] || [ "$input" == "START" ] || [ "$input" == "Start" ] || [ "$input" == "sTART" ]; then
        start_srv
    else
        if [ "$input" == "stop" ] || [ "$input" == "STOP" ] || [ "$input" == "Stop" ] || [ "$input" == "sTOP" ]; then
            stop_srv
        else
            if [ "$input" == "restart" ] || [ "$input" == "RESTART" ] || [ "$input" == "Restart" ] || [ "$input" == "rESTART" ]; then
                restart_srv
            else
                if [ "$input" == "config" ] || [ "$input" == "CONFIG" ] || [ "$input" == "Config" ] || [ "$input" == "cONFIG" ]; then
                    config_srv
                else
                    if [ "$input" == "help" ] || [ "$input" == "HELP" ] || [ "$input" == "Help" ] || [ "$input" == "hELP" ]; then
                        $CLEAR
                        help_srv
                    else
                        if [ "$input" == "exit" ] || [ "$input" == "EXIT" ] || [ "$input" == "Exit" ] || [ "$input" == "eXIT" ] || [ "$input" == "?" ]; then
                            exit_srv
                        else
                            if [ "$input" == "show" ] || [ "$input" == "SHOW" ] || [ "$input" == "Show" ] || [ "$input" == "sHOW" ]; then
                                show_srv
                            else
                                if [ "$input" == "ram" ] || [ "$input" == "RAM" ] || [ "$input" == "Ram" ] || [ "$input" == "rAM" ]; then
                                    ram_srv
                                else
                                    $CLEAR
                                    run_srv
                                fi
                            fi
                        fi
                    fi
                fi
            fi
        fi
    fi
fi
}
run_srv