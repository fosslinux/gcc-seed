#!/bin/sh

set -ex

export REPO=$(pwd)/..
export CC="${REPO}/staging/bin/tcc"
export CPP="${REPO}/staging/bin/tcc -E"
export LD="${REPO}/staging/bin/tcc"

cd ../sources/make-tcc
cp ../tinycc-mes/crt*.o .

sh configure --disable-nls --build=i686-unknown-linux-gnu --host=i686-unknown-linux-gnu
sh ./build.sh
cp make ../../staging/bin/make
