#!/bin/sh

export REPO=$(pwd)/..

cd ..
rm -f bin/mes
cp seed/mes-amd64-seed bin/mes

cd sources/mes

export CC=$(pwd)/../mes-assets/mescc

sh configure.sh --prefix=$(pwd)/../../tmp --host=x86_64
sh bootstrap.sh
cp bin/mes ../../bin/mes
