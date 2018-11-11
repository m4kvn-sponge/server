#!/bin/sh

DIR=$(cd $(dirname $0) && pwd)
DATA=$DIR/data
SPONGE=$DATA/spongeforge.jar
FORGE_INSTALLER=$DATA/forge-installer.jar

SPONGE_VERSION=1.12.2-2768-7.1.4
FORGE_VERSION=1.12.2-14.23.5.2768

SPONGE_URL="https://repo.spongepowered.org/maven/org/spongepowered/spongeforge/$SPONGE_VERSION/spongeforge-$SPONGE_VERSION.jar"
FORGE_URL="https://files.minecraftforge.net/maven/net/minecraftforge/forge/$FORGE_VERSION/forge-$FORGE_VERSION-installer.jar"

# download spongeforge
if [ ! -s $SPONGE ]; then
    wget -O $SPONGE $SPONGE_URL
fi

# download forge
if [ ! -s $FORGE_INSTALLER ]; then
    wget -O $FORGE_INSTALLER $FORGE_URL
fi

# install forge
cd $DATA && java -jar forge-installer.jar --installServer
