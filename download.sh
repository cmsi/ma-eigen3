#!/bin/sh
. $(dirname $0)/path.sh

if [ -f eigen3_$VERSION_BASE.orig.tar.gz ]; then
  exit 127
fi
wget https://gitlab.com/libeigen/eigen/-/archive/$VERSION_BASE/eigen-$VERSION_BASE.tar.bz2
tar jxvf eigen-$VERSION_BASE.tar.bz2
mv -f eigen-$VERSION_BASE eigen3-$VERSION_BASE
tar zcvf eigen3_$VERSION_BASE.orig.tar.gz eigen3-$VERSION_BASE
rm -rf eigen3-$VERSION_BASE eigen-$VERSION_BASE.tar.bz2
