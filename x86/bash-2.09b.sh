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
export RANLIB=""
export YACC=""

export CFLAGS="-D _POSIX_VERSION=1"

cd ${REPO}/sources/bash-2.09b
cp ${REPO}/staging/lib/crt*.o .
cp ${REPO}/staging/lib/crt*.o support/
cp ${REPO}/staging/lib/crt*.o builtins/
cp ${REPO}/staging/lib/libgetopt.a .

sh configure \
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

cp bash ${REPO}/staging/bin/bash
rm -f ${REPO}/staging/bin/sh
ln -s bash ${REPO}/staging/bin/sh
