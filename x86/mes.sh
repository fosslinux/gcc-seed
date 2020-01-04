#!/bin/sh

export REPO=$(pwd)/..

cd ..
rm -f bin/mes

cd sources/mes

export CC=$(pwd)/../mes-assets/mescc
export HEX2=${REPO}/bin/hex2
export M1=${REPO}/bin/M1
export BLOOD_ELF=${REPO}/bin/blood-elf

sh configure.sh --prefix=$(pwd)/../../tmp --host=x86
sh bootstrap.sh
cp bin/mes ../../bin/mes
