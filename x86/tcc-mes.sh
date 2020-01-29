#!/bin/sh

set -ex

export REPO=$(pwd)/..
export CC=$(pwd)/../mes-assets/mescc

cd ../sources/tinycc-mes

cp -r ../mes/mescc-lib/x86-mes .
cp ../mes/lib/linux/x86-mes/* x86-mes/

sh configure --cc="$(pwd)/../mes-assets/mescc" --crtprefix=. --tccdir=. --prefix=. --cpu=x86
ARCH=x86 MES_PREFIX=${REPO}/sources/mes prefix=$(pwd) CC=$(pwd)/../mes-assets/mescc mescc=$(pwd)/../mes-assets/mescc sh bootstrap.sh

cp -f tcc ../../bin/tcc
