# ma-eigen3

## How to prepare source files for eigen3 package

1. ソースファイルの準備 (ホスト上で)

        VERSION=3.3.5
        cd $HOME/vagrant/data/src
        wget http://bitbucket.org/eigen/eigen/get/$VERSION.tar.gz
        tar zxvf $VERSION.tar.gz
        mv -f eigen-eigen-* eigen3_$VERSION
        tar zcvf eigen3_$VERSION.orig.tar.gz eigen3_$VERSION
        rm -rf $VERSION.tar.gz* eigen3_$VERSION

