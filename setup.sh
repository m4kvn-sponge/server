#!/bin/sh

# download spongeforge
wget -O spongeforge.jar https://repo.spongepowered.org/maven/org/spongepowered/spongeforge/1.12.2-2768-7.1.4/spongeforge-1.12.2-2768-7.1.4.jar

# download forge
wget -O forge-installer.jar "https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.12.2-14.23.5.2768/forge-1.12.2-14.23.5.2768-installer.jar"

# install forge
java -jar forge-installer.jar --installServer
