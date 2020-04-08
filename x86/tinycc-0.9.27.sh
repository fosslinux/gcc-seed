#!gash

set -ex

export CC=${REPO}/staging/bin/tcc
export CPPFLAGS="-I${prefix}/include"
export ARCH=x86
export prefix=${REPO}/staging
export interpreter=/lib/mes-loader-dummy
export MES_PREFIX=${REPO}/sources/mes

cd ${REPO}/sources/tinycc-0.9.27 

sh configure \
    --cc="${CC}" \
    --crtprefix=. \
    --elfinterp=/lib/mes-loader-dummy \
    --tccdir=. \
    --prefix=. \
    --cpu=x86

$CC \
    -vvv \
    -I ${MES_PREFIX}/include \
    -I ${MES_PREFIX}/include/linux/${ARCH} \
    -D BOOTSTRAP=1 \
    -D ONE_SOURCE=1 \
    -D TCC_TARGET_I386=1 \
    -D CONFIG_TCC_STATIC=1 \
    -D CONFIG_USE_LIBGCC=1 \
    -D CONFIG_TCCDIR=\"${prefix}/lib\" \
    -D CONFIG_TCC_CRTPREFIX=\"${prefix}/lib:{B}/lib:.\" \
    -D CONFIG_TCC_ELFINTERP=\"${prefix}/lib:{B}/lib:.\" \
    -D CONFIG_TCC_LIBPATHS=\"${prefix}/lib\" \
    -D CONFIG_TCC_SYSINCLUDEPATHS=\"./include:${prefix}/include:{B}/include\" \
    -D TCC_LIBGCC=\"./lib/libc.a\" \
    -o tcc-boot \
    tcc.c

export CC=$(pwd)/tcc-boot

sh configure \
    --cc="${CC}" \
    --crtprefix=. \
    --elfinterp=/lib/mes-loader-dummy \
    --tccdir=. \
    --prefix=. \
    --cpu=x86

$CC \
    -vvv \
    -I ${MES_PREFIX}/include \
    -I ${MES_PREFIX}/include/linux/${ARCH} \
    -D BOOTSTRAP=1 \
    -D ONE_SOURCE=1 \
    -D TCC_TARGET_I386=1 \
    -D CONFIG_TCC_STATIC=1 \
    -D CONFIG_USE_LIBGCC=1 \
    -D CONFIG_TCCDIR=\"${prefix}/lib\" \
    -D CONFIG_TCC_CRTPREFIX=\"${prefix}/lib:{B}/lib:.\" \
    -D CONFIG_TCC_ELFINTERP=\"${prefix}/lib:{B}/lib:.\" \
    -D CONFIG_TCC_LIBPATHS=\"${prefix}/lib\" \
    -D CONFIG_TCC_SYSINCLUDEPATHS=\"./include:${prefix}/include:{B}/include\" \
    -D TCC_LIBGCC=\"${prefix}/lib/libc.a\" \
    -o tcc \
    tcc.c

cp tcc ${REPO}/staging/bin/tcc -f

export CC=${REPO}/staging/bin/tcc
export AR="${REPO}/staging/bin/tcc -ar"
export ARCH=x86

for i in 1 i n ; do
    $CC \
        -c \
        -I ${MES_PREFIX}/include \
        -I ${MES_PREFIX}/include/linux/${ARCH} \
        -static \
        -nostdlib \
        -nostdinc \
        -o crt$i.o \
        ${MES_PREFIX}/gcc-lib/${ARCH}-mes/crt$i.c
done

$CC \
    -c \
    -I ${MES_PREFIX}/include \
    -I ${MES_PREFIX}/include/linux/${ARCH} \
    -o libc.o \
    ${MES_PREFIX}/gcc-lib/${ARCH}-mes/libc+gnu.c
$AR cr libc.a libc.o

$CC \
    -c \
    -I ${MES_PREFIX}/include \
    -I ${MES_PREFIX}/include/linux/${ARCH} \
    -o libtcc1.o \
    ${MES_PREFIX}/gcc-lib/${ARCH}-mes/libtcc1.c
$AR cr libtcc1.a libtcc1.o

$CC \
    -c \
    -I ${MES_PREFIX}/include \
    -I ${MES_PREFIX}/include/linux/${ARCH} \
    -o libtcc.o \
    ./libtcc.c
$AR cr libtcc.a libtcc.o

$CC \
    -c \
    -I ${MES_PREFIX}/include \
    -I ${MES_PREFIX}/include/linux/${ARCH} \
    -o libgetopt.o \
    ${MES_PREFIX}/gcc-lib/${ARCH}-mes/libgetopt.c
$AR cr libgetopt.a libgetopt.o

cp *.a crt*.o ${REPO}/staging/lib/
cp libtcc1.a ${REPO}/staging/lib/tcc/
