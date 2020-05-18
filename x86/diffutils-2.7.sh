#!gash

set -ex

export VERSION=${DIFFUTILS_TCC_VERSION}

export CC="${REPO}/staging/bin/tcc"
export CPP="${REPO}/staging/bin/tcc -E"
export CPPFLAGS="-I${REPO}/staging/include"
export LD="${REPO}/staging/bin/tcc"
export LDFLAGS="-L${REPO}/staging/lib"
export AR="${REPO}/staging/bin/tcc -ar"
export SHELL="${REPO}/staging/bin/sh"
export MAKE_SHELL="${REPO}/staging/bin/sh"
export CONFIG_SHELL="${REPO}/staging/bin/sh"

cd ${REPO}/sources
tar -xf diffutils-${VERSION}.tar.gz

cd ${REPO}/sources/diffutils-${VERSION}
cp ${REPO}/staging/lib/crt*.o .

for p in ../patches/diffutils-${VERSION}/*.patch ; do
    patch -Np0 -i ${p}
done

export INSTALL="${REPO}/staging/bin/install"

sh configure \
    --prefix=${REPO}/staging \
    --build=i686-unknown-linux-gnu \
    --host=i686-unknown-linux-gnu

make

make install
