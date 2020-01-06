#!/bin/sh

export REPO=$(pwd)/..

cd ..
rm -f bin/mes
cp seed/mes-amd64-seed bin/mes

cd sources/mes

export GUILE_LOAD_PATH=$(pwd)/nyacc/module:$GUILE_LOAD_PATH
export CC=$(pwd)/../mes-assets/mescc

cp -rf ../nyacc ./nyacc

sh configure.sh --prefix=$(pwd) --host=x86_64-linux-gnu
sh bootstrap.sh

# We do not use the resulting mes because it is a bit b0rked
# However we used the resulting libc for the early stages of TinyCC
