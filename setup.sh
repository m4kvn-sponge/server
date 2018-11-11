#!/bin/sh

CURRENT=$(pwd)
DIR=$(cd $(dirname $0) && pwd)
BACKUP=$DIR/backup
DATA=$DIR/data
MODS=$DATA/mods
FORGE_INSTALLER=$DATA/forge-installer.jar
SPONGE=$MODS/spongeforge.jar

FORGE_VERSION=1.12.2-14.23.5.2768
SPONGE_VERSION=1.12.2-2768-7.1.4

FORGE_URL="https://files.minecraftforge.net/maven/net/minecraftforge/forge/$FORGE_VERSION/forge-$FORGE_VERSION-installer.jar"
SPONGE_URL="https://repo.spongepowered.org/maven/org/spongepowered/spongeforge/$SPONGE_VERSION/spongeforge-$SPONGE_VERSION.jar"

# backup data
if [ -s $DATA ]; then
    mkdir -p $BACKUP
    date=$(date "+%Y%m%d-%H%M%S")
    zip -r $DIR/backup/data-$date $DATA
fi

# initial data directory
rm -fr $DATA
mkdir -p $DATA
mkdir -p $MODS

# download forge
if [ ! -s $FORGE_INSTALLER ]; then
    wget -O $FORGE_INSTALLER $FORGE_URL
fi

# download spongeforge
if [ ! -s $SPONGE ]; then
    wget -O $SPONGE $SPONGE_URL
fi

# install forge
cd $DATA && java -jar $FORGE_INSTALLER --installServer
rm -f $FORGE_INSTALLER

# move to current directory
cd $CURRENT

# run forge-server
. $DIR/run.sh