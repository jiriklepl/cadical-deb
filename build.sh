#!/bin/sh

ROOT="cadical-sc2020"

BIN="$ROOT/usr/bin"
LIB="$ROOT/usr/lib"
CADICAL="$ROOT/usr/include/glucose"

rm -r "$ROOT/usr"
mkdir -p $BIN
mkdir -p $LIB
mkdir -p $CADICAL

./configure && make

mv -t $LIB build/libcadical.a

mv -t $BIN build/cadical
mv -t $BIN build/mobical 

cp -t $CADICAL src/cadical.hpp

dpkg-deb --build --root-owner-group "$ROOT"
