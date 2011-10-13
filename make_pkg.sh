#!/bin/bash

PKG_NAME=u2
PKG_DIR=u2

mkdir package
gnutar cvfz package/$PKG_NAME.gz ../$PKG_DIR/ --exclude=*.gz --exclude=.git

