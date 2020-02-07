#!/bin/sh

set -ex

export REPO=$(pwd)/..
export CC=$(pwd)/../mes-assets/mescc

cd ../sources/tinycc-mes

cp -r ../mes/mescc-lib/x86-mes .
cp ../mes/lib/linux/x86-mes/* x86-mes/

sh configure --cc="${REPO}/sources/mes-assets/mescc" --crtprefix=. --tccdir=. --prefix=. --cpu=x86
ARCH=x86 MES_PREFIX=${REPO}/sources/mes prefix=${REPO}/staging CC=${REPO}/sources/mes-assets/mescc mescc=${REPO}/sources/mes-assets/mescc sh bootstrap.sh

cp -f tcc ../../staging/bin/tcc
