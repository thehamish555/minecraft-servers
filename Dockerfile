FROM openjdk:24-jdk-slim

WORKDIR /minecraft

RUN apt-get update && apt-get install -y curl unzip && rm -rf /var/lib/apt/lists/*

ADD https://meta.fabricmc.net/v2/versions/loader/1.21.8/0.17.2/1.0.1/server/jar fabric-server-launch.jar

RUN echo "eula=true" > eula.txt

RUN mkdir -p /minecraft/mods

EXPOSE 25565

ENTRYPOINT ["sh", "-c", "java -Xmx${RAM:-2G} -Xms${RAM:-2G} -jar fabric-server-launch.jar nogui"]
