#!/bin/bash

export TMPDIR=/home/tys-linux/tempdir
NDK=/opt/android-ndk-r14b
SYSROOT=$NDK/platforms/android-21/arch-x86_64/
TOOLCHAIN=$NDK/toolchains/x86_64-4.9/prebuilt/linux-x86_64/

CPU=x86_64
PREFIX=./android/${CPU}/

function build_x86_64
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
  --disable-x86asm \
  --enable-small \
  --cross-prefix=$TOOLCHAIN/bin/x86_64-linux-android- \
  --target-os=android \
  --arch=x86_64 \
  --enable-cross-compile \
  --sysroot=$SYSROOT \
  --enable-pic \
  --extra-cflags="-Os -fPIC -std=gnu99" \
  $ADDITIONAL_CONFIGURE_FLAG
make clean
make -j4
make install
}

build_x86_64
echo Android build_x86_64 finished
