#!/bin/bash

read -p "Enter RAM amount in GB (Default 8): " RAM
RAM=${RAM:-8}

echo "java -Xmx${RAM}G -Xms${RAM}G -jar fabric-server-launch.jar nogui" > start.sh
chmod +x start.sh
echo "Created start.sh with ${RAM}GB RAM."

read -p "Enter server port (Default 25565): " PORT
PORT=${PORT:-25565}

VC_PORT=$((PORT - 1100))
echo "Voice Chat port will be ${VC_PORT}"

SERVER_PROPS="server.properties"

if [[ ! -f "$SERVER_PROPS" ]]; then
    echo "Error: $SERVER_PROPS not found!"
    exit 1
fi

GAME_VERSION=$(grep "^version=" "$SERVER_PROPS" | cut -d'=' -f2)
GAME_VERSION=${GAME_VERSION:-"Unknown"}

ROOT_FOLDER_NAME=$(basename "$(pwd)")

MOTD="\u00A76\u00A7lHamcraft:\u00A7r \u00A7c\u00A7o${ROOT_FOLDER_NAME} Edition\u00A7r\n\u00A75\u00A7n${GAME_VERSION}"

sed -i "s/^motd=.*/motd=${MOTD}/" "$SERVER_PROPS"
sed -i "s/^server-port=.*/server-port=${PORT}/" "$SERVER_PROPS"

echo "Updated server.properties: motd and server-port."

VC_PROPS="config/voicechat/voicechat-server.properties"

if [[ ! -f "$VC_PROPS" ]]; then
    echo "Error: $VC_PROPS not found!"
    exit 1
fi

sed -i "s/^port=.*/port=${VC_PORT}/" "$VC_PROPS"
echo "Updated voicechat-server.properties with port ${VC_PORT}."

echo "All done! You can now run ./start.sh to launch the server."
