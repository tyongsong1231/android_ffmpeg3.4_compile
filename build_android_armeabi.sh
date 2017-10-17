#! /bin/bash
NDK=/opt/android-ndk-r14b
SYSROOT=$NDK/platforms/android-18/arch-arm/
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64

CPU=arm
PREFIX=./android/armeabi/
ADDI_CFLAGS="-marm"

function build_armeabi
{
./configure \
--prefix=$PREFIX \
--enable-shared \
--enable-gpl \
--disable-static \
--disable-doc \
--disable-ffmpeg \
--disable-ffplay \
--disable-ffprobe \
--disable-ffserver \
--disable-doc \
--disable-symver \
--enable-small \
--cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
--target-os=android \
--arch=arm \
--enable-cross-compile \
--sysroot=$SYSROOT \
--extra-cflags="-Os -fpic $ADDI_CFLAGS" \
--enable-pic \
$ADDITIONAL_CONFIGURE_FLAG
make clean
make -j4
make install
}

build_armeabi
echo Android armeabi builds finished
