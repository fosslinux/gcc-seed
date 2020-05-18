#!gash

set -ex

export VERSION=${MAKE_TCC_VERSION}

export CC="${REPO}/staging/bin/tcc"
export CPP="${REPO}/staging/bin/tcc -E"
export CPPFLAGS="-I${REPO}/staging/include"
export LD="${REPO}/staging/bin/tcc"
export LDFLAGS="-L${REPO}/staging/lib"
export AR="${REPO}/staging/bin/tcc -ar"
export SHELL="${REPO}/staging/bin/sh"
export MAKE_SHELL="${REPO}/staging/bin/sh"
export CONFIG_SHELL="${REPO}/staging/bin/sh"
export PERL=""
export GMSGFMT=""
export MSGFMT=""
export MAKEINFO=""
export STRIP=""
export RANLIB=""
export XGETTEXT=""

cd ${REPO}/sources
tar -xf make-${VERSION}.tar.gz

cd ${REPO}/sources/make-${VERSION}
mkdir -p tmp
cp ${REPO}/staging/lib/crt*.o .

for p in ../patches/make-${VERSION}/* ; do
    patch -Np0 -i ${p}
done

sh configure \
    --prefix=${REPO}/staging \
    --disable-gettext \
    --disable-nls \
    --build=i686-unknown-linux-gnu \
    --host=i686-unknown-linux-gnu

sh build.sh

cp make ${REPO}/staging/bin/make
