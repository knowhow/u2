#!/bin/bash

PKG_NAME=u2
PKG_DIR=u2

OS_DARWIN=`uname -a | grep -c Darwin`

echo $OS_DARWIN

if [ "$OS_DARWIN" != "0" ]; then
    TAR=gnutar
else
    TAR=tar
fi

mkdir package
rm package/$PK_NAME.gz
cd ..; $TAR cvfz $PKG_DIR/package/$PKG_NAME.gz  --exclude="*/.gitignore" --exclude="*/package" --exclude="*.gz" --exclude="*/.git" $PKG_DIR
cd $PKG_DIR
echo "----- dobili smo:  ----"
ls package/$PKG_NAME.gz
