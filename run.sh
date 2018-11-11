#!/bin/sh

CURRENT=$(pwd)
DIR=$(cd $(dirname $0) && pwd)
DATA=$DIR/DATA
FILE=$(ls $DATA | grep "forge-.*-universal.jar")

cd $DATA && java -Xmx4096M -Xms1024M -jar $FILE