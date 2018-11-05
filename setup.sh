#!/bin/sh

DIR=$(cd $(dirname $0) && pwd)
DATA=$DIR/data
SPONGE=$DATA/spongeforge.jar
FORGE_INSTALLER=$DATA/forge-installer.jar

# download spongeforge
if [ ! -s $SPONGE ]; then
    wget -O $SPONGE https://repo.spongepowered.org/maven/org/spongepowered/spongeforge/1.12.2-2768-7.1.4/spongeforge-1.12.2-2768-7.1.4.jar
fi

# download forge
if [ ! -s $FORGE_INSTALLER ]; then
    wget -O $FORGE_INSTALLER "https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.12.2-14.23.5.2768/forge-1.12.2-14.23.5.2768-installer.jar"
fi

exit 0
cd $DIR

# install forge
java -jar forge-installer.jar --installServer
