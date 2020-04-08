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
export PERL=""
export GMSGFMT=""
export MSGFMT=""
export MAKEINFO=""
export STRIP=""
export RANLIB=""
export XGETTEXT=""

cd ${REPO}/sources/make-3.80
cp ${REPO}/staging/lib/crt*.o .

sh configure \
    --disable-gettext \
    --disable-nls \
    --build=i686-unknown-linux-gnu \
    --host=i686-unknown-linux-gnu

sh build.sh

cp make ${REPO}/staging/bin/make
