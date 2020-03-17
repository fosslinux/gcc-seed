#!/bin/sh

set -ex

export REPO=$(pwd)/..
. ${REPO}/sources/gash-assets/source.sh

export CC="${REPO}/staging/bin/tcc"
export LD="${REPO}/staging/bin/tcc"
export AR="${REPO}/staging/bin/tcc -ar"
export CFLAGS="-D _POSIX_VERSION=1"

cd ../sources/bash-tcc
cp ../tinycc-mes/crt*.o .
cp ../tinycc-mes/crt*.o support/ 
cp ../tinycc-mes/libgetopt.a .

${REPO}/sources/gash-assets/gash configure --build=i686-unknown-linux-gnu --host=i686-unknown-linux-gnu --without-bash-malloc --disable-readline --disable-history --disable-help-builtin --disable-progcomp --disable-net-redirections --disable-nls ac_cv_func_dlopen=no
${REPO}/staging/bin/make

cp bash ../../staging/bin/bash
