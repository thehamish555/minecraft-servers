#!/bin/sh

# Copy eula.txt if it doesn't exist in data folder
if [ ! -f /minecraft/data/eula.txt ]; then
    cp /minecraft/eula.txt /minecraft/data/
fi

# Start the server from the container jar, but set working directory to data
cd /minecraft/data
java -Xmx${RAM:-2G} -Xms${RAM:-2G} -jar /minecraft/fabric-server-launch.jar nogui
