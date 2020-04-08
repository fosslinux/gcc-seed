#!gash

set -ex

export CC=${REPO}/sources/mes-assets/mescc
export CPPFLAGS="-I${prefix}/include"
export ARCH=x86
export prefix=${REPO}/staging
export MES_PREFIX=${REPO}/sources/mes
export mescc="${REPO}/guile_seed/bin/guile --no-auto-compile -L ${REPO}/guile_seed/share/guile/site/2.0 -L ${REPO}/sources/gash -L ${REPO}/sources/gash-core-utils -L ${REPO}/sources/gash-assets/modules -e main -s ${REPO}/sources/gash-assets/gash.scm ${REPO}/sources/mes-assets/mescc"
export interpreter=/lib/mes-loader-dummy

cd ${REPO}/sources/tinycc-0.9.26
ln -s ${REPO}/sources/mes/x86-mes .

sh configure \
    --cc="${CC}" \
    --crtprefix=. \
    --elfinterp=/lib/mes-loader-dummy \
    --tccdir=. \
    --prefix=${prefix} \
    --cpu=x86
sh bootstrap.sh

cp tcc ${REPO}/staging/bin/tcc
mkdir -p ${REPO}/staging/lib/tcc
cp *.a crt*.o ${REPO}/staging/lib/
cp libtcc1.a ${REPO}/staging/lib/tcc/
