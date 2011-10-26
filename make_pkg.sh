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
gnutar cvfz package/$PKG_NAME.gz ../$PKG_DIR/ --exclude=*.gz --exclude=.git

