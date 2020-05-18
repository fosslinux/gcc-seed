#!gash

set -ex

export VERSION=${PATCH_TCC_VERSION}

export CC="${REPO}/staging/bin/tcc"
export CPP="${REPO}/staging/bin/tcc -E"
export CPPFLAGS="-I${REPO}/staging/include -I."
export LD="${REPO}/staging/bin/tcc"
export LDFLAGS="-L${REPO}/staging/lib"
export AR="${REPO}/staging/bin/tcc -ar"
export SHELL="${REPO}/staging/bin/sh"
export MAKE_SHELL="${REPO}/staging/bin/sh"
export CONFIG_SHELL="${REPO}/staging/bin/sh"

cd ${REPO}/sources
tar -xf patch-${VERSION}.tar.gz

cd ${REPO}/sources/patch-${VERSION}
cp ${REPO}/staging/lib/crt*.o .

${REPO}/guile_seed/bin/guile --no-auto-compile -L ${REPO}/guile_seed/share/guile/site/2.0 -L ${REPO}/sources/gash -L ${REPO}/sources/gash-core-utils -L ${REPO}/sources/gash-assets/modules -e main -s ${REPO}/sources/gash-assets/sed.scm -i "s/ed_PROGRAM/\"ed\"/" pch.c
sed -i "s/\#define mode_t int/typedef int mode_t;/" configure

sh configure \
    --prefix=${REPO}/staging \
    --build=i686-unknown-linux-gnu \
    --host=i686-unknown-linux-gnu

echo '#define PATCH_VERSION "2.5"' > patchlevel.h

SRCS="getopt getopt1 addext argmatch backupfile basename inp maketime partime patch pch quotearg util version"

for f in ${SRCS} ; do
    ${CC} ${CPPFLAGS} ${CFLAGS} -c -o $f.o $f.c
done

${LD} ${LDFLAGS} -o patch $(echo ${SRCS} | sed "s/ /.o /g" | sed "s/$/.o/")

cp patch ${REPO}/staging/bin/patch
