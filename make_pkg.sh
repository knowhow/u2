#!/bin/bash

PKG_NAME=u2
PKG_DIR=u2

OS_MAC_OSX = `uname -a | grep -c Darwin`

if [ OS_MAC_OSX == "1" ]; then
    TAR=gnutar
else
    TAR=tar
fi

mkdir package

cd ..; $TAR cvfz $PKG_DIR/package/$PKG_NAME.gz  --exclude="*/.gitignore" --exclude="*/package" --exclude="*.gz" --exclude="*/.git" $PKG_DIR

echo "----- result:  ----"
cd $PKG_DIR
ls package/$PKG_NAME.gz
