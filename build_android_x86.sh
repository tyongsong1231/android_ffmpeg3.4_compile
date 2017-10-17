#!/bin/bash

export TMPDIR=/home/tys-linux/tempdir
NDK=/opt/android-ndk-r14b
SYSROOT=$NDK/platforms/android-18/arch-x86/
TOOLCHAIN=$NDK/toolchains/x86-4.9/prebuilt/linux-x86_64/

CPU=x86
PREFIX=./android/${CPU}/

function build_x86
{
./configure \
  --prefix=$PREFIX \
  --enable-gpl \
  --enable-shared \
  --disable-static \
  --disable-doc \
  --disable-ffmpeg \
  --disable-ffplay \
  --disable-ffprobe \
  --disable-ffserver \
  --disable-doc \
  --enable-small \
  --disable-x86asm \
  --cross-prefix=$TOOLCHAIN/bin/i686-linux-android- \
  --target-os=android \
  --arch=x86 \
  --enable-cross-compile \
  --sysroot=$SYSROOT \
  --enable-pic \
  --extra-cflags="-Os -fPIC" \
  --extra-Idflags="$ADDI_LDFLAGS" \
  $ADDITIONAL_CONFIGURE_FLAG
make clean
make -j4
make install
}

build_x86
echo Android build_x86 finished
