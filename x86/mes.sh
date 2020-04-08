#!gash

set -ex

echo ${PATH}
cd ..
rm -f bin/mes

export GUILE_LOAD_PATH=${REPO}/sources/nyacc/module:$GUILE_LOAD_PATH
export CC="${REPO}/sources/mes-assets/mescc"
export SCHEME=guile
export HEX2=${REPO}/staging/bin/hex2
export M1=${REPO}/staging/bin/M1
export BLOOD_ELF=${REPO}/staging/bin/blood-elf
export BASH=${REPO}/staging/bin/gash
export SHELL=${REPO}/staging/bin/gash
export GUILE=${REPO}/guile_seed/bin/guile

# Subtitute in mescc
cd sources/mes-assets
cp mescc.in mescc
sed -i "s:@@REPO@@:${REPO}:" mescc

cd ../mes

gash configure.sh --prefix=$(pwd) --host=x86-linux-gnu --build=x86-linux-gnu
gash bootstrap.sh

for f in mescc-lib/x86-mes/* ; do
    cp $f x86-mes/$(basename $f)
done

cp mescc-lib/x86-mes/*.a ${REPO}/staging/lib
cp mescc-lib/crt1.o ${REPO}/staging/lib

for d in sys gnu mach mes linux linux/x86_64 linux/x86 ; do
    mkdir -p ${REPO}/staging/include/$d
done
cd include
for f in $(find .) ; do
    if test -f $f ; then
        cp $f ${REPO}/staging/include/$f
    fi
done
