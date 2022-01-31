#!/bin/sh
. $(dirname $0)/path.sh
test -z $BUILD_DIR && exit 127

mkdir -p $TARGET_DIR
cd $BUILD_DIR
ARCH=$(dpkg --print-architecture)
case ${ARCH} in
    amd64)
        dpkg-buildpackage -us -uc
        mv -f ../${PACKAGE}_${VERSION}_${ARCH}.changes ../${PACKAGE}_${VERSION}_${ARCH}.changes.orig
        awk '$3!="debug" {print}' ../${PACKAGE}_${VERSION}_${ARCH}.changes.orig > ../${PACKAGE}_${VERSION}_${ARCH}.changes
        scp -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null ../${PACKAGE}_${VERSION}_${ARCH}.changes ../${PACKAGE}*_${VERSION_BASE}*.buildinfo ../${PACKAGE}*_$VERSION_BASE*.deb $TARGET_DIR
        scp -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null ../${PACKAGE}*_${VERSION_BASE}*.dsc ../${PACKAGE}*_${VERSION_BASE}*.debian.tar.* $TARGET_DIR
        scp -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null ../${PACKAGE}*_${VERSION_BASE}*.orig.tar.gz $TARGET_DIR
        ;;
    *)
        dpkg-buildpackage -B -us -uc
        mv -f ../${PACKAGE}_${VERSION}_${ARCH}.changes ../${PACKAGE}_${VERSION}_${ARCH}.changes.orig
        awk '$3!="debug" {print}' ../${PACKAGE}_${VERSION}_${ARCH}.changes.orig > ../${PACKAGE}_${VERSION}_${ARCH}.changes
        scp -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null ../${PACKAGE}_${VERSION}_${ARCH}.changes ../${PACKAGE}*_${VERSION_BASE}*.buildinfo ../${PACKAGE}*_$VERSION_BASE*.deb $TARGET_DIR
        ;;
esac
