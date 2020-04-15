#!gash

set -ex

export CC="${REPO}/staging/bin/tcc"
export CPP="${REPO}/staging/bin/tcc -E"
export CPPFLAGS="-I${REPO}/staging/include"
export LD="${REPO}/staging/bin/tcc"
export LDFLAGS="-L${REPO}/staging/lib"
export AR="${REPO}/staging/bin/tcc -ar"
export SHELL="${REPO}/staging/bin/sh"
export MAKE_SHELL="${REPO}/staging/bin/sh"
export CONFIG_SHELL="${REPO}/staging/bin/sh"

cd ${REPO}/sources/diffutils-2.7

cp ${REPO}/staging/lib/crt*.o .

export INSTALL="${REPO}/staging/bin/install"

sh configure \
    --prefix=${REPO}/staging \
    --build=i686-unknown-linux-gnu \
    --host=i686-unknown-linux-gnu

make

make install
