#!gash

set -ex

VERSION=${MES_VERSION}

echo ${PATH}
cd ${REPO} 
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
cd ${REPO}/sources/mes-assets
cp mescc.in mescc
sed -i "s:@@REPO@@:${REPO}:" mescc

cd ${REPO}/sources

tar -xf nyacc-${NYACC_VERSION}.tar.gz
ln -s nyacc-${NYACC_VERSION} nyacc

tar -xf mes-${VERSION}.tar.gz
cd ${REPO}/sources/mes-${VERSION}
# no patch, use sed
for f in build-aux/build-guile.sh build-aux/build-mes.sh build-aux/configure-lib.sh build-aux/trace.sh build-aux/pre-inst-env.in scripts/mescc.in scripts/mesar.in ; do
    sed -i "s/if \[ /if test /" $f
    sed -i "s/\]; then/ ; then/" $f
done
for f in configure.sh scripts/mesar.in ; do
    sed -i "s/while \[ /while test /" $f
    sed -i "s/\]; do/ ; do/" $f
done
# Create symlinks
ln -s ../nyacc nyacc
ln -s lib/linux/x86-mes x86-mes

gash configure.sh --prefix=$(pwd) --host=x86-linux-gnu --build=x86-linux-gnu
gash bootstrap.sh

for f in mescc-lib/x86-mes/* ; do
    cp $f x86-mes/$(basename $f)
done
cp lib/x86-mes/x86.M1 x86-mes/

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

ln -s ../../sources/mes-assets/mescc ${REPO}/staging/bin/mescc
