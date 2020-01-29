#!/bin/sh

set -ex

export REPO=$(pwd)/..
export CC="${REPO}/bin/tcc -DO_RDONLY=0"
export LD="${REPO}/bin/tcc"

cd ../sources/make-tcc
cp ../tinycc-mes/crt*.o .

sh configure --disable-nls
sh ./build.sh
cp make ../../bin/make
