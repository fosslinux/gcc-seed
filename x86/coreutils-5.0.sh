#!bash

set -ex

export VERSION=${COREUTILS_TCC_VERSION}

export CC="${REPO}/staging/bin/tcc"
export CPP="${REPO}/staging/bin/tcc -E"
export CPPFLAGS="-I${REPO}/staging/include"
export LD="${REPO}/staging/bin/tcc"
export LDFLAGS="-L${REPO}/staging/lib"
export AR="${REPO}/staging/bin/tcc -ar"
export SHELL="${REPO}/staging/bin/sh"
export MAKE_SHELL="${REPO}/staging/bin/sh"
export CONFIG_SHELL="${REPO}/staging/bin/sh"
export RANLIB=""
export YACC=""

cd ${REPO}/sources
tar -xf coreutils-${VERSION}.tar.gz

cd ${REPO}/sources/coreutils-${VERSION}
cp ${REPO}/staging/lib/crt*.o .

rm src/dircolors.hin
for p in ../patches/coreutils-${VERSION}/*.patch ; do
    patch -Np0 -i ${p}
done

export INSTALL="${REPO}/staging/bin/sh $(pwd)/config/install-sh"

export LIBS="-lc"
sh configure \
    --prefix=${REPO}/staging \
    --infodir=${REPO}/staging/share/info \
    --mandir=${REPO}/staging/share/man \
    --build=i686-unknown-linux-gnu \
    --host=i686-unknown-linux-gnu \
    --disable-doc \
    --disable-nls \
    --disable-rpath \
    --disable-dependency-tracking \
    ac_cv_func_gethostbyname=no \
    gl_cv_func_rename_dest_works=yes

make

make install
