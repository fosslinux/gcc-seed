#!/bin/sh

set -ex

export REPO=$(pwd)/..
. ${REPO}/sources/gash-assets/source.sh

cd ..
rm -f bin/mes

cd sources/mes

export GUILE_LOAD_PATH=$(pwd)/nyacc/module:$GUILE_LOAD_PATH
export CC="${REPO}/sources/gash-assets/gash ${REPO}/sources/mes-assets/mescc"
export SCHEME=guile
export HEX2=${REPO}/staging/bin/hex2
export M1=${REPO}/staging/bin/M1
export BLOOD_ELF=${REPO}/bin/blood-elf

# We do not use staging here because things are too interdependent
${REPO}/sources/gash-assets/gash configure.sh --prefix=$(pwd) --host=x86-linux-gnu
${REPO}/sources/gash-assets/gash bootstrap.sh

for f in mescc-lib/x86-mes/* ; do
    cp $f x86-mes/$(basename $f)
done

# We do not use the resulting mes because it is a bit b0rked
# However we used the resulting libc for the early stages of TinyCC
