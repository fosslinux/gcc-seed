#!/bin/sh

set -ex

export REPO=$(pwd)/..
. ${REPO}/sources/gash-assets/source.sh

export CC="${REPO}/staging/bin/tcc"
export CPP="${REPO}/staging/bin/tcc -E"
export LD="${REPO}/staging/bin/tcc"

cd ../sources/make-tcc
cp ../tinycc-mes/crt*.o .

${REPO}/sources/gash-assets/gash configure --disable-nls --build=i686-unknown-linux-gnu --host=i686-unknown-linux-gnu
${REPO}/sources/gash-assets/gash build.sh

cp make ../../staging/bin/make
