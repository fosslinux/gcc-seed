#!gash

set -ex

export VERSION=${BASH_TCC_VERSION}

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
export CFLAGS="-D _POSIX_VERSION=1"

cd ${REPO}/sources
tar -xf bash-${VERSION}.tar.gz

cd ${REPO}/sources/bash-${VERSION}

cp ${REPO}/staging/lib/crt*.o .
cp ${REPO}/staging/lib/crt*.o support/
cp ${REPO}/staging/lib/crt*.o builtins/

cp ${REPO}/staging/include/getopt.h ${REPO}/sources/mes-${MES_VERSION}/lib/posix/getopt.c .
cp ${REPO}/staging/include/getopt.h ${REPO}/sources/mes-${MES_VERSION}/lib/posix/getopt.c support/ 

cp ${REPO}/staging/lib/libgetopt.a .

mkdir -p tmp

for p in ../patches/bash-${VERSION}/*.patch ; do
    patch -Np0 -i ${p}
done

export INSTALL="${REPO}/staging/bin/sh $(pwd)/support/install.sh"

sh configure \
    --prefix=${REPO}/staging \
    --infodir=${REPO}/staging/share/info \
    --mandir=${REPO}/staging/share/man \
    --build=i686-unknown-linux-gnu \
    --host=i686-unknown-linux-gnu \
    --without-bash-malloc \
    --disable-readline \
    --disable-history \
    --disable-help-builtin \
    --disable-progcomp \
    --disable-net-redirections \
    --disable-nls \
    ac_cv_func_dlopen=no

make

make install

rm -f ${REPO}/staging/bin/sh
ln -s bash ${REPO}/staging/bin/sh
