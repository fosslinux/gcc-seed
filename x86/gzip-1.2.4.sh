#!gash

set -ex

export VERSION=${GZIP_TCC_VERSION}

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
tar -xf gzip-${VERSION}.tar.gz

cd ${REPO}/sources/gzip-${VERSION}

for p in ../patches/gzip-${VERSION}/*.patch ; do
    patch -Np0 -i ${p}
done

cp ${REPO}/staging/lib/crt*.o .

sh configure \
    --prefix=${REPO}/staging \
    --infodir=${REPO}/staging/share/info \
    --mandir=${REPO}/staging/share/man \
    --build=i686-unknown-linux-gnu \
    --host=i686-unknown-linux-gnu

make

# Remove gash-core-utils gzip to be replaced
rm ${REPO}/staging/bin/gzip
make install
