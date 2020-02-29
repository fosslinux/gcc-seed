#!/bin/sh

set -ex

export REPO=$(pwd)/..
. ${REPO}/sources/gash-assets/source.sh

export CC=$(pwd)/../mes-assets/mescc

cd ../sources/tinycc-mes

ln -s ../mes/x86-mes .

${REPO}/sources/gash-assets/gash configure --cc="${REPO}/sources/mes-assets/mescc" --crtprefix=. --tccdir=. --prefix=. --cpu=x86
ARCH=x86 MES_PREFIX=${REPO}/sources/mes prefix=${REPO}/staging CC=${REPO}/sources/mes-assets/mescc mescc=${REPO}/sources/mes-assets/mescc ${REPO}/sources/gash-assets/gash bootstrap.sh

cp tcc ../../staging/bin/tcc
