#!/bin/sh

CURRENT=$(pwd)
DIR=$(cd $(dirname $0) && pwd)
DATA=$DIR/data
FILE=$(ls $DATA | grep "forge-.*-universal.jar")

cd $DATA && java -Xmx3G -Xms1G -d64 -jar $FILE nogui
