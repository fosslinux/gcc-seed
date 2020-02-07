#!/bin/sh

set -ex

export REPO=$(pwd)/..

cd ..
rm -f bin/mes

cd sources/mes

export GUILE_LOAD_PATH=$(pwd)/nyacc/module:$GUILE_LOAD_PATH
export CC=${REPO}/sources/mes-assets/mescc
export HEX2=${REPO}/staging/bin/hex2
export M1=${REPO}/staging/bin/M1
export BLOOD_ELF=${REPO}/bin/blood-elf

cp -rf ../nyacc ./nyacc

# We do not use staging here because things are too interdependent
sh configure.sh --prefix=$(pwd) --host=x86-linux-gnu
sh bootstrap.sh

# We do not use the resulting mes because it is a bit b0rked
# However we used the resulting libc for the early stages of TinyCC
