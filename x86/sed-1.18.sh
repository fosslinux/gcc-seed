#!gash

set -ex

export VERSION=${SED_TCC_VERSION}

export CC="${REPO}/staging/bin/tcc"
export CPP="${REPO}/staging/bin/tcc -E"
export CPPFLAGS="-I${REPO}/staging/include"
export LD="${REPO}/staging/bin/tcc"
export LDFLAGS="-L${REPO}/staging/lib"
export AR="${REPO}/staging/bin/tcc -ar"
export SHELL="${REPO}/staging/bin/sh"
export MAKE_SHELL="${REPO}/staging/bin/sh"
export CONFIG_SHELL="${REPO}/staging/bin/sh"
export INSTALL="${REPO}/staging/bin/install"

export extra_objs=""
export DEFS="-D HAVE_BCOPY"

cd ${REPO}/sources
tar -xf sed-${SED_TCC_VERSION}.tar.gz

cd ${REPO}/sources/sed-${SED_TCC_VERSION}
cp ${REPO}/staging/lib/crt*.o .

for p in ../patches/sed-${VERSION}/*.patch ; do
    patch -Np0 -i ${p}
done

sh configure \
    --prefix=${REPO}/staging \
    --build=i686-unknown-linux-gnu \
    --host=i686-unknown-linux-gnu

make

make install
